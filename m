Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61327306030
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 16:50:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76198.137390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4n5P-0004Tc-2f; Wed, 27 Jan 2021 15:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76198.137390; Wed, 27 Jan 2021 15:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4n5O-0004TE-US; Wed, 27 Jan 2021 15:50:26 +0000
Received: by outflank-mailman (input) for mailman id 76198;
 Wed, 27 Jan 2021 15:50:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSKd=G6=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1l4n5N-0004T9-9A
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:50:25 +0000
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27ef37c5-574d-465f-b7f7-4edb7343981f;
 Wed, 27 Jan 2021 15:50:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 07:50:20 -0800
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 27 Jan 2021 07:50:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 27 Jan 2021 07:50:19 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 Jan 2021 07:50:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 27 Jan 2021 07:50:19 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 27 Jan 2021 07:50:15 -0800
Received: from CY4PR11MB0056.namprd11.prod.outlook.com (2603:10b6:910:7c::30)
 by CY4PR11MB1637.namprd11.prod.outlook.com (2603:10b6:910:d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Wed, 27 Jan
 2021 15:50:14 +0000
Received: from CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::b409:b6cb:ea10:cb1b]) by CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::b409:b6cb:ea10:cb1b%3]) with mapi id 15.20.3742.015; Wed, 27 Jan 2021
 15:50:14 +0000
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
X-Inumbo-ID: 27ef37c5-574d-465f-b7f7-4edb7343981f
IronPort-SDR: ptSAkcvFdRoRjBZEqQPMhdmjQJa9h1dHl8z7b2ec9DDHWjdZeaXtE0Pa7TR5WhTfwSp9hRGTcQ
 qVc3ZMIrYAgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="180167085"
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; 
   d="scan'208";a="180167085"
IronPort-SDR: EEMkQIVvn63AaPn2B2JijmjPZBYE3ShJ38MHfPiDWUWfl8lDMEfG3d/oP4Go4ntlV2+rkxX18a
 lHAzOPYqGnNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; 
   d="scan'208";a="473202498"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ah32GRtCgtRIZebG+VQZZlxe/9xJL2rE8pyKyZ9UtDLnfhg6/YfmZpcCLOCw1qd0XHPJQBoWvA8pvMoh5o4X30lOKjBTdcYIzFLdMzgDeLCOfXOteYCoybZ+PLqt689SAdaS9ZHBXT6Nn0vbAno/Z8JxtfiQnqtRECoVTYBTNlpUkrnqUkTv3sbBmsCcREFOwclA9VWOTgsija1r8ZDeX8A587ieq2IvqI/fGtWxB3Pk8rFxQmfzhXlaruE5vU02aHZD3g4SIW8gZDUPoNfxmp9yqTkE9XXJIRA1gx5op14BJ2rGzCkTCR9NcZ483EPGWa+QhKEpheS2XvpCJoynsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9HHAh6ojlVjED0Te85UW1lbI+VOlltjCHiVrr/iPPQ=;
 b=VETXsV2TFRNQN3GHJpGb2QP4B1gB1vcA9NvdXM6pg1yXoHyoFPnWgOWitytG6L16w4K43UBzwz+z2gNvJH36Dz4p8t9kkDfVT9KQ7PsE+Ux8GNIr3LbHIgY3Qm9qfPN1/JriegCiM2KMA4RP5ww12DRMZdC+AbyyhAfa7RjS+pT+u1ZKiVLsk9t9CPykRuDVNbsHg06Us+xxF8ZwsVsk/IbPM/BooKt0K/v8JPHVmV22u7uCiJxCm7/egymwv+RjmmP8+e26gy1rNfh3a/nXek5zq81TxnWcbcH5Zz+K3djjVaVFcu2YvuH4o9Tf6IEwZj63hJ/TEfj5wPXz2V/rLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9HHAh6ojlVjED0Te85UW1lbI+VOlltjCHiVrr/iPPQ=;
 b=lAI14LjFo5Ka+/N51i4syBvR3PhaNW5G9C+6VxdCwaVQnEpupE1JDhUr3d1dTN2SE0KoWHW7tH0Ri0IRRD1e/xy7nVQiqVRiVwtfO/pvHkPN6aJTg3Q8cXi5wS6/SMe1DdCik8OMnpnHpe67TuclAQXA0jG40jiezWjpPBBvHBE=
