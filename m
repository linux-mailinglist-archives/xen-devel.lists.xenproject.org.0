Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544A144FE75
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 06:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225651.389700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmUtx-0007tK-TS; Mon, 15 Nov 2021 05:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225651.389700; Mon, 15 Nov 2021 05:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmUtx-0007qQ-O0; Mon, 15 Nov 2021 05:51:33 +0000
Received: by outflank-mailman (input) for mailman id 225651;
 Mon, 15 Nov 2021 05:51:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rbjM=QC=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1mmUtw-0007qK-0r
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 05:51:32 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1193721c-45d8-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 06:51:28 +0100 (CET)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2021 21:51:24 -0800
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga003.jf.intel.com with ESMTP; 14 Nov 2021 21:51:16 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Nov 2021 21:51:14 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Nov 2021 21:51:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sun, 14 Nov 2021 21:51:14 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 14 Nov 2021 21:51:14 -0800
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN6PR11MB4145.namprd11.prod.outlook.com (2603:10b6:405:7b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 05:51:12 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81%9]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 05:51:12 +0000
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
X-Inumbo-ID: 1193721c-45d8-11ec-9787-a32c541c8605
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="220271420"
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="220271420"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="453716062"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADJMyQ4NRUpHKVwcIvQTmmdFFnNxtcwtq0LhBRKcoJN29AxrKUmiL6B3X9+yrXYye5VH20dWZvqDrBMhK8QCiLHR5A6LQNvfG76IP5IMnw1v2jB8QnVd27tsVnJqzXTHhoTQDkT0jZ5clR5EoGHzK4/FodVl+X3ktMfb+VW8Ym1BHbYEonQKhsn1lXgq9nl8BpcfZ8ChJTmSllvmSRsGw7A1qdCY0dmjMFLlc0L2/+yr3Qq1X6Iok3HW79hp1vpKtUwyzZzR0U4XdFG5UGQ/rDg3U/R/GOiU0xLbUBdqOLQqd9SsNMVoIz91l7EfmCpXqln9BFnIJTC/dhOdAhUauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhIxBiYeDO8NqqFPqT47MOHEGkeEkcGoHosdRwk1VDQ=;
 b=OIvFfbBEaFa1NKpYgPsCD9NtZObAeTzQsvuiXYbjdH3b0OCyHRUaWXPru6JK12YDuo+5B5yhFw1TdtqrFhiLA7IwgY/TrvGaudsyvsqjhjVNpWNpzrOkjnHx4j8a7dvvmVHTDfdY2hgd5TAxBT7GSICM9K7FzHEyAqe+mi/r7w841iFUdwnWhU63nbaXD0XzhnqsOgk3OzfVuzfbUrrFo5/Jx82LUcCagsFWchwOW93wMk4Ybe9FV7nsPsOXdyQntLzUnURt2clWZtNdkn1xR7RgLRTLILFetg4XQiCaxeTFObXTS1Rp2szxbCCqIaeml0n3An8R8e/kgf26F8MNCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhIxBiYeDO8NqqFPqT47MOHEGkeEkcGoHosdRwk1VDQ=;
 b=CAtwiJpkRzWdtYWel8VpI5q1FQgm1dyam/DnQE6AD78rvxjw1FWd4WoA7dm33MiMXzht5HkTfWBlkFNvgs0nzc7bMsaZTircIYmN1TLgP0+fUZbssmK3qWccFVIr6iR8V0EcWak77F/ew/RAL/bvh8N/QmXxB0KJsfhacne+IA8=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 4/6] VT-d: tidy domid map handling
