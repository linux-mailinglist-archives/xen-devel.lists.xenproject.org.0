Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1700744BBCD
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 07:47:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224196.387345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkhNc-0001jQ-3p; Wed, 10 Nov 2021 06:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224196.387345; Wed, 10 Nov 2021 06:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkhNc-0001hA-0N; Wed, 10 Nov 2021 06:46:44 +0000
Received: by outflank-mailman (input) for mailman id 224196;
 Wed, 10 Nov 2021 06:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VRVb=P5=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1mkhNa-0001h4-3M
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 06:46:42 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f33ce242-41f1-11ec-a9d2-d9f7a1cc8784;
 Wed, 10 Nov 2021 07:46:38 +0100 (CET)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 22:46:36 -0800
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2021 22:46:36 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Nov 2021 22:46:35 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Nov 2021 22:46:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 9 Nov 2021 22:46:35 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 9 Nov 2021 22:46:34 -0800
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN6PR1101MB2082.namprd11.prod.outlook.com (2603:10b6:405:51::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 10 Nov
 2021 06:46:28 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81%9]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 06:46:28 +0000
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
X-Inumbo-ID: f33ce242-41f1-11ec-a9d2-d9f7a1cc8784
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="318815746"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; 
   d="scan'208";a="318815746"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; 
   d="scan'208";a="642437295"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgwUDRhiYTcQA0wAaCrcSy7pC570ah2r/xJta1OjxKWP6qZ+ULWwj/z9KVV3CEGTPIN4uz5tjOKt9vVkDulAfNyaRKVpk7JqVaLrK2kGTcZ4RRVoiqSQj8DUxnjm2SlnXWi8xSzzsqNM/I4U2Wmsr54ByQBLllaEPcE9jWjDPkd05lPhNLaosWai0fJxx+I2Bw3guEW1rw7pBzDWYwrtJNXnSKDOI0EMVeHZFwYZPCy9XopArOSA6nqykB/uyKMR+mHkiIGdYJk0h3lL24jbMSZk6+3GVibMJop6SULz8SLlgbgRvAtCX4IdPEgh0rH+pQdPhJYc6AcyY35kJrnUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmA0bFxAWcaRXJoHN7VKWmzcN0F2SjkHfp1Ox1jP96o=;
 b=bVEPImzH/fiOwvc/7HBx6lxMK1WDjiQb3weLx8YFWus/ZNf4zJBS+/ESIyB9boS8wQRPe1KnrZ3x+3CR7U8irahH9OJ7NEy9cEb4NjwwRKxjXkI7pM1q4KXHxotHZUolmENBBb/n3Uxjzw6nmmfKXyEOsS4nRqqzUn0dLznmy1+plnJ+k8/+rwk6fXHalUQ36mvX8DkRNQaqKqjiQjoDG34UtoAH2cry1cdmeujmx01frjx30Uv67n4MsIUENTup8Js6zXFhLID/mhtOJx88uqceewNi03IIacSY3ZYzi6LlvMutYvdYg3JeBZrgqKILtphQRWz641iPzqHzULqKGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmA0bFxAWcaRXJoHN7VKWmzcN0F2SjkHfp1Ox1jP96o=;
 b=e5ic+mcnreIrENCHp1DDAop7QgC7mS+NvA1gAa+Vrf7TrxIcDoCwZdVy6izL01IbqvnsayxCM3rEY9/sXsAgofa/RiT11Ev0fErzHENtJtuPJ6gOYIfItAvz2M5RiJUP61ZgxDrTVDtSt/lJaLkEQz8Lk0+w5yH5P14dqelrsFk=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Subject: RE: [PATCH 0/3][4.16?] VT-d: misc (regression) fixes