From: "Lengyel, Tamas" <tamas.lengyel@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "Cooper, Andrew"
	<andrew.cooper3@citrix.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>, "Tian, Kevin"
	<kevin.tian@intel.com>, =?utf-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?=
	<michal.leszczynski@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 09/10] xen/vmtrace: support for VM forks
Thread-Topic: [PATCH v7 09/10] xen/vmtrace: support for VM forks
Thread-Index: AQHW8DxTbgu1UB57dkaWODVmsXRmrKo5/L6AgAGp5JA=
Date: Wed, 27 Jan 2021 15:50:14 +0000
Message-ID: <CY4PR11MB0056EEF51829898C06BD34D3FBBB0@CY4PR11MB0056.namprd11.prod.outlook.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-10-andrew.cooper3@citrix.com>
 <5c6a7e20-cd34-2bb5-d5c7-c1d6c41919f0@suse.com>
In-Reply-To: <5c6a7e20-cd34-2bb5-d5c7-c1d6c41919f0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-version: 11.6.0.76
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.119.195.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1240b1ff-64ec-45a3-4c35-08d8c2db3cfb
x-ms-traffictypediagnostic: CY4PR11MB1637:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR11MB163718972C3ED85A2570B594FBBB9@CY4PR11MB1637.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gVs2b9f8/xxEdsxJnOv35Gfl/ygO8XWy+hpWU+RmDgU1DUvRZl61fPj00gN7UYVvKmUIP4kiveH7ZyLzSyrNOU7zDc0aa04R+4PjpifGxG3XfUlRAMAxPsxMj0/z7wGUIDThtSm2fuy6OXokZ0QvylFum7+etYUH03Rl952Ob3wZSbyVwAKwbBDCdK0zkuPt3La1aTQv8TVol63ooCHOQBX85YUR3CxXSfLHlJlwvkCxCuVZj/lUnoel7bhOF0d1Ka2Lj/E56Gvp75kdv78saFKWe5d7H+2arbePl5MKJz5Ds4HcwApL2+CzXUnEZu7101clCgD+j0jYEPDrv2n12JrhFDvz7U1VCrb80QwABNFvFpdWfN3Ol9ORmDFsNORSuhsiNk1VauV0CDRxnOm5LPmIhwLSUhmMMtYR1RRFm+jMMl5NBsMiCgEuO3X8mVv5RjHOwvQYuEVA7pj45Ctfm1vHI/feuyadEn91623e4c5VO3z2tOSc7xO4fpuhy6qwEkttEEJh/cWLCY3m1oFGmg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0056.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(478600001)(8676002)(52536014)(110136005)(2906002)(54906003)(4326008)(5660300002)(26005)(86362001)(76116006)(66476007)(6506007)(66946007)(66574015)(83380400001)(71200400001)(9686003)(316002)(7696005)(66446008)(53546011)(55016002)(33656002)(66556008)(64756008)(8936002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dGk3ZDNXSTlVT3dqRzIvdVJCWnUxVmQ4cWIzUnV4aWdxTUdtanJCendnREJI?=
 =?utf-8?B?R1B4OHM5NXIvL2NJSGVVNnp1MmR2eXg2SGcvQlE4c01kN3VMRVhmbXBwWjdp?=
 =?utf-8?B?cm5sNUdOdkxYOWZLeFZCWW8wQi9MaW5QODdWWXJqQzJyMlAxSlNZTHNOSk52?=
 =?utf-8?B?ZzBsQ2x6OXF4akY1Z3h3NUhDbU1PUUMzOWtsNk16aTJadjA2UjVxVEJvWFlr?=
 =?utf-8?B?bmpiUnloNHlYZnVzVHB2d0o4cjJBUWNqK3o4Z1luODh4ajQ1U1p5R1JIeUs2?=
 =?utf-8?B?SG0wNzV4ZHBUMXl3T3FyRmR4N2N2K0dxejAxaGUwSlVFa1JTN2MzUFhVSXR5?=
 =?utf-8?B?blZ3K0tEazBsT21kS0V6WU9icWZWYUJWbUcwWkZCVm0xN0srRU5DdE54NlE2?=
 =?utf-8?B?dkpOMTRuNWFqTkxaRytMSDIwRmtIc3lvVUFXZlJRSlZmQVVHQUZRVEpFc0Nk?=
 =?utf-8?B?MGUvYXJUcjU2cUo5QU9VWnpuZmYwUE1wU3owTEVCTE5rYUc1RExGOWJVa1do?=
 =?utf-8?B?OWNHVEpsSFhLd1pTSUphSmZqYnMyUVFvOXp3enNxdldzTUZHTmZWVVJiTU1O?=
 =?utf-8?B?ZVRGNUQ5U1dkSHFoYno0UmZ2V1llSkU3OEtDdlB0NjkybWlXV3BnS05Sdnls?=
 =?utf-8?B?SEZrUzF2VmNERkdZNVoyTGdTNGdrNThYQmNRQWNSbHl1M3gvRy9HUHJZaFZJ?=
 =?utf-8?B?TnV3dHArSEJYVGJCN0ZqZEF1N3F0NWFqN3hqbWZvdnVVakVtajRKYk0zWmZY?=
 =?utf-8?B?cjBab3NPT3NISlVQVmltMkdoeFRqZ1hIZlZCUitmNm5uZ1RyQ2Z0MUJhMXBw?=
 =?utf-8?B?Zzh2ZjVQNnhzZ0N2ZitGVXZGUkdlQ3ozY21qRWFMd1RFcXVTYkdVZVpvOHBs?=
 =?utf-8?B?b1lucWRXbXpiRWRabzVGZ250c0NzZEN1bTdkbExicGRYa1dscGJZWlJqbGZt?=
 =?utf-8?B?ZGREYkxqSmVxVk55NE9oZFN0MnEydU13WEZMbS9scHlucytyM3A0TFZ4U1JH?=
 =?utf-8?B?c1lnT0hMV2NSN3ZYc3dBNXR5VDJOM1lYOVZXSy9XTEwzYkhZVVk4NnBOamJv?=
 =?utf-8?B?NWdFQmw4a2QzNkU4MXgveTlmTTE4dEhsaDEzTWM3RGlBcXNHMzNHRU81OGdm?=
 =?utf-8?B?TWtYNjdCM2hmOGpVU01ZTk4yNE52RE9hQXZNbmJ3SVYzajl0NzNYYVVXdity?=
 =?utf-8?B?Yk1NNmFYSjI4Z0tPN0ZJWUVJQmFUNEg4Yzh5cVZESHBIRnFjdjhYeGJKa3BY?=
 =?utf-8?B?bzU3TFEzKzNHaWw1bzl6ZzZZcEs2NnVnNm51enVWZnBRWnpkL2JzbDRmbmlZ?=
 =?utf-8?B?ZXh5V0djYXBOc3lIZnNqbHR4b05kVEx4Q3VhTEh0S2FpbElCaTE1U29DZWli?=
 =?utf-8?B?OHBzMVFpT204UkNoQmVKdHpFQWhabzk4S29QcTZqcENHV21GcVFKU01HN1c5?=
 =?utf-8?Q?UlDmDPjV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1240b1ff-64ec-45a3-4c35-08d8c2db3cfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2021 15:50:14.9289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FykkdoonNpSPaK4rudPNX/MLY7ixmoYjcuiZcDc6t+0ZdR273KJLWEqdTcPRljirDerKqM74HPUDI3TdudC1Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1637
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDI2LCAyMDIxIDk6MjIg
QU0NCj4gVG86IENvb3BlciwgQW5kcmV3IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBD
YzogTGVuZ3llbCwgVGFtYXMgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPjsgUm9nZXIgUGF1IE1v
bm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgTmFr
YWppbWEsIEp1bg0KPiA8anVuLm5ha2FqaW1hQGludGVsLmNvbT47IFRpYW4sIEtldmluIDxrZXZp
bi50aWFuQGludGVsLmNvbT47IE1pY2hhxYINCj4gTGVzemN6ecWEc2tpIDxtaWNoYWwubGVzemN6
eW5za2lAY2VydC5wbD47IFRhbWFzIEsgTGVuZ3llbA0KPiA8dGFtYXNAdGtsZW5neWVsLmNvbT47
IFhlbi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY3IDA5LzEwXSB4ZW4vdm10cmFjZTogc3VwcG9ydCBmb3IgVk0gZm9ya3MNCj4g
DQo+IE9uIDIxLjAxLjIwMjEgMjI6MjcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+ID4gRnJvbTog
VGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4NCj4gPg0KPiA+IEltcGxl
bWVudCB2bXRyYWNlX3Jlc2V0X3B0IGZ1bmN0aW9uLiBQcm9wZXJseSBzZXQgSVBUIHN0YXRlIGZv
ciBWTQ0KPiA+IGZvcmtzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVs
IDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gYWxiZWl0IGl0IHN0cmlrZXMgbWUgYXMNCj4gc29t
ZXdoYXQgb2RkIHRoYXQgLi4uDQo+IA0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Zt
eC5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4gPiBAQCAtMjQwOCw2
ICsyNDA4LDE2IEBAIHN0YXRpYyBpbnQgdm10cmFjZV9vdXRwdXRfcG9zaXRpb24oc3RydWN0IHZj
cHUNCj4gKnYsIHVpbnQ2NF90ICpwb3MpDQo+ID4gICAgICByZXR1cm4gdi0+YXJjaC5odm0udm14
LmlwdF9hY3RpdmU7ICB9DQo+ID4NCj4gPiArc3RhdGljIGludCB2bXRyYWNlX3Jlc2V0KHN0cnVj
dCB2Y3B1ICp2KSB7DQo+ID4gKyAgICBpZiAoICF2LT5hcmNoLmh2bS52bXguaXB0X2FjdGl2ZSAp
DQo+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsgICAgdi0+YXJjaC5t
c3JzLT5ydGl0Lm91dHB1dF9vZmZzZXQgPSAwOw0KPiA+ICsgICAgdi0+YXJjaC5tc3JzLT5ydGl0
LnN0YXR1cyA9IDA7DQo+ID4gKyAgICByZXR1cm4gMDsNCj4gPiArfQ0KPiANCj4gLi4uIHRoZSBm
dW5jdGlvbi9ob29rIHJldHVybiBub24tdm9pZCwgeWV0IC4uLg0KPiANCj4gPiAtLS0gYS94ZW4v
YXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1f
c2hhcmluZy5jDQo+ID4gQEAgLTE2MzIsNiArMTYzMiw4IEBAIHN0YXRpYyBpbnQgY29weV92Y3B1
X3NldHRpbmdzKHN0cnVjdCBkb21haW4gKmNkLA0KPiBjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQ0K
PiA+ICAgICAgICAgICAgICBjb3B5X2RvbWFpbl9wYWdlKG5ld192Y3B1X2luZm9fbWZuLCB2Y3B1
X2luZm9fbWZuKTsNCj4gPiAgICAgICAgICB9DQo+ID4NCj4gPiArICAgICAgICBodm1fdm10cmFj
ZV9yZXNldChjZF92Y3B1KTsNCj4gDQo+IC4uLiB0aGUgb25seSBjYWxsZXIgZG9lc24ndCBjYXJl
Lg0KDQpOb3RlZC4gRm9yIG5vdyB0aGUgZnVuY3Rpb24gY291bGQganVzdCByZXR1cm4gdm9pZCBz
aW5jZSBpZiBJUFQgaXMgbm90IGVuYWJsZWQgd2UgZG9uJ3QgY2FyZSBmcm9tIGEgZm9yayByZXNl
dCBwZXJzcGVjdGl2ZS4gQnV0IHBlcmhhcHMgaW4gdGhlIGZ1dHVyZSB3ZSB3YW50IHRvIHJldHVy
biB0aGF0IGluZm9ybWF0aW9uIHRvIHRoZSB0b29sc3RhY2suIEhhdmVuJ3QgZGVjaWRlZCB5ZXQg
d2hldGhlciB0aGF0J3MgaW1wb3J0YW50IG9yIG5vdCwgZm9yIG5vdyB0aGluZ3MgYXJlIE9LIGFz
LWlzLg0KDQpUYW1hcw0K

