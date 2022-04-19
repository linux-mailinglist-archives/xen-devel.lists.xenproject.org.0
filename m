Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A268850710A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 16:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308230.523874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpCb-0001yz-Jz; Tue, 19 Apr 2022 14:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308230.523874; Tue, 19 Apr 2022 14:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpCb-0001vZ-GH; Tue, 19 Apr 2022 14:51:37 +0000
Received: by outflank-mailman (input) for mailman id 308230;
 Tue, 19 Apr 2022 14:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mThm=U5=citrix.com=prvs=101c57682=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ngpCa-0001Q6-8m
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 14:51:36 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34425bac-bff0-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 16:51:34 +0200 (CEST)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 10:51:31 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN3PR03MB2276.namprd03.prod.outlook.com (2a01:111:e400:7bbf::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 19 Apr
 2022 14:51:29 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 14:51:29 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 34425bac-bff0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650379894;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1bGjvuGeCAJgCVQvm2LlKcqO3Lx3z96RbJej+sRv9BQ=;
  b=FLRUi/RFW8rC7khEqxWs56c22M8emg1kXJOtcTZOAFV1fL0mpodeHOGC
   DjRVtFIIQQqQqRp5Mfzfaq6JarGGFC6ek4UP0PjBgnSQb47GdHTijjmga
   SV1bFAaTQqdDRMmtH+3lRUQ83DJGFdFFXIe8WrrJGrULD8DP3oaJ3CNzd
   c=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 69293554
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9O5Jy6DRVfFfDxVW/8niw5YqxClBgxIJ4kV8jS/XYbTApGwhhjJVz
 mIfCmqOMv2IM2qkL9EnPdyz/EkOu5bSytc1QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jg09Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPggy
 95vnMaWSj0DBZbIgO0cdydqLx5XaPguFL/veRBTsOS15mifKj7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t5B8mcGM0m5vcBtNs0rulIEezTe
 Iwybj13YQ6bSxZOJk0WGNQ1m+LAanzXLWwC+QnI+PZfD277zSV9l6PoE/zvasWQY+J2hlnf/
 07qxjGsav0dHJnFodafyVquifXIhjjTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDVcLhVhe1pHqFuB80WNdKFeA+rgaXxcL84RudB2UCZi5MbpohrsBebTYnz
 EOTltXlQzlmqqSISGm1/62R6zi1PEA9E2gGYiMVSBof1PPqqoozkxHnQ85qFei+ididMTP6z
 i2OrSM+r64OlsNN3KK+lXjYhxq8q56PSRQ6jjg7RUqg5wJ9IYKgOYqh7AGC6e4addnCCF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m8wWirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:DdHqj6nTy7junIudVdmBuqSk8WrpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.90,272,1643691600"; 
   d="scan'208";a="69293554"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSwUShQ2ZWhdXdyMgfPDQWSWfAu6ebU0PQ55+tHTrFojh1LHpHg2eG69Dht0lCskPCvnTtwC4fbdXHKxAttPijb6NyReTqsfKM2OzgDLaMOEeGNumKwoSzt7qEqGYtI0tTPGRvTxFQJdayYh/+B5PMQEjqLolNX3Z2nsQBrJ+IU4+fFNtlULz3nIXbfzGqXDKTGww/tcJooxwVBtkGGLMFbZYvuq8NK9qpBCnZpFEySenLmsL3+SdkUEk4BlPwMoNErtRMMS24QxOkcnQiFkOU3rcAhzslWJ4UHZZp8YLrtL6+wCRcoYH/Pz7kArHyyDRiZqIiD28fLtrvKbRUS8ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bGjvuGeCAJgCVQvm2LlKcqO3Lx3z96RbJej+sRv9BQ=;
 b=nAvTHYbFWnwHxiyKzvLwkMDOBLqIUaG2E9s/zm/mrU8GKqUgZ0bcbHpNBvx5Xa/whDR9BjDyRFYNz9OCVPgRbMgUEV5cdKQgvKnczOX8BSJoZiFhD7NErxYlJHh9x+VFUdNoVQAKZLJwqOAmumwxzGQUHoG22zuJS2iJ8KYScMvKlUUMwgCbVR9iB1Mf+JFfYtOutUiQM26dzHpbnXeLcEIrrHe0LV+wXeviOmTpnr8fEG9+F9KVGpqLcpTaouK4/VDLMKeD24n2M1gyOPi/e0gJbT5UhSo/usSYcFtkyFvDTdMt4LKK/TAKHMUtIPppnEdPrleyEAw82Tk8FxNgJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bGjvuGeCAJgCVQvm2LlKcqO3Lx3z96RbJej+sRv9BQ=;
 b=DFto1nYwHWoc3fYddUVIhjQeEqP3/SRBbgeilbS8pCeVAMB19P/0czaQ36Zb6XubyBzxS7yiU4IvkxJe9HT8OG28N5I85+YbxgLA+VKfLvCtlkBS//2IEQVr3yHNGS6amdyvdDeR2xyd3wBzwS6zCDVkdNHBgbHRCXbl25PspyM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v3 3/3] xen/iommu: cleanup iommu related domctl handling
Thread-Topic: [PATCH v3 3/3] xen/iommu: cleanup iommu related domctl handling
Thread-Index: AQHYU/TJLaBiHx5iEEKhPVMRqRiW+az3UfwA
Date: Tue, 19 Apr 2022 14:51:29 +0000
Message-ID: <1d1dfeec-6268-1be1-48e1-44b38eed36fd@citrix.com>
References: <20220419135254.21729-1-jgross@suse.com>
 <20220419135254.21729-4-jgross@suse.com>
In-Reply-To: <20220419135254.21729-4-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3e8ac06-1b14-4ee7-4f46-08da2214163f
x-ms-traffictypediagnostic: BN3PR03MB2276:EE_
x-microsoft-antispam-prvs:
 <BN3PR03MB2276700B73476714B5C4DB58BAF29@BN3PR03MB2276.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 PlRHzFuMthDHRKo+VQNpzaCYh2PGpu02dbJHuBZ88d+yEkG5VhNJ7v7v0jPsVh1MShI2hAB/fG8tNze3MYWh6yg8ZrXX1lpo/ATzeMOWXYrp3KFXYGqmTXpz++pZEdnpO+qexKIe1cD2dywzuzPqkxKXiP8IYpD2BoUHLAtYYhVQ2GaX1X8lyWpVKw00JmVDdpq18l0Yp5lD4lKcWJxlz+3TgWBht0XuM1r3v1KFvblPs6Ku3TZ027R0fX13EmLJ3aXm+B2CdRSjSRIc/8SKEHGi4MKgrYdZ8o9GyDuFNsZjT2vwV19ElMCU5n0Tc5ESQyD26QVunN5GHafQTWMIOVPaWsOF2NOmBbZDs2O8eZ8gZSJnucnN4OPX01Kk8HCAZozlWwFCf37MwMITJV6tjehGcjCJv07YwvtHmfUC/mjeiYopBUJ7mb7BAdCV+ni5T+hOYgUHmKXJ1jyQWvs0nnj+oM1Wu8dF6qyjeaYw9UrQ/Zk5TiPwe0ZWX3CtRvBJ5McBIos8EsiXZIHLP7Gy8k4U9q8U3OWaxaoWAHvkUtFmwSpAaexHdppeWqB4DWxzmrvjiZiMUR3rTs1tXj83yQ7/O/+zsi8Lmm/iFtubkU8ytO9ZqIgF0PPAfwhDALni4jw0aGGj+uTmLk8K307CYkq5W7KUPdvu6wWEBZK6ZNvoaerNQCBK3BhpD6wuMc9f05PfPv537tLfFPS3Dt6izPLPnEPRC4PHoofb+WVB6ZH5jSl8PvMtQmb75k/LIylGQU1M3udIQc8NdJgDYhjvjw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66946007)(76116006)(91956017)(4744005)(36756003)(82960400001)(316002)(38070700005)(122000001)(38100700002)(66556008)(4326008)(66446008)(64756008)(8676002)(31686004)(54906003)(110136005)(71200400001)(6486002)(6512007)(107886003)(86362001)(26005)(508600001)(186003)(8936002)(5660300002)(53546011)(31696002)(6506007)(2616005)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGRTN2UvRXNZVGUwSzlLeGpRM2RvcUZwM2NVREZXWFFoOUExU2lyUkl5M2tT?=
 =?utf-8?B?YzBWYWxqcHJ1ellxR21kVy80ZDZ6MUhwUGZpbCtYL01DTmhBdXNZaFJUWkFM?=
 =?utf-8?B?Z2p4bEthN3VsbDdyZEFHVFpjSDlXaUFtSWZQVis2ZXltazVhVXBveW41UVNI?=
 =?utf-8?B?NkI2ZzdVdldFUGNoRlRVYXBLcmljSk5RTkVMbTcvS3RqdklpNHpvM1FZRDhG?=
 =?utf-8?B?NWIwUGQva0tJZkhlQnVTNFduRFg4bmRhMysyWW5sb0ZVemJkY2NSZG5SSWgy?=
 =?utf-8?B?UW9NRHA1QVd4VTgwWXFmRHVKUDB1YWRvNGZOWnJ5TVVOcmFrZG5PbWJjVFd5?=
 =?utf-8?B?SjYvNDVkZHVWcUVySmVwai84YVRZSDZvZE9vdTZ1aHh0Um0xSUxZazlNQ1o5?=
 =?utf-8?B?UmRBbjhKbmdDSnlJYUpqRW1ITFlSOXF6WEhRQ3dXVEkrb1JhY2M5YXNKN29r?=
 =?utf-8?B?RmdFR2ZUbEQwb3VMMkVTc0M4RmZIQVpMSTlXV2NLZkdkU0RNZDljbHhzZk1t?=
 =?utf-8?B?UVdEaUFHUjdUeWNEdGVBemprNnFMbG5Dc09nMWxIL2QzazVsTTU4d0lqQWpO?=
 =?utf-8?B?SzBxTFVqS2JpUStTdXBUZ2FHWUlTRjFwMFNqeXF1QzJjTVNyL0VKb1F1ckJ3?=
 =?utf-8?B?YTM4YTVNNDNDakJFOHQrc0MveUNqd3Y4T1F1MndNZ2dPY3RQZzBEbGhTN3pI?=
 =?utf-8?B?NmhXS204V1QvUFZLM2xJcW9OOE9DOXY5WGR6cG9oVmR5REZLRTd4WERERXVz?=
 =?utf-8?B?d1YydEN4L3VWc3g1RS9ISjIxVDFVOU1YdUR6V09kMi9OMTdLeHNCWDY4WHZG?=
 =?utf-8?B?bkc1bmk3UkpZV0tXdEwzQ3BxZVVIM0tSa2FLUTlKaXFGenRKbkppTVR4TFJT?=
 =?utf-8?B?NHlTYWppSml5N2RXemFWRFRYNk5mZmszVWdiakV3alpGWjZ5SWVyY1pjTk82?=
 =?utf-8?B?dkdGd2hhSzgvRlJEeXRwRSthSmtrOFA4eDZGay9Nd3dlcnBZVUZrNGJuS2pG?=
 =?utf-8?B?S3JUeDc2OVU5aEw2YTRXWmFOb0F2eWRWL3ZOcmtLY1V5Q2ZRWVBveTZzY09i?=
 =?utf-8?B?NlJ3NlBEYWEwR1k3YjFJTTFWYW5mbWtYMjFTakQycXRMVy95d01OMHREMDh3?=
 =?utf-8?B?WlBNMVordUorUklnUVhKZEFtWndnSmFDb0Jta0pPZkt2QWRsdkhZcGJDRlRD?=
 =?utf-8?B?ZitzTzZsYjgweEd0YlA4dTgycm5RUFp4S2t5KzZzV2JOenlKNVU1VUhPQzRH?=
 =?utf-8?B?T0pUWDU2bzlVZ05FaVBSMjBTcFNGankwb3FyMHdHU3J2QVkrNEpzcnBNczNK?=
 =?utf-8?B?OXhQeXA1Z3A0Q3lvdVk5UUZlbndVWkV0M3phL056ZGQ5UVdUanlzOEFMSlNG?=
 =?utf-8?B?TWV3aitHK3BNajd1NE5yR25oOXN2eDlacE9VRVppUG5yU3gzNlNXUmFQUHhi?=
 =?utf-8?B?Q3R1cktqOE9PdXRnVE1TcEdRM2JkRmxnNC9TaWYzeExidVl3VGM1M2ZrSzBJ?=
 =?utf-8?B?V0hDRmNZbnVIQjdWeHJHUGtXbmxDbGx4cTE1U3hicU9PMEpRb2NYOFJGcXp6?=
 =?utf-8?B?dEVmQk1YQWdTY0JqM0RaSk0zc0xVc05zU2loVkc3NWlDRHo2WGJaR2h2b1JN?=
 =?utf-8?B?alpDMVlWZmh0RGZlRW0wOW54NHkvRHpwQldxaHVZaEM1Mno0ajdzNmFFYzhz?=
 =?utf-8?B?SG4xMUdPNXdENjFmeVNQUFN6R0pnQ3NJTUwxcWVrQ2gwR0tPU3lZUU1QQTJ6?=
 =?utf-8?B?Rm5qM3IreU1KRStKT3BLemRXV2xQM2tKUmRsazlNSWZISE5ldUdKeENOb1h5?=
 =?utf-8?B?WVBER0hrV1JJZjRyRjh0WEUrZzNVbTgzN1NGc1NjcTV4c0hQVHBLZVhiSncx?=
 =?utf-8?B?UGJKazFWQWRFWEtuMmxKeWNoRjdkUjhpMzdFVWF6ZTlqRkRpakFSR2JhOWdJ?=
 =?utf-8?B?NjVDVnp3NjdIT04wYUpQaE1sbERmTWJnV1VQRS9CZ0VaT1VWbTBObXlLQmxa?=
 =?utf-8?B?T2Y2MkZvcEF5b0NsNGt6M0JtMDZhbUJwTnIxemhGYUc4NXVMeFkvU0hjeWs3?=
 =?utf-8?B?TU8vQWRsR205a2pVTVNCcWU2ekJsVzhISW9Ub244cTlQMm5FM3g4SFJHY0Qx?=
 =?utf-8?B?cStzbFFBMThUMktKeVdFQjVyUEZSdkRTOHM0Y0xDMkZlcmpBUVdYeFd1RFZh?=
 =?utf-8?B?cmt4VG5JZW9PSTJaaHZISnhWUmxpM0VwZjZPUnpGWUhwR1IzNi9oMlgvekpL?=
 =?utf-8?B?cndlYWcrZWhUTnFtdnBsWTNhQUpQQk1GbUtFVURRN2tVcEpRczkzbFlmOGsz?=
 =?utf-8?B?MjZFYVR3N05oeEg3QUdPV0JoeEEzOWU4MGxhWFlKMlZGMTdCdEFQZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61CF49E8E128EF4E80A84D3BA53EA2AE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e8ac06-1b14-4ee7-4f46-08da2214163f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 14:51:29.3034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i8hxkFSFUWY0sEZpFLInCqLTtV9Wri1QyVOk+9LVGzGTGVluBMYy8zL4iKod8j1p9hdJ+h20+KcqlWW1Vjn4h5f9k+uFXT1MblJAhDw8qwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2276

T24gMTkvMDQvMjAyMiAxNDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gVG9kYXkgaW9tbXVf
ZG9fZG9tY3RsKCkgaXMgYmVpbmcgY2FsbGVkIGZyb20gYXJjaF9kb19kb21jdGwoKSBpbiB0aGUN
Cj4gImRlZmF1bHQ6IiBjYXNlIG9mIGEgc3dpdGNoIHN0YXRlbWVudC4gVGhpcyBoYXMgbGVkIGFs
cmVhZHkgdG8gY3Jhc2hlcw0KPiBkdWUgdG8gdW52YWxpZGF0ZWQgcGFyYW1ldGVycy4NCj4NCj4g
Rml4IHRoYXQgYnkgbW92aW5nIHRoZSBjYWxsIG9mIGlvbW11X2RvX2RvbWN0bCgpIHRvIHRoZSBt
YWluIHN3aXRjaA0KPiBzdGF0ZW1lbnQgb2YgZG9fZG9tY3RsKCkuDQo+DQo+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gLS0tDQo+IEFub3RoZXIgcG9z
c2liaWxpdHkgd291bGQgZXZlbiBiZSB0byBtZXJnZSBpb21tdV9kb19kb21jdGwoKSBjb21wbGV0
ZWx5DQo+IGludG8gZG9fZG9tY3RsKCksIGJ1dCBJIHdhbnRlZCB0byBzdGFydCB3aXRoIGEgbGVz
cyBpbnRydXNpdmUgdmFyaWFudC4NCj4gVjM6DQo+IC0gbmV3IHBhdGNoDQoNCkkgZGVmaW5pdGVs
eSBwcmVmZXIgdGhpcyBhcHByb2FjaCwgdGhhbmtzLsKgIEluIGFkZGl0aW9uIHRvIGJlaW5nDQpj
bGVhcmVyLCBpdCdzIGFsc28gZmFzdGVyIGJlY2F1c2UgdGhlcmUgaXNuJ3QgYSBsb25nIGxpbmUg
b2YgImRvIHlvdQ0KdW5kZXJzdGFuZCB0aGlzIHN1Ym9wPyIgY2FsbHMgd2hlbiB3ZSBrbm93IGV4
YWN0bHkgd2hhdCBpdCBpcy4NCg0KSG93ZXZlciwgSSB0aGluayB3ZSBuZWVkIHN0dWIgZm9yIHRo
ZSAhSEFTX1BBU1NUSFJPVUdIIGNhc2Ugbm93IHRoYXQgaXQNCmlzIGJlaW5nIGNhbGxlZCBmcm9t
IGNvbW1vbiBjb2RlLg0KDQpJJ2QgZm9yZ290dGVuIHRoYXQgaXQgd2FzIHVzZWQgb24gQVJNIG5v
dywgYW5kIHllcyAtIGl0IGFic29sdXRlbHkNCnNob3VsZCBiZSBjYWxsZWQgZnJvbSBzb21ld2hl
cmUgY29tbW9uLCBub3QgZnJvbSB0aGUgYXJjaCBob29rcy4NCg0KfkFuZHJldw0K

