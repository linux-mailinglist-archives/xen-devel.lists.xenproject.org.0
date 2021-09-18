Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3186C41026A
	for <lists+xen-devel@lfdr.de>; Sat, 18 Sep 2021 02:49:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189765.339647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mROWp-0005x3-B8; Sat, 18 Sep 2021 00:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189765.339647; Sat, 18 Sep 2021 00:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mROWp-0005ui-7D; Sat, 18 Sep 2021 00:48:27 +0000
Received: by outflank-mailman (input) for mailman id 189765;
 Sat, 18 Sep 2021 00:48:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Orqi=OI=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1mROWn-0005uc-IA
 for xen-devel@lists.xenproject.org; Sat, 18 Sep 2021 00:48:25 +0000
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2003e429-181a-11ec-b745-12813bfff9fa;
 Sat, 18 Sep 2021 00:48:23 +0000 (UTC)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 17:48:22 -0700
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga007.jf.intel.com with ESMTP; 17 Sep 2021 17:48:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 17 Sep 2021 17:48:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 17 Sep 2021 17:48:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 17 Sep 2021 17:48:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 17 Sep 2021 17:48:21 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN6PR11MB3891.namprd11.prod.outlook.com (2603:10b6:405:77::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Sat, 18 Sep
 2021 00:48:20 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%8]) with mapi id 15.20.4523.018; Sat, 18 Sep 2021
 00:48:20 +0000
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
X-Inumbo-ID: 2003e429-181a-11ec-b745-12813bfff9fa
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="222948526"
X-IronPort-AV: E=Sophos;i="5.85,302,1624345200"; 
   d="scan'208";a="222948526"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,302,1624345200"; 
   d="scan'208";a="473283567"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iErusLYViDWrV5jNPUQBhEyt/eXwhaqR3SBsP9FXj9ISFsYfr5SrRJDljPDzIoHZprimXvrPwYYr/lUc4nmEBNeJs6baN1VLKbbnkTbJyr5HnFR0fA9YUiyey3G6jluJGDWRbTbeginNmwh3xXiTFskHjrUs8kzTpfepkICgOI/cdu3WCsCsUuN6QXukeIiMgoJMbjkYWXuqO0ZrTi1ZFp0qCUhJvwSvyWZEjPg7X0N3YbX1zmrKGiuLkkbvh7gCkj74piXDnml9rwYhsW4lswwBwNYKPnxoAanaGeKKjtiFdLo2JdrqIEnsH/KtxW+FfZ9kblmHz4LzFIPhwjae+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=q4izqWtMOYHvwE5erlAuG4n3VcCpUQNhbN5FnLO8ILk=;
 b=QM2PSjgNYuw0mJ4+SVuHv4Ssk1xdQhnzZjgvCQU0CltN5x95eOmHEDa+iSktua/nO+p+gTHTymNa4clX29moAM0dm9X3cvqyjZxv3+k3tJQ37nm+ehEGAN/6oEPPhrhh56NYfzi/gYKZROsPTBD2GQbbEfzoBasd65G/p9YAKOLhikoPnAQqEwcs1jBZRsdd+sOll1vM0j6rtsSo32d6rGoho4m+vSYSsmyi3Efs0Hp8699IZBaSHKHyruO9DHJk8WTh7a35K22W9LTT3S79JDP2vsHA6HEYabVHeoEf8WUARzvVYQLqodDZM8nwrnuyFOZ0AQblRQCPy50iS1QE7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4izqWtMOYHvwE5erlAuG4n3VcCpUQNhbN5FnLO8ILk=;
 b=iBICIqIkhMCmCdT1uk9gQngfv88t31RTc+PhfD32xmQWvfhk9ljkfpEbx8vqS+5T1fv4xZH+cfhXNURSWwk1UmGLn/xfTqN1+mXPf5Fikz/57ay1Csv7HXu5gjsZ/gPBdkCKoufmRxXdNeK4ExA8oKCHyWu09YYXQV0T6i7bszw=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
