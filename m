Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287B450C29C
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 01:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311304.528477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2NR-0006Gw-0y; Fri, 22 Apr 2022 23:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311304.528477; Fri, 22 Apr 2022 23:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2NQ-0006Em-Tv; Fri, 22 Apr 2022 23:07:48 +0000
Received: by outflank-mailman (input) for mailman id 311304;
 Fri, 22 Apr 2022 23:07:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+xj=VA=citrix.com=prvs=1042e1a12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ni2NP-0006Eg-AC
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 23:07:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe6a635c-c290-11ec-a405-831a346695d4;
 Sat, 23 Apr 2022 01:07:44 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Apr 2022 19:07:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5428.namprd03.prod.outlook.com (2603:10b6:208:285::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Fri, 22 Apr
 2022 23:07:28 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 23:07:27 +0000
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
X-Inumbo-ID: fe6a635c-c290-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650668862;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sbxOhCfN9nkn/L+LnqC1edIGhfUPvHS5KTv1L7nfA7E=;
  b=BS/Qs+KwDEYJ7UdWIQA7NvaPpdHgr1nz3xIL5pASMpKGxgnyotIMxi28
   cJ+UOX02OQS1Nib7QXemKjGcPnJHxIG/V5BhBNvPb526HndA2uRCJzoWu
   aZmt/VUnORaYtoZv+m+A+NlFJyQQDYg8FtI2Y8Ad8vA47dwQNlyLWi4Bz
   Q=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 69624674
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:t+kDIaC3zDg+oxVW/wziw5YqxClBgxIJ4kV8jS/XYbTApD123jEAy
 DdODWqOPP/eZGOme4wgO46/80lT7ZHXxoc2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jj2NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh+8
 4tTuY3gdD52M7/SpL80EAl7SgxXaPguFL/veRBTsOS15mifKj7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t5B8mcGs0m5vcBtNs0rulIEezTe
 Iwybj13YQ6bSxZOJk0WGNQ1m+LAanzXLWwG8g7L+vZfD277lQMpz4e3APrsQ/eVZchpgFzHn
 VPkxjGsav0dHJnFodafyVqgnvTKnD/7cIsKGaek6+Vxh1mO2m0UDgZQXly+ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9hZFeEg+RyO4qXR6gedQGMDS1ZpZNMqucAsTBQ2x
 1SJmJXvHjUpv7qLIU9x7Z+RpDK2fCQQc2kLYHZdSRNfuoa65oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr7hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:RzvOGq2U1DYacpnHZ0kwOAqjBetxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hcAV7QZnidhILOFvAs0WKC+UysJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQjuVvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEw9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyTpAJb4RGYFqjgpF5N1H22xa1+
 UkZC1Qefib3kmhO11dZyGdgjUIngxes0MKgmXo/EcL6faJOA7STfAxxL6xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMMjgZJq3PoiFXluYd499ePBmfIaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATxRlCvgEl7d1amm1F+IM2SpFC6e
 iBOqN0lKtWRstTaa5mHu8OTca+F2SISxPRN2CZJ0jhCcg8Sjnwgo+y5K9w6PCheZQOwpd3kJ
 PdUElAvWp3YE7qAd3m5uw9zvkMehTIYd3A8LAv23EigMyMeFPCC1zxdHk+1829vv4YHsrXH/
 6uJZM+OY6XEVfT
X-IronPort-AV: E=Sophos;i="5.90,282,1643691600"; 
   d="scan'208";a="69624674"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKM0VQ7W9oBIzdQsPQRbLxA6/PPQ8JbM+5c+dvXIBw8n1eVQzNg6Wr/kVzVxeE3aP1grHt2xfiFWmWMO5DZffBiyOY09ZNtI9BC1A1a82Pdv1fbRjZVsvglQr1mE65drXmcaWzoCE4pUzQq5Ho6Agqp4C/CJDCF7sPlZMgRaB04HQpmMtmznY4L9V0OuZ5a5lY6F/hyc7hYgL65aW/yTgbSDvV8znZdJXW3nLR0Al0Mrq/9ynlKWz7tUOHbN2piZzAYev6i5ygfID3ghBT3yxNFYfK5Yr3BDF01RYKPxfsxFf/rT2dDIVgqJFvq7W3/BFl7XR7CKSGh9hijOdNURAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbxOhCfN9nkn/L+LnqC1edIGhfUPvHS5KTv1L7nfA7E=;
 b=DpYrBdJkOzrwgq0rtZajwUnQew6yPXfshQboHFeZgfyjox2i4jc1whNUSXxbI0ZKInn2vka+1RVzPHItbWrNemg3EGmX2AKGutPdtZBn6BuOig5yPBADzk7Qv7k8aUq3TPH915ZmQinXYnT83/Y82zm+Rt9gPsoGj+Uuph3odYT91m0klsq7PM8URLdqNnUygY2q4bqxTkuxkMBLJPGXpl+lQpASP7vVO45nA7j9BQRFEIWNGgD+PP7BP2yUv2el2aA/LbTwRupE8a6J2Zn3QOl/thgaWCn25FAvpbpEH758QU63p8xPO/UTJLq+tq8SW87LvF8hX4P8Xy4r18pxFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbxOhCfN9nkn/L+LnqC1edIGhfUPvHS5KTv1L7nfA7E=;
 b=NuUmg4dUXXwJYe5Ff3jy2esJP7B6OwWjbi3l3oX9OGjzhzZufq5Zrz3Dhgol+tcRJW3WqcmdvLHuOhI2Re7HRoGQOq2MjChGxZA8wwIoLLomaJHoi/rKlWNb0kfhmMG1PE/qXZYCm5n85VmeQOfuhnKETcOchct05m7+EF1CZAE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jandryuk@gmail.com" <jandryuk@gmail.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH] xsm/flask: code style formatting
Thread-Topic: [PATCH] xsm/flask: code style formatting
Thread-Index: AQHYVoFX0AAXIBUsy0WDoXcUztv2Zqz8jnWA
Date: Fri, 22 Apr 2022 23:07:27 +0000
Message-ID: <5b199cfb-98c8-c382-82b3-a60819a0e977@citrix.com>
References: <20220422194344.9318-1-dpsmith@apertussolutions.com>
In-Reply-To: <20220422194344.9318-1-dpsmith@apertussolutions.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8ceeebe-51fa-4b6f-7745-08da24b4dedd
x-ms-traffictypediagnostic: BLAPR03MB5428:EE_
x-microsoft-antispam-prvs:
 <BLAPR03MB5428DC40C30C8CB6BFD66820BAF79@BLAPR03MB5428.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eZ9Fqnz7I8fgYkI7eDgZDH+IpDLo/Pi1iBqV2SaKeywYVhXrMpih/oWkuRz8rCaWXXujjtZA8S1VWqsuyblCdcT6i44norylCxa7idOTrk+mRCTudG2rui49MmIUHb+/CDQa3gLHbB9WltlCx/6kw477Vs8g/GgaBBPBFaSdxxTbjUYMKcbJacYee1MRjdiHk4C0pNEUomhX1NwK3WXLhQhplgrvgl1w+x1sJACZz7n+dZsbccSJ8uO77Bmo9jxI7OOCJsWfbskzoOWjsV5glaDSc33FGvdQJ88A9IgjoiA4Ly4NGOyQMhxC7IQLfAS9lP3F46xteu38H6D9NkBjibcR+yxg+vO6wItpv61bEEIydrcqWOBZP8cqXyQSEtbbrn6vNL5oESc8XaI204gdCaqxFqbFApl0Qww4UfQCOQnwL0lt8oyjtNXk2bkv7aXS8+9+Wyymp6hysRW35RmJ7U8As4hbaGKx4Jpq5IemBZ/83WHjuTBcxvyhaInGeoDhjiwPRsEEbFlDt/LfpKR6N0t5fFjup5IiYgb5yE+rq67JbwicnKDuTrcA7lsxSwl9BemTzlObPVlgPRaMj0LnnPWfUa4mh6/uu2HZflCDWscQwckTu9mQKETfYJ/9nOX22KxBk/GI8XVwvJt0NF4i8ZrYw9LgF9m2kERjy4I6Cp3/sS3d+aikFLFkXkZvcbGyUaRzi/r6AIafG0DjlHWiFVIHJ/x/T7eWpszVSA5JBKBKId4/PSY9FYtrz3i0LtkcdelIaeqWNMc5n3OgQ4oHCw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(186003)(508600001)(36756003)(31696002)(5660300002)(8936002)(38100700002)(91956017)(66476007)(66556008)(76116006)(64756008)(66946007)(38070700005)(66446008)(110136005)(54906003)(316002)(6512007)(86362001)(4744005)(8676002)(4326008)(2616005)(71200400001)(122000001)(6486002)(82960400001)(6506007)(26005)(2906002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cUVDVnBtTVZsT2orUThWWFg2UE9STElaNGtMbzZPaHZlY1gyWDIvaEljRHNC?=
 =?utf-8?B?Q1VOSThodE1lTFNaMDhCUy80Q1RtV0R4eXczTFN3aWZKdEZmUzBJOXN1bDlE?=
 =?utf-8?B?UmhQZi9hVXFnVkVJaldRcWRQeEFxRThWQnpZUXhFZUNjd3lZMmdZb011M2Ro?=
 =?utf-8?B?dGtqWGZHdGlRTlFjY2t1cHZUOHZCcmFOVnRWdlBMUllDRkVhZmxFc1ZmWXJv?=
 =?utf-8?B?R3VnS0IyQzNFRHY5MlRjblBDUkVDT0UzUmJvQ2RyRnRYV0NHSjY5U1NzYXcw?=
 =?utf-8?B?RWNpb2c1Qkg0UFlkSjdPU0tGSFZQcS9zcTZVRWZDKzJXWWlKRXdRUVRNOVVI?=
 =?utf-8?B?dERaRFJYbHNCeWxVVEZRL3lNby9tcElub2JtMitISmVPd3c1Zno5aEhNR0cw?=
 =?utf-8?B?TENmUW0xT2kxUDdrNzA1Ryt0TUJPVkNJcm1qN0J5Qm9KemRSaVVlRy9FYlp3?=
 =?utf-8?B?NE1INVNhZDRidU5qWVBqajJCTHBkQ3pnc1hFbGUrb1F2eHE5d21vTk9wTHBx?=
 =?utf-8?B?b0VwWGJ2NHN2VEZOdGwrcVN2Tm41aDZ6d1lKRlpEMFRBRmxmTUdhNGdWMnEy?=
 =?utf-8?B?UlZOSG4ralYzVFpDekk4cVZtSWx5aDY4THllVzRaTUFZUDhPTlpRdzI4USsw?=
 =?utf-8?B?L3ZHbTNwQURPR2dCMEJlYU9LQ1N5MzRaTE8wbG0xUWtJNnBwVE1BNnhNNGNF?=
 =?utf-8?B?aXlxRkk2VHFxeUFnallrUEg5bnJ2R1dZVXp2UnI2b05zRVc2RTk0RDhmeDZP?=
 =?utf-8?B?emtpZjZSOHV6OW1IOUdmNGphNEd4V1hudVUrck4wNjlrZk9Md0dXZWZSQlIy?=
 =?utf-8?B?ZDc0bnBTMmlPZnJocGhKY3JHTngySVdxc3RZRCtFRHBXOG1IQmZvQlRhYm0x?=
 =?utf-8?B?UmV2MHdmSUZSOXJaRHdpRXU1aSs2bEp3Yi9VWDh1VkNYREw4VmR0SjVIZW95?=
 =?utf-8?B?U0FueXo2K25zWGtrem85b3pRRXFIbFQ4WUtYNmgvcGFLYUx0ZXFlSG9WRUpQ?=
 =?utf-8?B?ZHBTditoQW9kVkdSR3lDWVZJN3JPbEM1d0hWbVczb2lsKzlWUXRKelZXOUV5?=
 =?utf-8?B?NTIrTnZYRDdRMjFLNUZsem1wT3RwNVJnc0FKVTBaSllqRE0wU3d1MmZ3MGJl?=
 =?utf-8?B?NitUVXMvRGVrOXRQMU9td3NvZUs4OXpzTUZSTXZibkROaFlHYUV4QzZoVGFC?=
 =?utf-8?B?cjJhcEg4T3E5RHFZM2lEVXN0OEZzV0d3NnBweFdNYTFRQjA5N1l6ODJjNEtZ?=
 =?utf-8?B?MjcyT0ExYzdrb3VIYXFocDNraGNCNzZSU0cwTXJIZjFjd21NazN6U1hzd29j?=
 =?utf-8?B?NjBIbTB0a0NpblVsOTVFbGxBeHNxOUNEdlEvQ0k5Y3ViVllCeTRwSTlzdnJC?=
 =?utf-8?B?QlljbDdVL3R4RFM0VEhJU0g1eUt3L2QzL0c1VWhvckFXZlB1Z2hqRUxjSkdC?=
 =?utf-8?B?NHpFclRrdFF1ckJkWkZiT2p6NFVXRFlBdU1xcWg0Zi9mVFJkQjFyWndXb3ZP?=
 =?utf-8?B?MlgvMWdGWGtwc3c5QXdldHhqRm9USjQyR3hZVHNlQ0xOM0xnUldJNXVveG95?=
 =?utf-8?B?K2x3SjlHVm9hL2JXM2tFRXpUUjNFOHJhTVhaTHY3RTY3RXR3bkJRaHNoTDZ5?=
 =?utf-8?B?dVlGdGwzVzVvZDZzL2t1Zm52SmNFWjZzZHRSdzcvbHoyNlUxOSs0WGRyVFRM?=
 =?utf-8?B?UlorUE1TMllqUmI3VGJvcDljY1o2T1dpNzBuYmdXMWJXTTFEaU1MbWlKWmJI?=
 =?utf-8?B?MTdCTHk5d3lYZGVlUXlweGNvZXVTeFZJcGtkRjRaNGNVVUJwL0NhWlJKdnB5?=
 =?utf-8?B?WmxxRldEZnplM3E1bks4NVBMVFJrMnZ6S21aQkFFMXphejh6NzlaT3FxTjE0?=
 =?utf-8?B?NkhqalpxSGFwcWUyYXhHTzg1SEVXbzVnQmk4WnhGbVROMnRjeVRhdTdyazM3?=
 =?utf-8?B?aHl2bG9jdzhzcmJTQW1WMWw3WHJsSnUrN3NTaGZURHp6a0EzNzBKWVhDeHZy?=
 =?utf-8?B?eVY5RGMrV0txWUpSUnFiazFBMzBjdUNKRGhWWXdrTWZVVVNQQTMyeEYxaEJC?=
 =?utf-8?B?MUxLWU9JaUIyWDlTSTBEVHBoLytMUXA1cEFRZEtLZzVHU3hGU0FDTnhqVlBM?=
 =?utf-8?B?NG5IV2Q1YUgrU2NvSHZmYWswcFRDVWFrOEFma1hhbXAzcHVMbnBTNnlZNjl0?=
 =?utf-8?B?MXY2T0lBenRvTUF3SzdweEEwWlZmdWw2c3J1a3ZXVWZYK0hOWldkYUQwYXBu?=
 =?utf-8?B?YUwwT21nK3E4UUV2aGl4Y0ZOdGhVYXlFbElEZFRKRWsxbXByWFNmcVllTmhE?=
 =?utf-8?B?azFuVUY0NENHaGZIS3dRUVVGbEN1SElaOXVwME1KT1JxelZVR0tqdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <631FC9191B9702419D52C52DD0942BDA@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ceeebe-51fa-4b6f-7745-08da24b4dedd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 23:07:27.7646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sAHu98U3PIM6dGTLpbqEcj5UWwdgObhT0yqO1zWMB48y43mUy1Iti8iuRfydZFBEobjInd4gkIXXz4va4bELkCxEex2QBm5pSoEWd8APA5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5428

T24gMjIvMDQvMjAyMiAyMDo0MywgRGFuaWVsIFAuIFNtaXRoIHdyb3RlOg0KPiBkaWZmIC0tZ2l0
IGEveGVuL3hzbS9mbGFzay9ob29rcy5jIGIveGVuL3hzbS9mbGFzay9ob29rcy5jDQo+IGluZGV4
IDBiZjYzZmZhODQuLmUyZWJiYzc3MTYgMTAwNjQ0DQo+IC0tLSBhL3hlbi94c20vZmxhc2svaG9v
a3MuYw0KPiArKysgYi94ZW4veHNtL2ZsYXNrL2hvb2tzLmMNCj4gQEAgLTEyMCw4ICsxMjEsOCBA
QCBzdGF0aWMgaW50IGdldF9pcnFfc2lkKGludCBpcnEsIHUzMiAqc2lkLCBzdHJ1Y3QgYXZjX2F1
ZGl0X2RhdGEgKmFkKQ0KPiAgICAgICAgICBzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MgPSBpcnFfdG9f
ZGVzYyhpcnEpOw0KPiAgICAgICAgICBpZiAoIGRlc2MtPm1zaV9kZXNjICYmIGRlc2MtPm1zaV9k
ZXNjLT5kZXYgKSB7DQo+ICAgICAgICAgICAgICBzdHJ1Y3QgcGNpX2RldiAqZGV2ID0gZGVzYy0+
bXNpX2Rlc2MtPmRldjsNCj4gLSAgICAgICAgICAgIHUzMiBzYmRmID0gKGRldi0+c2VnIDw8IDE2
KSB8IChkZXYtPmJ1cyA8PCA4KSB8IGRldi0+ZGV2Zm47DQo+IC0gICAgICAgICAgICBpZiAoYWQp
IHsNCj4gKyAgICAgICAgICAgIHVpbnQzMl90IHNiZGYgPSAoZGV2LT5zZWcgPDwgMTYpIHwgKGRl
di0+YnVzIDw8IDgpIHwgZGV2LT5kZXZmbjsNCj4gKyAgICAgICAgICAgIGlmICggYWQgKSB7DQoN
CkJyYWNlIG9uIG5ld2xpbmUsIGFuZCBpbiB0aGUgc3Vic2VxdWVudCBodW5rLsKgIENhbiBiZSBm
aXhlZCBvbiBjb21taXQuDQoNCk90aGVyd2lzZSwgTEdUTS7CoCBBY2tlZC1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg==