Thread-Topic: [PATCH 0/3][4.16?] VT-d: misc (regression) fixes
Thread-Index: AQHX1XnjlVsp5RAVTkSqP738SSJmo6v8UiUg
Date: Wed, 10 Nov 2021 06:46:28 +0000
Message-ID: <BN9PR11MB5433D26CA0996E874B08DDB58C939@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <d8295304-d81d-1d11-9bc2-d2539bf5a96a@suse.com>
In-Reply-To: <d8295304-d81d-1d11-9bc2-d2539bf5a96a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66b13245-c954-43da-4bab-08d9a415d2ae
x-ms-traffictypediagnostic: BN6PR1101MB2082:
x-microsoft-antispam-prvs: <BN6PR1101MB2082CB54C5AED13B5FC961E38C939@BN6PR1101MB2082.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DbtD5dkgxPjqkKPQR1Hx94gRL0Gw8IBv1ecVx5KTKM6x29bRwDglK1LVMzZj1Iugc5QsTbWgJI4WWv9h7RiZhf2tdri0vTz+VI+yEzkK4g7LLr7N7uWACJuu2vUdHeXojRGHM2bmS2vo/6mNeKhTpZ+HrZLU5VUVCKawkVhh6aiz2zyAxzFIWk9mINLtRywkzbB+jm6/n1CKavKvHn2lxzJ+ONHYBKTtdzBp9jDFKd3KoQFHGgWq/uusXZCHsHy70aLLbAs5tf1tsjvHDCn4McGQXuxKfV77YqzD1gPASWjvvFVDmh1SBqKtODhUXtls4V7Yp2giX8jhoqjdBU13KoEFCvfj9tjAMPUrDx003q/pQ8sRnXxHOdMu/XywunxyKmi97lymCchrU+ZLJ/+VNuc06zZJY2nNfJqaIxURCj7LY+alYZD8r9WdWe5+Z5amhoHxTkw0mAdpptX7qZEss+kmLAUJV5BWmgGoHMr+DoeFnoSPWByeYadG77D2vTzJDofqn8VJmwfUfOikZAvswuEDB30DcWUxBg4UL4Aw6hb8rH8SyXdQlqYh3kEPdOt+h82MjPdxbDJ5I8jV/rqYy59M59AqM7SQw/j/vQn9NoNoVyEKZFcCJOW4tp83oyvZw9VykRrumlIzpw2+CfQbNRU9+K2ECIm7G/3L1EFKPkc5ovBY578S7HanxswRMN6slbzWZ4oYlXvWKK13cvjhDA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7696005)(55016002)(9686003)(54906003)(66446008)(86362001)(122000001)(186003)(38100700002)(5660300002)(38070700005)(4326008)(8936002)(64756008)(52536014)(26005)(8676002)(66556008)(82960400001)(33656002)(316002)(110136005)(508600001)(66476007)(76116006)(71200400001)(4744005)(2906002)(66946007)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHBJalg3YkkyYmVDNGZpVDF3ZGU0VGRXOEJXUU4yRU9yNnRlLzhrN29vUUdM?=
 =?utf-8?B?REg0a0Fvc1lRRS9QVzNVNjFPUzA0azhUbUNLRWlkVlZ3SkFCaVNIMzhRSU1D?=
 =?utf-8?B?TzI5MDJIeXhVNFRRUDA2MXBtT0FUbmhrYitKVFR4TXlDNjBHQ0xMS3V3MDZr?=
 =?utf-8?B?bTNncVQzR2RUdlRlcVoxZjBQNVNKOFkwM3BKT28vczJPYWplSUs0U1R2NUhV?=
 =?utf-8?B?MVN0SDZtaGQ4OXhIZEcvZmU1RTBxdG1ZclNGbHZNZEkvUno3czdrRldUSXdC?=
 =?utf-8?B?T3JHSWsrWlVIWVAybHRabFFEcDhHYkVlenVlYXo4K3djMXdKZEtybklFSWFK?=
 =?utf-8?B?R1FSemFaNitpc0NycWlsdGwxd055amRwYjNjc1FpNDZCMTVVckU1Tzc4M0Q5?=
 =?utf-8?B?WEVLR2JDYjdFdjA0N2VndEhuekt0bTZQSUFqWHJYUE1idjlZc3haRlB2b3d2?=
 =?utf-8?B?M3N6N0tlOVJqK0Yxa29TSCtvQ2N5UlVuZk9XZytBdnRiN1Vzbk5wOVNhTTNS?=
 =?utf-8?B?eVVzK1hzOE1mcHV4ak9wcDh0V1pvTmViM2dJeFB4dEs3cnhmTW5KckxOQmhE?=
 =?utf-8?B?MlMvamI0Q3lEcDJYQUR4WTJlWDYwVXFkd21Xdk1URjBISkoxSUxTdEptaFl4?=
 =?utf-8?B?UDIxQWhNUFhxRlp4OTJvSDlZLzA1SFVwc1k2cDYxcThhcmYzaVh2d21DVlJj?=
 =?utf-8?B?d0xaSnRKdHc2U3JvVDRLQ2l3V2thcW1JZzJQVUFPZzVmZXNqQ2tHNXQxblRs?=
 =?utf-8?B?bnczS2lxeEFrR3FMZEh0YWtpNmduT3dXcHRGbFBXWnhKUkxrWkk2SHRobHRz?=
 =?utf-8?B?OGoreGhzMjJkeDNvUzVIRXhPbVZJKzNqM2lERHRpTUxzU28wTnkwV25CRkFV?=
 =?utf-8?B?cTBmMUdUR3JpanNXUWhWdThrRHNFOWQ0OGdUaG9aaWdZSDltK1NOUUhoU2xj?=
 =?utf-8?B?VkZYQ0s3ZlRGakViWVZqVGNCTlRnTXVCRUwwVFV5cEE3R09wallGRmlacy81?=
 =?utf-8?B?dnMweitUR2tmWVh3aXNBUm93NXpnVk0xZyswQ1d6bDdkY2RtMWFWdUYxTmoy?=
 =?utf-8?B?UStUNnczcHA5b1N5OVFCQlNIVnZpdmNGUUVwNXNjNFo4SDdURHdxK0xIaWM2?=
 =?utf-8?B?K1pGSUdrUlpRZ3cvUnl1MmtaTlBLTlpQR2l1NG9ra3AyeSs1MzM1Qk5OS3da?=
 =?utf-8?B?cTJqMFg1Y0p1Q0c3MWRJcGlXeXYyaFk5R0U5WmM5Z3R6STNzWktpQ1VJc3lk?=
 =?utf-8?B?WlkyVStsMGs1NXVaYUpwVnhYRk0rZ3VWcTVXUnAwU2hyMk9jQzlnTTdueFEz?=
 =?utf-8?B?SzJaZmc2MkErNFI1b1dlc2RqLzRLRU1BVnlXYy9jazd4SkgxUkNsVFlYRXhH?=
 =?utf-8?B?L2RrVXNva3I3dnpheTBWSGpYT05XSDdTWWpyYjNQMkxtekxTTWhjOGFYNGd0?=
 =?utf-8?B?dlN0RlRXRk5TK21IcmplcndzbHVHdVlYa2FFTm1YK2FCTzI3dHdleEVZQnFJ?=
 =?utf-8?B?VTBXbE9qOW5jWnkzYVRFL2FpRHBQbjhVc2RINTFoNE9zMWpLOFlQVWlOTTY1?=
 =?utf-8?B?cVBybjZCZmxHQURBUGkvTlMyRlZJQU1rWHdqYld3L25Ed3k1U2ZFNFNPcW1k?=
 =?utf-8?B?YllLaDU4K0dQTzFPNDVwUGxDQnVJMXhzMDJoN0ZaMW9NTDAzOVZJZjBLSGhD?=
 =?utf-8?B?SHViNkRMNlFTbFRGVEpOZzlESFFxMW1VMXBSSjZkQ1V0RjNBbGhIV3RucEp1?=
 =?utf-8?B?cDVnSGpDcnNNVzhwelhmTEp5MlJySTBDcElFYytlTjRoQXVmbVJRY2NhYThR?=
 =?utf-8?B?eW9ocC9Kd0RoNzBGYjVyUXExSU91WjJmLzdJNk1YemhQWHFObE9QQ09IckVK?=
 =?utf-8?B?VnAzTWtPelRiRDViYzdJaWNPTGpqN3JkQnNmL1JBc2JnTC9wOUtNQ1o0azJp?=
 =?utf-8?B?ckRiZ005YitoaUFLeWFQd21vMGRwRTNsMlpSQ0JqNEdyb0dyclRlK1IzeGUz?=
 =?utf-8?B?SGQ3UHBQMGZlVTliVm1VSUlMN2hKN3lNQU9ZSXYyTEFwcDFjOExMUVdmTXM1?=
 =?utf-8?B?MUxVRHJVKzBIQzRZRGxONjE1dUQ3cUtxVUcvWFV4S1BEV0tPOHpVLzRNMkNx?=
 =?utf-8?B?bzMvYUdnZWp5bnpMOTVPTHJaUm4xZnlqQUhFL2lNeEYwMVVLMkxwR20wRmlV?=
 =?utf-8?Q?oPeEV3HwCKYqThq0jOEcIHc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b13245-c954-43da-4bab-08d9a415d2ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 06:46:28.4148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P8u9J8YEvf3r7QS/Y1NZPS7ZbZVSIjRB4txWXBt5/CArNxXlO8E4inkCI9wMy3Q+wv10pf0ovxkL1F8RyTp3SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2082
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IE5vdmVtYmVyIDksIDIwMjEgMTA6NTYgUE0NCj4gDQo+IDE6IHBlci1kb21haW4gSU9NTVUgYml0
bWFwIG5lZWRzIHRvIGhhdmUgZHluYW1pYyBzaXplDQo+IDI6IGZpeCByZWR1Y2VkIHBhZ2UgdGFi
bGUgbGV2ZWxzIHN1cHBvcnQgd2hlbiBzaGFyaW5nIHRhYmxlcw0KPiAzOiBkb24ndCBuZWVkbGVz
c2x5IGVuZ2FnZSB0aGUgdW50cnVzdGVkLU1TSSB3b3JrYXJvdW5kDQo+IA0KPiBBcyB0byA0LjE2
IGNvbnNpZGVyYXRpb25zOiBPbmx5IHBhdGNoIDEgYWRkcmVzc2VzIGEgcmVncmVzc2lvbg0KPiBp
bnRyb2R1Y2VkIGFmdGVyIDQuMTUsIHRoZSBvdGhlcnMgYXJlIG9sZGVyLiBQYXRjaCAzIGFkZGl0
aW9uYWxseQ0KPiBvbmx5IGFkZHJlc3NlcyBhbiBpbmVmZmljaWVuY3k7IHRoZSBjb2RlIHdlIGhh
dmUgaXMgY29ycmVjdCBmcm9tDQo+IGEgZnVuY3Rpb25hbCBwb3YuDQo+IA0KDQpBbGwgbG9vayBn
b29kIHRvIG1lOg0KDQoJUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwu
Y29tPg0K

