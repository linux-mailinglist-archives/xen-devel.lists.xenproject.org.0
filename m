Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E03463CA21
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 22:11:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449660.706541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p07sM-0001qw-MW; Tue, 29 Nov 2022 21:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449660.706541; Tue, 29 Nov 2022 21:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p07sM-0001op-JC; Tue, 29 Nov 2022 21:10:46 +0000
Received: by outflank-mailman (input) for mailman id 449660;
 Tue, 29 Nov 2022 21:10:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xNwm=35=citrix.com=prvs=3259bd577=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p07sL-0001of-9t
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 21:10:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 476f93c2-702a-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 22:10:42 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Nov 2022 16:10:33 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5042.namprd03.prod.outlook.com (2603:10b6:408:da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 21:10:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 21:10:31 +0000
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
X-Inumbo-ID: 476f93c2-702a-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669756242;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PlGqb52dA8lZLkSPjJBw29aiaLI8MDFflDevWPQuSpo=;
  b=iHTu+koLZLui3zxUHUqZIBd0HNBP6S8Wc7nlxWf11h/q/8ZWSJ1dnuCV
   Giqmw1/z8oSeZumedcLjhWakIgfY5KwtkVK1CsfpaUFRhPIvNdyJbxo+Z
   SExDgyhFRFazWcs6QdzfZUSc9tA+xoQRBiQXnG0JrOZCW7jED/5G1LYqv
   I=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 85805743
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:L0ulRKlEEMSAQsIfoKZZnsDo5gysJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeWzqBO6mNMWCheo1+Ptjj/B8PvpaDy4VrSVE5rS00QyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5g6GyRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eMgNTUzXz7TvuGvmZObEtd9vvYqLOC+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapCSe3gq6E22zV/wEQsNAczCF67/sCH1Fe5ROMEK
 VQsoiwh+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqWMMfZQ4M4t2mqodjiBvKF49nCPTs0IyzHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxawaRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:AVzafauVEwopO5lH+2TX9cTM7skCXoAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeF+aP3CB+R2zYZSndqza05+W
 bIvgTl7uH72svLiyP05iv21dB7idHhwtxMCIiljdUUECzljkKFdZlsQLqLuREyuaWK5EwxmN
 fBjh88N4BY6m/XfEuyvRzxsjOQngoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPbi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZDIMu60vFjLA
 BdNrCa2B9kSyLdU5kfhBg3/DWYZAV2Iv5BeDlbhiXa6UkMoJkz9Tpk+CVWpAZ9yHt6cegF2w
 2MCNUXqFkFJPVmEp5VFaMPR9C6BXfKRg+JOGWOIU7/HKVCIH7VrYXriY9Frd1CVaZ4u6faoq
 6xJm9wpCo3YQbjGMeO1JpE/lTER3i8Ry3kzoVb64JisrPxSbL3OWnbIWpe2PeIsrEaGInWSv
 yzMJVZD7vqKnbvA59A20n7V4NJIXcTXcUJspIwWk6IoMjMNor239arOMr7Nf7oC3IpS2n/Cn
 wMUHz6I9hB9FmiXjvijB3YSxrWCzjCFFJLYd3nFsQoufsw39d3w3koYHyCl7G2ACwHtLAqd0
 1jJ76imr+npACNjBT101k=
X-IronPort-AV: E=Sophos;i="5.96,204,1665460800"; 
   d="scan'208";a="85805743"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoK9spwmSKWtFboYe2TWf9LbE1KCZlwTcAt0rN8KNVVKzRMHjnXc3samdFuwEfDaIaEhUXCk2hoCJPaxZOfXHVOhhR8Y9DV707loWF8L1En3Q7bHHUT1bxy1+zegGliybZlvnwqMVyZ8dDQX8TVp7eJ2wljCNtMfnCC2vNdyVh5WS2VcsXm6JzDvzFsXI89W8c8gDLH0aiIUBot8G+IAqVnB/0vv04Zvs0tjE4XNExdjI8NhWk882qQpquWkazS12gJK3e/sySX7H5WDpa/rCytKXmSKc5+mx0NaCeRWedfr7VvZb8opHHGM4wNzQPoZyYDVG0Wuy0IckBwBddD9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlGqb52dA8lZLkSPjJBw29aiaLI8MDFflDevWPQuSpo=;
 b=CfzaWEp9+XCiPQcm51X3mitR+kPoTz+yVl7DF7+Ikr1/Qj+xoifkj0kkBe4vPq3pOQu3vWlkAz7noVOshiQyVpbLH8APbwB/kPyIZKYpEKIzOUp2+RVL3pGpWNsHlzDuHW/eUQODL4wme1UE5XSQYj6LyutW/Vq5wkZvJzqjNmooiBpShqRbhzcjMeEWleRLGU/Im2uIranI6mPdUhV/zo9Bj32zLg73OZ2KnJnxHjjbELqbIz0dcI7veGzpOiOyHOClrD7VCrZbJ7Dn/as6EtdTKXkLZu/Ro45chmG4HdJBFdzByIlPg4Z/dSdf+PYN9vVNp58Vo5sUmLXYibmxPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlGqb52dA8lZLkSPjJBw29aiaLI8MDFflDevWPQuSpo=;
 b=F1Cz+frqUUsb9qsAL3+wnrMfNGzAAgwIL+KrSoOKdSlQ4/XCD75JKRDGsjMwpmmcttXibwmRlnhYxVBsT8yzPl77x4xILZ69cQaxHGLpjJrgV7U47msjINcO81rF2QgOy/DkyXTG2VWKyg42fAyIfobR49IBUFdm9MGK3zQED9s=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/mm: PGC_page_table is used by shadow code only
Thread-Topic: [PATCH] x86/mm: PGC_page_table is used by shadow code only
Thread-Index: AQHZBAKvvRJ2heCKJ0SiESCucWQuIK5WYfSAgAAEDYA=
Date: Tue, 29 Nov 2022 21:10:31 +0000
Message-ID: <caa0438a-b733-2998-32f4-e6a5c0dc069e@citrix.com>
References: <df240766-7a57-d9ce-f0a9-697fc470e1f5@suse.com>
 <4fef5b0c-4463-cd6f-15fc-47268505517b@citrix.com>
In-Reply-To: <4fef5b0c-4463-cd6f-15fc-47268505517b@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN8PR03MB5042:EE_
x-ms-office365-filtering-correlation-id: 24041e29-75dc-428f-67f6-08dad24e263e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nhJaCmlaoB3haNGbPFQqPwiNGwnb9RO/OWCK+Xh0+6F2xRVgzhE9AK1tRsFNFNVuaP725YlmMgjKKukhcPUXjKP/0Zop7ROeGFD8kMouhmE1VJ6F2cjVEg4JnoZSoIdRDHiW07WonNyVLTBpOrCJJnOzQfQPL/iYsM0MciVfY/ODBGO2RdfBPf1R/GBEhGzZGpLCUh3yXuDpiG52unePuEUinrLbdaIM7kkRenS+Wi+FdQaYH/8nPcp6HO/MPnfhP+NyLFX3a8p2E/+I8ouG39z1kwEwRcS32Xd683x9b00J9TReI3OtCNg1Z4ESSkiTKhINV7z7Yba1+SL6Y+jjlS8Yw+hR2mP9lNuZKz1AH3u/mIw3iNjZEQI3AUDIqgwWv4IdMVO8EKgdmVMQWkfDt4Jiety+Jxkj1Z16ImMYapOFGqSLUR+XqxC2eOOXE/n9FS7pJ7B+nhYTsi4rAjEqulNQP5b8HAnDgcfJcPzgZbMw33NxE4iC7I+YWvf2CtUkO2tnPK/AKZeFzYDWFqgMx7+mD7Qr5s+vYzOacoS2E+y+CIAwRsFacFoMo7DU6ne352WhTypAcbLYDla7LdwZ9CKuiIiJpuNX/AaNOyjZDYjuhFSr/EWPDxEJUy2DfWhlLDjKLKiUTkp6EZjYHe58d4UlSdY6NLoy8B1/MhZC+zm2WMIfsLmXomb6T9EAE905nvHhOemFKXzgl7CMSUJpnzl/jqKNui6Pp8nCIUQeb0Iy3zZgTZBIiddE6YM7Qu4LpxEvoN/BFNalxuKnW7bSww==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199015)(478600001)(66899015)(31686004)(71200400001)(107886003)(6486002)(82960400001)(6506007)(5660300002)(53546011)(316002)(54906003)(26005)(122000001)(6512007)(110136005)(36756003)(66946007)(8676002)(76116006)(91956017)(66476007)(4326008)(64756008)(66556008)(66446008)(38070700005)(41300700001)(186003)(8936002)(38100700002)(2616005)(31696002)(86362001)(2906002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OUZDTXlROEd5OFg4WGg2L29MY25PWE9MU0hTb1pTTDl4MEllWFVYNmxTaGMy?=
 =?utf-8?B?R0FnQUpTcU1jT2dWQUppM2RpR3ZCbE5ZSUFOUEZ6MzN4T1hFSXRxbUwvbmoz?=
 =?utf-8?B?VlhMSjkyRk1vNng0amdHT3ljSTl2L0VlQUNxNEtRVVFPamYyeDFOL0xaS0JV?=
 =?utf-8?B?S1VzZWlRQWMyMEZiTDBzTjJqRDQzKzhzMWpSNHU0WDI2RHVKZnNOZ0drTUlr?=
 =?utf-8?B?anlRM1J1ODNJNy9QMnFDSlZmVFdxemZKRWhOeStWTEs2SGthbXRSUy91ai9u?=
 =?utf-8?B?ZFI0MkZYVzNZNURrQmZQZVhFZytLQ3lzVU9XdHhpYXlDT3cxSVlwTVFSbVB6?=
 =?utf-8?B?S3BJTURyaFFyZUFGS2ZkZ3hhWEsxcnNRd25TRDIwOHk1Rlk4RnpXUmVwU1U1?=
 =?utf-8?B?cmhnNFF4RkJwdGptOVM4U0VBL28vcCs1NW90Q3I3dW9MOGVGR2xQYzZrOThl?=
 =?utf-8?B?UUltNVpCRGtBeWwyVXYwTmpwcDlXbTg4M013RldHUEovdUREZjUzTTd2ckxq?=
 =?utf-8?B?aXNZb01Sazlmb1RXUkNkRVNRdzd5aDhLdnp0VWd2YW9WQ3VLUjgwMHJNeTAr?=
 =?utf-8?B?SHdzZW9UTHVuMHFOemtsVCtod2xwbG91OWwwUEU5WTJrN1dETTU0a2hWSVRv?=
 =?utf-8?B?VW1nSTdzU2JKZXVXUkF4LzFBMjdMcUNPaHhUZktsaENFeHoreEc4Y2FBaElm?=
 =?utf-8?B?ZGl4RnJSaEREQnM0V2ZGdUhDRS9Wd3NqTCtBRCtJeWRZR0FXOUovNXoxdlky?=
 =?utf-8?B?emxZVXlwOE9rUzRpaStUTGh0RVRFU3VVQmNPQ2J2U1pVNUM0WjdLQUsrc2VX?=
 =?utf-8?B?S01HM0E4VlhZWUpmTHNRSmNRTHl4U3c3Q2pNMlZDamxVcVpLaXBWWjVKeFBt?=
 =?utf-8?B?cnpRQzZ3UVcyNGt3eXZGSXlVSWJIN0UvZyt5Y3F3SGN6eHNpWjc5Z2pzUnBW?=
 =?utf-8?B?WXZaZHF2N1Zua1lQSi9nQnljNDBqdkdicUhLa0huOTJnOFlQM3Z5RzVoUEhx?=
 =?utf-8?B?S2dpbDJjTDh0UVNPQ2RzcjRlcU11WVpZOXpjRWV4aWlUejNtRFA3NlEzamxS?=
 =?utf-8?B?dXlpMTYrQW83MStxbnpGNDJXL3dPYzFNMFovOS90U1Y5b1JKdDlPMnVOUjdp?=
 =?utf-8?B?clFnQ3I1dkVyZWY1U2t2QVNRbElXaEFLbVIrOXo3NjdXV1k0MGpiSDN3eVA3?=
 =?utf-8?B?dktDOGYzYnBjOFZvcnNHMDBKcXJqa2lmbnVVcUxIOCswVE9tM0VoeHZFSU13?=
 =?utf-8?B?K0k1WlV4SUNMQ0NNYldpcjZuQUNHMkhWempkaTUvRHd5MEJzNldNVU5hTFRW?=
 =?utf-8?B?THdyZCtMUkk5ZHhvQm1aOUdaZm1JSVBhenhJVDhQeXMzR2lBUWh6cGY0WWxR?=
 =?utf-8?B?RjFzemNpMDRDSmNCdW5YN1hhbW05dlVBc1ovODZ0WWk3d0IzWFhEQ3Naa1FM?=
 =?utf-8?B?blREdHRuZWVnRDNDYys1NlZaV2hGT3dSY2ZxMWMwUHdrMFV1K0c4Y2N5WnE0?=
 =?utf-8?B?ajVwTFVTdWEzWElTcGxrN2N0UlJqOEhmTVhPVHJ1OWVxaGNvNzNrd3F4NC8w?=
 =?utf-8?B?KzdsNGpUVFRIZ3RnUHZkdjFDWC84YzArMVZ5SnlheFg4M2dRbVhhd2ZCUk9Y?=
 =?utf-8?B?THZkbGViZ1J2M1UrMTJZZnNwbW9mMmxaaWgxQXZVYm5oZnRlQ2FCMURjclZK?=
 =?utf-8?B?UkhWZC81YnhDYW41clhod3Rid24rL0JuS2JPU0JYcjRNak4wdXRGY3FzT0o2?=
 =?utf-8?B?THNBQnR1WlAyMGJjTFBwMmtaRzdsdmE2bGVXdXlJZ3JveUJkTk05NlRManhh?=
 =?utf-8?B?R2xQNXNBc1UxTW9RZzR4L3NMZEdIR2RCZUV3M1ZPaWFHcWg4NjdhT3owVEts?=
 =?utf-8?B?dXVINFFMU2NPclBlM09rTTV4ZnErZFlUTU9wcHlVcElxWGZOaStMMW8ycXhx?=
 =?utf-8?B?dkJXOUVOVVJUbzlyaHhmLzhmOXNlWXF3RXYxVGFWRlI5eUYyTWFIbG1EenRp?=
 =?utf-8?B?THQ1SXpsSW1JSlJQR1ZsSVU3SDVlTHlTYmFGeHBkODdBT3l6SkFaVkVpU2Ro?=
 =?utf-8?B?MGpHbThyVWZHWGc4K0x3dng0WGFIbjllSFMzM1dySlNVS2l3bEdFQXdvZXJT?=
 =?utf-8?Q?4e/kpyDcFIZU/6F3kJdu8lX2n?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10C72A8D23E09840AB05E60B3E3A190F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Av6eW+aA2WnPSGtBXDfzxcEcQlqL3v1MdijE+/EK/AtxrFliu4XJXJpNkMO2FS5A0tPhlo4FpEmzl8XHeTYaeTQG8WREFfOXfvYXuT76Jb91+dCnqk9OlbaEgPBnnz1G3irf8VRrLI2dgdtPdKZSAMenbrfEk6MEZcKJhrKmkVp99UbO2stIq+TCEqeB1v4YW3rgEsGuWzmjntYGODXtIAIOxnDWs6GQHqXPU5yU0gRaTkbwOS/Q9P2vB2Hb3lZ0XdJEe5PJ+rLQMSEXc3f+T+z4lCnWdmrVd4q1RwsVozmgyxvfqBGv0sSmyP8mjNJmHS4whSdAv0Z7pXyzrfOZC2Zws0UKJy6NfLaqjJzaigko6mRYt/bhwjQCFtiRJb3EVT1rd+KHanu4mydyOJPi+VjEFgP5P2987Pdl7buvQg7pRMEL4VXdHgAmVIxncJnizMwM29MDFQTEPGyYt6uNqocjkyAigYlZP6+tZD7QsSACJvYvOPnnyOvrTndE6cDUqUtqsIYTlA5qSfJcw43CZqpXitBoxjD4g7ZFuWa7Uxfymc2i5l89g1W3UkjuKDVfjRbKOnQ/ATAi7UUtGnOLBmOBx3cMzO3VKcp8889ftBpof9jpsnFdWGlhJET2VWfG96NhvS5UXRZBQd25SgQSfQcX67bnOuThsNQSPb3Pr1aZFHCodH3hbJjPwyhPwHrAf5g87v4mSeZXh8ft2YVmJWv/A78pTTGKN7l3hZzTl5f2zmhEMmF3d7qBR2ew5OSgMOwXx6LxNRuAWBme8LebxUELn4fih4dRVr01Hn1uDatJkCI+CHX0eMbQ/2ep1aZFb1xWgRM0N5r79sXHXLEHzA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24041e29-75dc-428f-67f6-08dad24e263e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 21:10:31.7096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JA8341/Xa+iDWpc3pZLvvf7Of5N0wbC++wL6e63NYh0wiYjo5kJGGDQUZM+9EQ99gwZhXLIDAiVecZa0RxsAng/BkqA7/oIGCPSNz8h+ttQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5042

T24gMjkvMTEvMjAyMiAyMDo1NiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjkvMTEvMjAy
MiAxNDo1NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBCeSBkZWZpbmluZyB0aGUgY29uc3RhbnQg
dG8gemVybyB3aGVuICFTSEFET1dfUEFHSU5HIHdlIGdpdmUgY29tcGlsZXJzDQo+PiB0aGUgY2hh
bmNlIHRvIGVsaW1pbmF0ZSBhIGxpdHRsZSBtb3JlIGRlYWQgY29kZSBlbHNld2hlcmUgaW4gdGhl
IHRyZWUuDQo+PiBQbHVzLCBhcyBhIG1pbm9yIGJlbmVmaXQsIHRoZSBnZW5lcmFsIHJlZmVyZW5j
ZSBjb3VudCBjYW4gYmUgb25lIGJpdA0KPj4gd2lkZXIuIChUbyBzaW1wbGlmeSB0aGluZ3MsIGhh
dmUgUEdDX3BhZ2VfdGFibGUgY2hhbmdlIHBsYWNlcyB3aXRoDQo+PiBQR0NfZXh0cmEuKQ0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gQWhl
YWQgb2YgbWFraW5nIHRoaXMgY2hhbmdlLCBjYW4gd2UgcGxlYXNlIHJlbmFtZSBpdCB0byBzb21l
dGhpbmcgbGVzcw0KPiBjb25mdXNpbmcsIGFuZCBmaXggaXQncyBjb21tZW50IHdoaWNoIGlzIHdy
b25nLg0KPg0KPiBQR0Nfc2hhZG93ZWRfcHQgaXMgdGhlIGJlc3QgSSBjYW4gdGhpbmsgb2YuDQo+
DQo+PiAtLS0NCj4+IHRib290LmMncyB1cGRhdGVfcGFnZXRhYmxlX21hYygpIGlzIHN1c3BpY2lv
dXM6IEl0IGVmZmVjdGl2ZWx5IGlzIGENCj4+IG5vLW9wIGV2ZW4gcHJpb3IgdG8gdGhpcyBjaGFu
Z2Ugd2hlbiAhU0hBRE9XX1BBR0lORywgd2hpY2ggY2FuJ3QgYmUNCj4+IHF1aXRlIHJpZ2h0LiBJ
ZiAoZ3Vlc3QpIHBhZ2UgdGFibGVzIGFyZSByZWxldmFudCB0byBpbmNsdWRlIGluIHRoZQ0KPj4g
dmVyaWZpY2F0aW9uLCBzaG91bGRuJ3QgdGhpcyBsb29rIGZvciBQR1RfbDxOPl9wYWdlX3RhYmxl
IGFzIHdlbGw/IEhvdw0KPj4gdG8gZGVhbCB3aXRoIEhBUCBndWVzdHMgdGhlcmUgaXMgZW50aXJl
bHkgdW5jbGVhci4NCj4gQ29uc2lkZXJpbmcgdGhlIGNhbGxlciwgaXQgTUFDcyBldmVyeSBkb21o
ZWFwIHBhZ2UgZm9yIGRvbWFpbnMgd2l0aA0KPiBDREZfczNfaW50ZWdyaXR5Lg0KPg0KPiBUaGUg
dGJvb3QgbG9naWNhbCBhbHNvIGJsaW5kbHkgYXNzdW1lcyB0aGF0IGFueSBub24taWRsZSBkb21h
aW4gaGFzIGFuDQo+IEludGVsIElPTU1VIGNvbnRleHQgd2l0aCBpdC7CoCBUaGlzIG9ubHkgZG9l
c24ndCAodHJpdmlhbGx5KSBleHBvc2UNCj4gYmVjYXVzZSBzdHJ1Y3QgZG9tYWluX2lvbW11IGlz
IGVtYmVkZGVkIGluIHN0cnVjdCBkb21haW4gKHJhdGhlciB0aGFuDQo+IGFsbG9jYXRlZCBzZXBh
cmF0ZWx5KSwgYW5kIHJlYWNoaW5nIGludG8gdGhlIHdyb25nIHBhcnQgb2YgdGhlIGFyY2gNCj4g
dW5pb24gaXMgb25seSBtaXRpZ2F0ZWQgYnkgdGhlIHRib290IGxvZ2ljIG5vdCBiZWluZyBpbnZv
a2VkIG9uDQo+IG5vbi1pbnRlbCBzeXN0ZW1zLsKgIChBbHNvIHRoZSBpZGxlIGRvbWFpbiBjaGVj
ayBpcyB1c2VsZXNzLCBnaXZlbiB0aGF0DQo+IGl0J3MgaW4gYSBmb3JfZWFjaF9kb21haW4oKSBs
b29wKS4NCg0KV293IEkgcmVhbGx5IGZhaWxlZCBhdCB0eXBpbmcgaGVyZS7CoCAiVGhlIHRib290
IGxvZ2ljIiwgYW5kICJkb2Vzbid0DQoodHJpdmlhbGx5KSBleHBsb2RlIi4NCg0KfkFuZHJldw0K
DQo+DQo+IEl0IGRvZXMgbG9vayBhIGxpdHRsZSBsaWtlIHRoZSBjYWxsZXIgaXMgd2FudGluZyB0
byBNQUMgYWxsIFhlbiBkYXRhDQo+IHRoYXQgZGVzY3JpYmVzIHRoZSBndWVzdCwgYnV0IGRvaW5n
IHRoaXMgdW5pbGF0ZXJhbGx5IGZvciBhbGwgc2hhZG93ZWQNCj4gZ3Vlc3RzIHNlZW1zIHdyb25n
IGJlc2lkZSB0aGUgcGVyLWRvbWFpbiBzM19pbnRlZ3JpdHkgc2V0dGluZy4NCj4NCj4gfkFuZHJl
dw0KDQo=