Thread-Topic: [PATCH 4/6] VT-d: tidy domid map handling
Thread-Index: AQHX16qTgTKvSTsW3Uqd1am9I012FqwEGi+Q
Date: Mon, 15 Nov 2021 05:51:12 +0000
Message-ID: <BN9PR11MB5433E4185FF209460F28E65B8C989@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <7a802a25-8d86-d1de-446d-0e2d86b5a54e@suse.com>
In-Reply-To: <7a802a25-8d86-d1de-446d-0e2d86b5a54e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8c573c3-515e-4a3a-716a-08d9a7fbee79
x-ms-traffictypediagnostic: BN6PR11MB4145:
x-microsoft-antispam-prvs: <BN6PR11MB4145AC1DA6046847208F3F918C989@BN6PR11MB4145.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:126;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: in8/EZU7ayHw5vW5zWr6bMBorcol2DOsLD78xLpS4eZ6I6GgTsWeReaDaLBlOM7nVZiKQSnT17ZTDM7IjFhUcra4IN661dNU+sRxH6xcgn0WX7ODSw+lVbosg669P66dnYpb+6JyJdzUkBzkqiVXfTdS9K88qMOeBCQjBJYPqExbMeGQkz/stGvEz1UTivT/7ajlZoPJJO2EoCOJErtURB8n8iJso4JsMq8Le4A8zg0Zhy7DGW/n2OpOeAWgUxgo4mlKsfYqMNo/hbOG0BDK+mAfQiGexauI54q8EpmaE1HScxHG9rzo17tz7hEaMuTC6IJGoYWjGKm2MgZroDaMOMWzNC95PpdKeG8q/GhJSo+2dQKfpBC07Y9kyFZQEhjftpe27xY+Ft95iH3jmibn/vak7yizhRSB8nz/oe+bDByQO2IbO4NZJBOlnCuXjLWTroRpF7tTmN2yTc0zi8XUe34tr1NzHwFfbxrwn7zfSNYayqaH4SpnfcDS3lR4e05JWH+aLL5cQiTsk+Nc0W1tGoRx9FRzx+cojO36WUlqrCQS8reOJugL9aBVGIBoguWRssL6uHKlehSkQTo0h0MNtVvzrESmGBdwGr1uQdpFZJrHjz2W1exKCmR4rHl2i2ieBFU0b6sGV4L6yo4EpMZJwknQjiSdGu14/YxyTt202AkzbhBCx8xkdjijkI+Xeu3umvuwzv7oxzGWyOeyhQF0sg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(64756008)(66446008)(26005)(7696005)(52536014)(8676002)(8936002)(9686003)(508600001)(316002)(2906002)(5660300002)(71200400001)(76116006)(186003)(66946007)(38070700005)(86362001)(83380400001)(82960400001)(6506007)(55016002)(110136005)(38100700002)(33656002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFFTWVVUNGVvcnZ0ekpGQnMrZURyNFYrbnpIcEJyNW5TWXpuZGZKaithYXV4?=
 =?utf-8?B?SFNqam0wTERBazdTRmpsYVdjcUZlK096SlR2VStYbWM5cTFIMWJyQnFyVnpr?=
 =?utf-8?B?cWdtMHAxRzlYbjVBN1ZYOVBKMy9QQldtblRDU0paZzJqWlJlOE4wYm1sYmVj?=
 =?utf-8?B?dFVpRlVHd2VDM1gyam85ZG9BempvbTZPREpSMThWTkFPRTNUWjd0NnZIcFV0?=
 =?utf-8?B?UERTeHpMVW8rSXBrM3ptcDRoZjY2Zy9MZi9TZ2RoQytyVWF1N29BQkVEemtm?=
 =?utf-8?B?VHRzQUNVaXBkUjVjQ1FmQjJ0U0JOWGk3TGVQV2dkTEtXSDdCaUljdlBGQ1dq?=
 =?utf-8?B?QmVtT210TXg3K0dhNjhRUXltdWx4WmtoYWtYWHVMaXpxOHpFbHpLTmhUZVFZ?=
 =?utf-8?B?d2Jzc0RkRVUrTFNuNWQyczM1YS9pM08yTWZiUDBSdUdneDIzWnh2SWZJZzcy?=
 =?utf-8?B?Zk55UmNOU2JpaUxYNGFSVVlDRkcwN0pRN29Ddmh0dksvQkJSRDc3VHdaTEdR?=
 =?utf-8?B?cWlrcFRoemNwMmh4THdsSTZPalN6TlRVcTg3Rkg5R0QrSU14RWpkY3JvaGlj?=
 =?utf-8?B?d25WT1NnbXdKTE1TenBYN1ZOY0R6bWxlU0JPR1c4YnE5Q0xuMHBmVHRyNmhP?=
 =?utf-8?B?QU1ISmwwUFc3WlJyN2JibEtOaEJka2J5ZDh1OGlSQVhRdUFGSy9UdHNSU2NE?=
 =?utf-8?B?MXpqeDVuQVM0dDJLRDdGUVhMdGkwVTVsTm5uZERlck9pRlExL1QvYkhIQ1A3?=
 =?utf-8?B?c1Fya0VwOHVXYWt1cDdBOVEwdEFlK2tVcDdSejBtUUo2d1VYVldXZUtHZGJ3?=
 =?utf-8?B?VVZ0dUY4cnE1UVFlQXVibmhzZ1JRRURQMGtNcFhrOUxMcEM3TEhRbTFvVm53?=
 =?utf-8?B?VDRNNndwQXh4dExGTllTN2hPM211cHdGU0xDdkdpTXpSR0lDSFJncEZzbklP?=
 =?utf-8?B?OUJMVkRmYzd1Sk1tdlNPcDBqKzVjUVorUENWblIrc0JwV25HNXVZZFh5YlZW?=
 =?utf-8?B?QVhqRHAwYXY3VW4xcXJXSjR4OHMxYllUSTFScUZ3eDdsbWQraUhsZEZFblFQ?=
 =?utf-8?B?SHBQTWRXNk14eXNFUXhNRjM2eFozZmVWMDluODRLQ1V2emFLc0hnQmpOUUsw?=
 =?utf-8?B?aEFNMUlMbm9DTkJyMFRHNzVwSkluY3plZTlXaHJ5VXQyUXlhWW1EYmQrWjZJ?=
 =?utf-8?B?WFc0ckUweU13aVMwNTR0Vk1QTUdLVVVZUi85ZVBDUk9uRTMwZlZsZ1p0dFg1?=
 =?utf-8?B?SjVCdlJzQ1JLd1VBL2hXcE1wYkhHQWRKZm9EYSs5LzRCekxQdnYreEZwMFg2?=
 =?utf-8?B?bjVDYWVBRVR1OEZLVys3a1NtaVo5bEtyNFpsakg5bGZ0M2lVWnVXZlRWNyt6?=
 =?utf-8?B?Ym5HNldnOWgwRXB6SGFiQWpGdFUyVzRPL21sMFRuMjlkeklyUVluNTF3aitS?=
 =?utf-8?B?QmZKVkpXSEtTRm1iY1E3UG1HZW1paGt2dnFKUTdnUXljdzNuNGxuWVBUYUNH?=
 =?utf-8?B?cFpLMlBtdjdJZzlUVXRIZHU3L3pCc2NDTzMzdWJ2NWNWUHduSFo1V3ZnRk1C?=
 =?utf-8?B?d1Z0c3A5MWRIKzhVL3hobnVSb1hjWDUwdEZhOXFvVndnSDRlbXY0endRbzlj?=
 =?utf-8?B?QWZXNk02aDlUSEo5eGNWWjYxbGJjVUozb3hXbG9hZlluUmI3cHNtMUFTUk1k?=
 =?utf-8?B?U3M0R1dqbTcrTnZGREU3dnNEWXA0eXUvNFpmZG5QMFpLWWp6T2g0d0tMVjlU?=
 =?utf-8?B?c1hLMTBEU295R3ExaW5zTUVqWW1ZRHpmeUR5b2JnQ2NBUmJ6T1U1cVYrb3p4?=
 =?utf-8?B?Q3FuZU5RNndWSURhVWFiN21BVXZZcWMycGhOWXpwQ3FFcGFQZFgwd0Y4T3NX?=
 =?utf-8?B?TUFlT0plMko3NVg2S3JjT2JFampnWUlJTzJ2cEN0b1BIZEt6MXkrdjlSWGQ2?=
 =?utf-8?B?YzhLVDBEQm96MFJlWEora2RyM2FFZVoxNVZSNUJWN2h2Znp0OVJDditHcENv?=
 =?utf-8?B?NUV2N2EwSk9mQXJsWk9RQmtIQUtVV0JXK1RzcThveHFjcURMOVEwMnhEeGxk?=
 =?utf-8?B?ZlBXaGtqeGJhNHRzc281VHRqZVRQUThKaVorVHhKaVZjbWt5dlEvV3NwOVFi?=
 =?utf-8?B?cHFrQkVocENYUHcvdUNmYVJtZ0FxTHNSb3NQdFQ3R2QzbExXOE9XZlJzM0E1?=
 =?utf-8?Q?G7VaQ5p2I63x3Qhoxsv7wQg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c573c3-515e-4a3a-716a-08d9a7fbee79
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 05:51:12.7937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dSJgMiTNmYha9zBzTt3HxzJZSKw8VGcb2wq66hzNuD5t/akhmfAtxkO3wt/P8MCRW1GHo3LOEjnAZBDX0JQ4YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4145
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
Tm92ZW1iZXIgMTIsIDIwMjEgNTo0OSBQTQ0KPiANCj4gLSBDb3JyZWN0IHN0cnVjdCBmaWVsZCB0
eXBlLg0KPiAtIFVzZSB1bnNpZ25lZCBpbnQgd2hlbiB0aGF0IHN1ZmZpY2VzLg0KPiAtIEVsaW1p
bmF0ZSBhIChiYWRseSB0eXBlZCkgbG9jYWwgdmFyaWFibGUgZnJvbQ0KPiAgIGNvbnRleHRfc2V0
X2RvbWFpbl9pZCgpLg0KPiAtIERvbid0IHVzZSAtRUZBVUxUIGluYXBwcm9wcmlhdGVseS4NCj4g
LSBNb3ZlIHNldF9iaXQoKSBzdWNoIHRoYXQgaXQgd29uJ3QgYmUgZG9uZSByZWR1bmRhbnRseS4N
Cj4gLSBDb25zdGlmaWNhdGlvbi4NCj4gLSBSZWR1Y2Ugc2NvcGUgb2Ygc29tZSB2YXJpYWJsZXMu
DQo+IC0gQ29kaW5nIHN0eWxlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBp
bnRlbC5jb20+DQoNCj4gDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21t
dS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+IEBAIC02
MiwxMCArNjIsMTAgQEAgc3RhdGljIHN0cnVjdCB0YXNrbGV0IHZ0ZF9mYXVsdF90YXNrbGV0Ow0K
PiAgc3RhdGljIGludCBzZXR1cF9od2RvbV9kZXZpY2UodTggZGV2Zm4sIHN0cnVjdCBwY2lfZGV2
ICopOw0KPiAgc3RhdGljIHZvaWQgc2V0dXBfaHdkb21fcm1ycihzdHJ1Y3QgZG9tYWluICpkKTsN
Cj4gDQo+IC1zdGF0aWMgaW50IGRvbWFpbl9pb21tdV9kb21pZChzdHJ1Y3QgZG9tYWluICpkLA0K
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZ0ZF9pb21tdSAqaW9tbXUp
DQo+ICtzdGF0aWMgaW50IGRvbWFpbl9pb21tdV9kb21pZChjb25zdCBzdHJ1Y3QgZG9tYWluICpk
LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHZ0ZF9pb21t
dSAqaW9tbXUpDQo+ICB7DQo+IC0gICAgdW5zaWduZWQgbG9uZyBucl9kb20sIGk7DQo+ICsgICAg
dW5zaWduZWQgaW50IG5yX2RvbSwgaTsNCj4gDQo+ICAgICAgbnJfZG9tID0gY2FwX25kb21zKGlv
bW11LT5jYXApOw0KPiAgICAgIGkgPSBmaW5kX2ZpcnN0X2JpdChpb21tdS0+ZG9taWRfYml0bWFw
LCBucl9kb20pOw0KPiBAQCAtNzQsNyArNzQsNyBAQCBzdGF0aWMgaW50IGRvbWFpbl9pb21tdV9k
b21pZChzdHJ1Y3QgZG9tDQo+ICAgICAgICAgIGlmICggaW9tbXUtPmRvbWlkX21hcFtpXSA9PSBk
LT5kb21haW5faWQgKQ0KPiAgICAgICAgICAgICAgcmV0dXJuIGk7DQo+IA0KPiAtICAgICAgICBp
ID0gZmluZF9uZXh0X2JpdChpb21tdS0+ZG9taWRfYml0bWFwLCBucl9kb20sIGkrMSk7DQo+ICsg
ICAgICAgIGkgPSBmaW5kX25leHRfYml0KGlvbW11LT5kb21pZF9iaXRtYXAsIG5yX2RvbSwgaSAr
IDEpOw0KPiAgICAgIH0NCj4gDQo+ICAgICAgaWYgKCAhZC0+aXNfZHlpbmcgKQ0KPiBAQCAtODgs
NjEgKzg4LDUyIEBAIHN0YXRpYyBpbnQgZG9tYWluX2lvbW11X2RvbWlkKHN0cnVjdCBkb20NCj4g
ICNkZWZpbmUgRElEX0ZJRUxEX1dJRFRIIDE2DQo+ICAjZGVmaW5lIERJRF9ISUdIX09GRlNFVCA4
DQo+ICBzdGF0aWMgaW50IGNvbnRleHRfc2V0X2RvbWFpbl9pZChzdHJ1Y3QgY29udGV4dF9lbnRy
eSAqY29udGV4dCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBk
b21haW4gKmQsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1
Y3QgZG9tYWluICpkLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IHZ0ZF9pb21tdSAqaW9tbXUpDQo+ICB7DQo+IC0gICAgdW5zaWduZWQgbG9uZyBucl9kb20sIGk7
DQo+IC0gICAgaW50IGZvdW5kID0gMDsNCj4gKyAgICB1bnNpZ25lZCBpbnQgbnJfZG9tLCBpOw0K
PiANCj4gICAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQoJmlvbW11LT5sb2NrKSk7DQo+IA0KPiAg
ICAgIG5yX2RvbSA9IGNhcF9uZG9tcyhpb21tdS0+Y2FwKTsNCj4gICAgICBpID0gZmluZF9maXJz
dF9iaXQoaW9tbXUtPmRvbWlkX2JpdG1hcCwgbnJfZG9tKTsNCj4gLSAgICB3aGlsZSAoIGkgPCBu
cl9kb20gKQ0KPiAtICAgIHsNCj4gLSAgICAgICAgaWYgKCBpb21tdS0+ZG9taWRfbWFwW2ldID09
IGQtPmRvbWFpbl9pZCApDQo+IC0gICAgICAgIHsNCj4gLSAgICAgICAgICAgIGZvdW5kID0gMTsN
Cj4gLSAgICAgICAgICAgIGJyZWFrOw0KPiAtICAgICAgICB9DQo+IC0gICAgICAgIGkgPSBmaW5k
X25leHRfYml0KGlvbW11LT5kb21pZF9iaXRtYXAsIG5yX2RvbSwgaSsxKTsNCj4gLSAgICB9DQo+
ICsgICAgd2hpbGUgKCBpIDwgbnJfZG9tICYmIGlvbW11LT5kb21pZF9tYXBbaV0gIT0gZC0+ZG9t
YWluX2lkICkNCj4gKyAgICAgICAgaSA9IGZpbmRfbmV4dF9iaXQoaW9tbXUtPmRvbWlkX2JpdG1h
cCwgbnJfZG9tLCBpICsgMSk7DQo+IA0KPiAtICAgIGlmICggZm91bmQgPT0gMCApDQo+ICsgICAg
aWYgKCBpID49IG5yX2RvbSApDQo+ICAgICAgew0KPiAgICAgICAgICBpID0gZmluZF9maXJzdF96
ZXJvX2JpdChpb21tdS0+ZG9taWRfYml0bWFwLCBucl9kb20pOw0KPiAgICAgICAgICBpZiAoIGkg
Pj0gbnJfZG9tICkNCj4gICAgICAgICAgew0KPiAgICAgICAgICAgICAgZHByaW50ayhYRU5MT0df
RVJSIFZURFBSRUZJWCwgIklPTU1VOiBubyBmcmVlIGRvbWFpbiBpZHNcbiIpOw0KPiAtICAgICAg
ICAgICAgcmV0dXJuIC1FRkFVTFQ7DQo+ICsgICAgICAgICAgICByZXR1cm4gLUVCVVNZOw0KPiAg
ICAgICAgICB9DQo+ICAgICAgICAgIGlvbW11LT5kb21pZF9tYXBbaV0gPSBkLT5kb21haW5faWQ7
DQo+ICsgICAgICAgIHNldF9iaXQoaSwgaW9tbXUtPmRvbWlkX2JpdG1hcCk7DQo+ICAgICAgfQ0K
PiANCj4gLSAgICBzZXRfYml0KGksIGlvbW11LT5kb21pZF9iaXRtYXApOw0KPiAgICAgIGNvbnRl
eHQtPmhpIHw9IChpICYgKCgxIDw8IERJRF9GSUVMRF9XSURUSCkgLSAxKSkgPDwgRElEX0hJR0hf
T0ZGU0VUOw0KPiAgICAgIHJldHVybiAwOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyBpbnQgY29udGV4
dF9nZXRfZG9tYWluX2lkKHN0cnVjdCBjb250ZXh0X2VudHJ5ICpjb250ZXh0LA0KPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZ0ZF9pb21tdSAqaW9tbXUpDQo+ICtz
dGF0aWMgaW50IGNvbnRleHRfZ2V0X2RvbWFpbl9pZChjb25zdCBzdHJ1Y3QgY29udGV4dF9lbnRy
eSAqY29udGV4dCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCB2dGRfaW9tbXUgKmlvbW11KQ0KPiAgew0KPiAtICAgIHVuc2lnbmVkIGxvbmcgZG9tX2lu
ZGV4LCBucl9kb207DQo+ICAgICAgaW50IGRvbWlkID0gLTE7DQo+IA0KPiAtICAgIGlmIChpb21t
dSAmJiBjb250ZXh0KQ0KPiArICAgIGlmICggaW9tbXUgJiYgY29udGV4dCApDQo+ICAgICAgew0K
PiAtICAgICAgICBucl9kb20gPSBjYXBfbmRvbXMoaW9tbXUtPmNhcCk7DQo+IC0NCj4gLSAgICAg
ICAgZG9tX2luZGV4ID0gY29udGV4dF9kb21haW5faWQoKmNvbnRleHQpOw0KPiArICAgICAgICB1
bnNpZ25lZCBpbnQgbnJfZG9tID0gY2FwX25kb21zKGlvbW11LT5jYXApOw0KPiArICAgICAgICB1
bnNpZ25lZCBpbnQgZG9tX2luZGV4ID0gY29udGV4dF9kb21haW5faWQoKmNvbnRleHQpOw0KPiAN
Cj4gICAgICAgICAgaWYgKCBkb21faW5kZXggPCBucl9kb20gJiYgaW9tbXUtPmRvbWlkX21hcCAp
DQo+ICAgICAgICAgICAgICBkb21pZCA9IGlvbW11LT5kb21pZF9tYXBbZG9tX2luZGV4XTsNCj4g
ICAgICAgICAgZWxzZQ0KPiAgICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfREVCVUcgVlREUFJF
RklYLA0KPiAtICAgICAgICAgICAgICAgICAgICAiZG9tX2luZGV4ICVsdSBleGNlZWRzIG5yX2Rv
bSAlbHUgb3IgaW9tbXUgaGFzIG5vDQo+IGRvbWlkX21hcFxuIiwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgImRvbV9pbmRleCAldSBleGNlZWRzIG5yX2RvbSAldSBvciBpb21tdSBoYXMgbm8NCj4g
ZG9taWRfbWFwXG4iLA0KPiAgICAgICAgICAgICAgICAgICAgICBkb21faW5kZXgsIG5yX2RvbSk7
DQo+ICAgICAgfQ0KPiArDQo+ICAgICAgcmV0dXJuIGRvbWlkOw0KPiAgfQ0KPiANCj4gQEAgLTEz
MDIsNyArMTI5Myw3IEBAIGludCBfX2luaXQgaW9tbXVfYWxsb2Moc3RydWN0IGFjcGlfZHJoZF8N
Cj4gICAgICBpZiAoICFpb21tdS0+ZG9taWRfYml0bWFwICkNCj4gICAgICAgICAgcmV0dXJuIC1F
Tk9NRU07DQo+IA0KPiAtICAgIGlvbW11LT5kb21pZF9tYXAgPSB4emFsbG9jX2FycmF5KHUxNiwg
bnJfZG9tKTsNCj4gKyAgICBpb21tdS0+ZG9taWRfbWFwID0geHphbGxvY19hcnJheShkb21pZF90
LCBucl9kb20pOw0KPiAgICAgIGlmICggIWlvbW11LT5kb21pZF9tYXAgKQ0KPiAgICAgICAgICBy
ZXR1cm4gLUVOT01FTTsNCj4gDQo+IEBAIC0xNDc3LDExICsxNDY4LDEyIEBAIGludCBkb21haW5f
Y29udGV4dF9tYXBwaW5nX29uZSgNCj4gICAgICAgICAgc3Bpbl91bmxvY2soJmhkLT5hcmNoLm1h
cHBpbmdfbG9jayk7DQo+ICAgICAgfQ0KPiANCj4gLSAgICBpZiAoIGNvbnRleHRfc2V0X2RvbWFp
bl9pZChjb250ZXh0LCBkb21haW4sIGlvbW11KSApDQo+ICsgICAgcmMgPSBjb250ZXh0X3NldF9k
b21haW5faWQoY29udGV4dCwgZG9tYWluLCBpb21tdSk7DQo+ICsgICAgaWYgKCByYyApDQo+ICAg
ICAgew0KPiAgICAgICAgICBzcGluX3VubG9jaygmaW9tbXUtPmxvY2spOw0KPiAgICAgICAgICB1
bm1hcF92dGRfZG9tYWluX3BhZ2UoY29udGV4dF9lbnRyaWVzKTsNCj4gLSAgICAgICAgcmV0dXJu
IC1FRkFVTFQ7DQo+ICsgICAgICAgIHJldHVybiByYzsNCj4gICAgICB9DQo+IA0KPiAgICAgIGNv
bnRleHRfc2V0X2FkZHJlc3Nfd2lkdGgoKmNvbnRleHQsIGxldmVsX3RvX2FnYXcoaW9tbXUtDQo+
ID5ucl9wdF9sZXZlbHMpKTsNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lv
bW11LmgNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmgNCj4gQEAg
LTUwNSw3ICs1MDUsNyBAQCBzdHJ1Y3QgdnRkX2lvbW11IHsNCj4gDQo+ICAgICAgc3RydWN0IGxp
c3RfaGVhZCBhdHNfZGV2aWNlczsNCj4gICAgICB1bnNpZ25lZCBsb25nICpkb21pZF9iaXRtYXA7
ICAvKiBkb21haW4gaWQgYml0bWFwICovDQo+IC0gICAgdTE2ICpkb21pZF9tYXA7ICAgICAgICAg
ICAgICAgLyogZG9tYWluIGlkIG1hcHBpbmcgYXJyYXkgKi8NCj4gKyAgICBkb21pZF90ICpkb21p
ZF9tYXA7ICAgICAgICAgICAvKiBkb21haW4gaWQgbWFwcGluZyBhcnJheSAqLw0KPiAgICAgIHVp
bnQzMl90IHZlcnNpb247DQo+ICB9Ow0KPiANCg0K