Subject: RE: [PATCH v2 1/3] VT-d: consider hidden devices when unmapping
Thread-Topic: [PATCH v2 1/3] VT-d: consider hidden devices when unmapping
Thread-Index: AQHXq7NAuWJs+9yJ2ECO4xKe2sffuauo9kZw
Date: Sat, 18 Sep 2021 00:48:20 +0000
Message-ID: <BN9PR11MB54331945BAE8A87353DED1AE8CDE9@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <c0a460c0-9d7e-c015-37cf-4775bdef33a8@suse.com>
 <64c6b3e8-045b-9308-b77f-721c3d57c08b@suse.com>
In-Reply-To: <64c6b3e8-045b-9308-b77f-721c3d57c08b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84228d54-0ac6-48c9-91e3-08d97a3e02d4
x-ms-traffictypediagnostic: BN6PR11MB3891:
x-microsoft-antispam-prvs: <BN6PR11MB3891CBAAF729D4D4CAA55BEC8CDE9@BN6PR11MB3891.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kr4AMrPq1quZq5VV+nB3DJfJXIVyWfc9Vr10omG9t02srgcw5dhwoN+k/Cloj7OYA8orCCYY4VwvpHm24X2xhEuDQym4YREHk87vuBlkNZi1ntm10hyAtyhNUfWr+2e+WFbe/r/2wI6VwwZAw34KN8N8x22A+xQ1hCme4f1bJzXjpJIurdClKSQGjxirTyQA7mZAh0DkcNb7POOMLwyO11RxTacEkDZ++TmiLdriSMG9+djxsmwjg8lRrkgIb+pJPfqH1ecZn5c01ao65IuQ/czabgRjW04cBwsq2h2VV5fVF+2jKjBmwaypc8KwJ2eVNm7RvrrTBA9hJLS1i9Yp0gjMfzrO2/TmL9x7ZxYm7at28YzUERNHw3q7I66JptrCYDUidc5cXOzLc31cKLvXND3cYGtQFgxil/F8AOf5HYq86wBVbKl40CBIROBv54eKdbtgGo/YVH44hbimA1APWUfn/+DQV2I5q4PI+3W2iULKkqwfjAggpwmJZWNMIt3t/EA2SVyQKkyiGbe9YHroybKU+LreGnf1KciZLSXVqRxx/8rj0pn+SZq1w7+Ka6h5f0N1RHpXQIrGUfhwURPhOzZgKqAPECQT9+U1zCRy6YfwR6fSJ/ib/oQkmSPD0msivT4y8qg2V0ZgX3aKxPD+dsUy7v64XnhVzGneHHsSIQGd+GR/7gB3rGePsbSvE14Z0vqj/I0cSCZ0r4zf6/hJ5Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(5660300002)(71200400001)(6506007)(4326008)(9686003)(7696005)(52536014)(38070700005)(33656002)(64756008)(66446008)(66476007)(76116006)(66556008)(186003)(26005)(66946007)(8936002)(8676002)(478600001)(122000001)(316002)(55016002)(2906002)(110136005)(38100700002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmpEaW5GNVQwaXo0RHhpL1NGRk1iZUljTWVwck1BaFJMbkZkL1VYamNYb080?=
 =?utf-8?B?QS9HVUkrRytOZ3MyazN3RWxZbE9FV3crRS9BaFY3cXdRbFNqeDdsNXY3UjRw?=
 =?utf-8?B?dUdxeDBsamc2MTVxbEI1ZlJpVy9wUE1nWGUzWlVURDlTTmNkNm15ZUJsK2pH?=
 =?utf-8?B?bjUwcWV3QXpBSXBJQUpTaSthU1JUOHA5OVN6SDBIRWoxNjdxOVRraHB0STdM?=
 =?utf-8?B?S2F2NTRzRml2aGNhNFltU1Jvb1RDNHFrb1FTdTc1Y09TRWJqVTFkdUpTRHZL?=
 =?utf-8?B?U1ZtSUZpQzZ0emZHbHVaVVpJUk1XNFZkUlVieHMrR0w0NzR0anZ6VzJRNFJm?=
 =?utf-8?B?YVR5eURLaU1xWDcwWHVCNndaYlkwOG5hZTRENENFanVpbG5GbXZzOUU2WmVR?=
 =?utf-8?B?bEJzNGVWSFpNcmt2NGxzUjNmK3plWkFTNkFvcUF2MkVob3ZZTkhSOG40WXkz?=
 =?utf-8?B?ZG03dHBvOXBHaG9ZTEg4ODNoRWpXeSt3N2M0U1U4RDQ4Zms0eStlQVBjWGJx?=
 =?utf-8?B?bktZZ3BudkpEUmxyOHYyNHF5M0JVSFhMV1NmdUdYeDQ4Z0w2SEZCVlJMc2xR?=
 =?utf-8?B?b09kcnBsQVFpcHhrSzkzT0tTejc4WUFDT285Y0puMVpzSFRwYzhEQjJYR1FP?=
 =?utf-8?B?eUo4bmhjT3U1ck9lWlJKMk5DNjdrODdLbzRoUDgvdzlDNFFYRCs2NFZDSVdS?=
 =?utf-8?B?ZEpEUlArcHJoaVJWM0lNOXl6Y3E3SGd3RzFsVFhwNHZHalNnVEpPM1I1djNr?=
 =?utf-8?B?akpUOXFIV3BERU54QXBnMFRIU0ZaTHoySy9ZMm5OcEhKNGZGcFViMW5NbmdR?=
 =?utf-8?B?NzNSbjVDK2VKVkhXTXhNRDlrM0VEKzl5T3pYWmxLaVdTUEt1bXgrN29ORFdV?=
 =?utf-8?B?cER3QWtpR0pEN0tNNE9BOTNqZlRYZTlWb3RTSWR0R1BXRTVYUy9JYVUxQlNl?=
 =?utf-8?B?aHlQUjRuYVpkQTVUOHhWWmlvaExiczlJSElTM2hCcWtuSlh5b3U2V0dRN1Mw?=
 =?utf-8?B?QnlSN01yeXZmVjhRcWp6UjRyWDRrbFBHajRwUVdZL1JHL3Z2VGVxNFE5aDZo?=
 =?utf-8?B?ZFhDT2JkUE5XT3dVSUZGYjArajVXRWdoMHA0WUZzbVRJWHZHcmFRTU50Wkl3?=
 =?utf-8?B?YWVKaHhOWEh0V1U0cllJTDMrME83aVA0NWRkemV3clcwbHEwNGJhVFJsUmdM?=
 =?utf-8?B?NUpxUHVkL2xqYlB3aEFVSGR4cXV1KzBBK0ZnazZrQU5xbENCdmJ6b3dsWEdM?=
 =?utf-8?B?cTU0S2FIQWJ5d1BsbzdVb045R09LVEs0TmgwRU9QcXFMVVV5MkF2NDNoQ1Zn?=
 =?utf-8?B?VTNXekUrOUVlT0FwRm04TEEvcUVwSkxBTGRMa1o5SUJlVGRzWEYyNExOTmp0?=
 =?utf-8?B?KzVEZ1lzMWVHd3ZKVHFEcFB5TkEyVTdvN3hhV0swL1dIbXk1dVNMVXgycXRY?=
 =?utf-8?B?a1F5Q2liWW9RTFV6YnRDQjJ0akc5KzY0bitHTFBFY1VCYkVkeHc2SGFZQjJO?=
 =?utf-8?B?Nk1QODhySFlkWE9aSWNzL21iSkd2dTI0bFpzV3lrNnpqRDVoVm9neUVrejZx?=
 =?utf-8?B?SDAyNHRhM255d0NrMTBBTnp5bVF0aG9zYzV1Z2hlVXo0QTFCYWVPb2MzSUp1?=
 =?utf-8?B?bysrVXY2SkdMNGFIUVJSOFVJczBFR3lNem0xemNlc05GbmlEUmhQTWZlMFlB?=
 =?utf-8?B?TEFEOWU0VVZsNGRIbW1NYU9KMEpYSzE0MzRTUTU1SGVwc2ZnaFNITVF6VkVh?=
 =?utf-8?Q?/qhXAHUR2g7rtNexLNGb3jXXZM9ywNY+QuYLEON?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84228d54-0ac6-48c9-91e3-08d97a3e02d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2021 00:48:20.2646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: POYGggIJ/rO1GPnqK/KA5ldcnBCfh7lPhU52nWpFjEH0JYNkjIRO92skVdFnu5bU0fENgFc+QmMsfqFN9KaVyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3891
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
U2VwdGVtYmVyIDE3LCAyMDIxIDc6MDAgUE0NCj4gDQo+IFdoZXRoZXIgdG8gY2xlYXIgYW4gSU9N
TVUncyBiaXQgaW4gdGhlIGRvbWFpbidzIGJpdG1hcCBzaG91bGQgZGVwZW5kIG9uDQo+IGFsbCBk
ZXZpY2VzIHRoZSBkb21haW4gY2FuIGNvbnRyb2wuIEZvciB0aGUgaGFyZHdhcmUgZG9tYWluIHRo
aXMNCj4gaW5jbHVkZXMgaGlkZGVuIGRldmljZXMsIHdoaWNoIGFyZSBhc3NvY2lhdGVkIHdpdGgg
RG9tWEVOLg0KPiANCj4gV2hpbGUgdG91Y2hpbmcgcmVsYXRlZCBsb2dpYw0KPiAtIGNvbnZlcnQg
dGhlICJjdXJyZW50IGRldmljZSIgZXhjbHVzaW9uIGNoZWNrIHRvIGEgc2ltcGxlIHBvaW50ZXIN
Cj4gICBjb21wYXJpc29uLA0KPiAtIGNvbnZlcnQgImZvdW5kIiB0byAiYm9vbCIsDQo+IC0gYWRq
dXN0IHN0eWxlIGFuZCBjb3JyZWN0IGEgdHlwbyBpbiBhbiBleGlzdGluZyBjb21tZW50Lg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZp
ZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IHYy
OiBJbnRyb2R1Y2UgaGVscGVyIGZ1bmN0aW9uLg0KPiANCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRk
L2lvbW11LmMNCj4gQEAgLTE2NTAsNiArMTY1MCwyNyBAQCBpbnQgZG9tYWluX2NvbnRleHRfdW5t
YXBfb25lKA0KPiAgICAgIHJldHVybiByYzsNCj4gIH0NCj4gDQo+ICtzdGF0aWMgYm9vbCBhbnlf
cGRldl9iZWhpbmRfaW9tbXUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqZXhjbHVkZSwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdnRkX2lvbW11
ICppb21tdSkNCj4gK3sNCj4gKyAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldjsNCj4gKw0K
PiArICAgIGZvcl9lYWNoX3BkZXYgKCBkLCBwZGV2ICkNCj4gKyAgICB7DQo+ICsgICAgICAgIGNv
bnN0IHN0cnVjdCBhY3BpX2RyaGRfdW5pdCAqZHJoZDsNCj4gKw0KPiArICAgICAgICBpZiAoIHBk
ZXYgPT0gZXhjbHVkZSApDQo+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4gKw0KPiArICAgICAg
ICBkcmhkID0gYWNwaV9maW5kX21hdGNoZWRfZHJoZF91bml0KHBkZXYpOw0KPiArICAgICAgICBp
ZiAoIGRyaGQgJiYgZHJoZC0+aW9tbXUgPT0gaW9tbXUgKQ0KPiArICAgICAgICAgICAgcmV0dXJu
IHRydWU7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgcmV0dXJuIGZhbHNlOw0KPiArfQ0KPiArDQo+
ICBzdGF0aWMgaW50IGRvbWFpbl9jb250ZXh0X3VubWFwKHN0cnVjdCBkb21haW4gKmRvbWFpbiwg
dTggZGV2Zm4sDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KQ0KPiAgew0KPiBAQCAtMTY1Nyw3ICsxNjc4LDcgQEAgc3RhdGljIGludCBkb21h
aW5fY29udGV4dF91bm1hcChzdHJ1Y3QgZA0KPiAgICAgIHN0cnVjdCB2dGRfaW9tbXUgKmlvbW11
ID0gZHJoZCA/IGRyaGQtPmlvbW11IDogTlVMTDsNCj4gICAgICBpbnQgcmV0Ow0KPiAgICAgIHU4
IHNlZyA9IHBkZXYtPnNlZywgYnVzID0gcGRldi0+YnVzLCB0bXBfYnVzLCB0bXBfZGV2Zm4sIHNl
Y2J1czsNCj4gLSAgICBpbnQgZm91bmQgPSAwOw0KPiArICAgIGJvb2wgZm91bmQ7DQo+IA0KPiAg
ICAgIHN3aXRjaCAoIHBkZXYtPnR5cGUgKQ0KPiAgICAgIHsNCj4gQEAgLTE3MzcsMjMgKzE3NTgs
MTggQEAgc3RhdGljIGludCBkb21haW5fY29udGV4dF91bm1hcChzdHJ1Y3QgZA0KPiAgICAgICAg
ICByZXR1cm4gcmV0Ow0KPiANCj4gICAgICAvKg0KPiAtICAgICAqIGlmIG5vIG90aGVyIGRldmlj
ZXMgdW5kZXIgdGhlIHNhbWUgaW9tbXUgb3duZWQgYnkgdGhpcyBkb21haW4sDQo+IC0gICAgICog
Y2xlYXIgaW9tbXUgaW4gaW9tbXVfYml0bWFwIGFuZCBjbGVhciBkb21haW5faWQgaW4gZG9taWRf
Yml0bXANCj4gKyAgICAgKiBJZiBubyBvdGhlciBkZXZpY2VzIHVuZGVyIHRoZSBzYW1lIGlvbW11
IG93bmVkIGJ5IHRoaXMgZG9tYWluLA0KPiArICAgICAqIGNsZWFyIGlvbW11IGluIGlvbW11X2Jp
dG1hcCBhbmQgY2xlYXIgZG9tYWluX2lkIGluIGRvbWlkX2JpdG1hcC4NCj4gICAgICAgKi8NCj4g
LSAgICBmb3JfZWFjaF9wZGV2ICggZG9tYWluLCBwZGV2ICkNCj4gLSAgICB7DQo+IC0gICAgICAg
IGlmICggcGRldi0+c2VnID09IHNlZyAmJiBwZGV2LT5idXMgPT0gYnVzICYmIHBkZXYtPmRldmZu
ID09IGRldmZuICkNCj4gLSAgICAgICAgICAgIGNvbnRpbnVlOw0KPiAtDQo+IC0gICAgICAgIGRy
aGQgPSBhY3BpX2ZpbmRfbWF0Y2hlZF9kcmhkX3VuaXQocGRldik7DQo+IC0gICAgICAgIGlmICgg
ZHJoZCAmJiBkcmhkLT5pb21tdSA9PSBpb21tdSApDQo+IC0gICAgICAgIHsNCj4gLSAgICAgICAg
ICAgIGZvdW5kID0gMTsNCj4gLSAgICAgICAgICAgIGJyZWFrOw0KPiAtICAgICAgICB9DQo+IC0g
ICAgfQ0KPiArICAgIGZvdW5kID0gYW55X3BkZXZfYmVoaW5kX2lvbW11KGRvbWFpbiwgcGRldiwg
aW9tbXUpOw0KPiArICAgIC8qDQo+ICsgICAgICogSGlkZGVuIGRldmljZXMgYXJlIGFzc29jaWF0
ZWQgd2l0aCBEb21YRU4gYnV0IHVzYWJsZSBieSB0aGUNCj4gaGFyZHdhcmUNCj4gKyAgICAgKiBk
b21haW4uIEhlbmNlIHRoZXkgbmVlZCBjb25zaWRlcmluZyBoZXJlIGFzIHdlbGwuDQo+ICsgICAg
ICovDQo+ICsgICAgaWYgKCAhZm91bmQgJiYgaXNfaGFyZHdhcmVfZG9tYWluKGRvbWFpbikgKQ0K
PiArICAgICAgICBmb3VuZCA9IGFueV9wZGV2X2JlaGluZF9pb21tdShkb21feGVuLCBwZGV2LCBp
b21tdSk7DQo+IA0KPiAtICAgIGlmICggZm91bmQgPT0gMCApDQo+ICsgICAgaWYgKCAhZm91bmQg
KQ0KPiAgICAgIHsNCj4gICAgICAgICAgY2xlYXJfYml0KGlvbW11LT5pbmRleCwgJmRvbV9pb21t
dShkb21haW4pLQ0KPiA+YXJjaC52dGQuaW9tbXVfYml0bWFwKTsNCj4gICAgICAgICAgY2xlYW51
cF9kb21pZF9tYXAoZG9tYWluLCBpb21tdSk7DQoNCg==

