Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F513AAFC3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 11:32:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143780.264844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltoNB-00083f-Ff; Thu, 17 Jun 2021 09:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143780.264844; Thu, 17 Jun 2021 09:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltoNB-000819-C0; Thu, 17 Jun 2021 09:31:41 +0000
Received: by outflank-mailman (input) for mailman id 143780;
 Thu, 17 Jun 2021 09:31:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MES1=LL=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1ltoN9-000813-PY
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 09:31:39 +0000
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e750a340-3971-418e-898e-001bf7750e19;
 Thu, 17 Jun 2021 09:31:34 +0000 (UTC)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 02:31:30 -0700
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga008.fm.intel.com with ESMTP; 17 Jun 2021 02:31:30 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 17 Jun 2021 02:31:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Thu, 17 Jun 2021 02:31:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Thu, 17 Jun 2021 02:31:29 -0700
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR11MB0078.namprd11.prod.outlook.com (2603:10b6:301:67::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.25; Thu, 17 Jun
 2021 09:31:28 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1%12]) with mapi id 15.20.4219.026; Thu, 17 Jun
 2021 09:31:28 +0000
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
X-Inumbo-ID: e750a340-3971-418e-898e-001bf7750e19
IronPort-SDR: wN4P4Xdn10if/9ZRvadIT89EFg0JCTyNUuKdLai2QPvwMvcSA39p+4Y6xcNxGQbYT17tutk4sc
 GMVNDsJhZzwA==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="193649631"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="193649631"
IronPort-SDR: EnMhxKYV8PSUfoNKE1yMC5CHGpeU9Lrj0/vUj4M8lzD4pbulkXupir/31KhEpY82HrYIzdS/DW
 FmTjkM3p6d2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="452718626"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTyI1piCn1cfnBdJXvqHowLFtC/fd19VfIlI4K3PkPdSdd/INWelnIGwbBfiZoubW63v/mNpHPPi6nlMfnGecL/NnrJBimdzbeyYvbSfmKBrDQD3pj5YunsKSl0awwA0WxUUFWc+uw1PEkwjMs8+SOpTDTIlFS9FP9K7OF6vzrMi7VJHu8gkmPGLnAWWbIWQ/gkLAIrhW4AAY6dwqIct9dMe55fMW0xLXeSR5h2SofFqvFhB0VLM8+0ulHx33tyOv06mzv+hbpyEdBq1ONI21XiyCgB1RLqXpn6C5+JqSiYYYJYVpX/xK9TRFabVLLmBF7JaekZrAIt/7JTAkMljAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwjA6BTH8ZWpUjj7gzMajhJYmZ3C1iclArhYWN9xA1o=;
 b=CTvJ7UbwcVauQ8eziuhKtd5CVUt2AccEFB4PLG7mFV61bI+76HqmXXaoWR+/qOXZIvrzfXc06j4H7NnSAl0o53BVBGYzJAdC5sIN8ZuUC/kpoXj1i2eLXMZvNKjnsCPLXY0FII4gvDaZLmYND97HhJqK50tqRuMYm0o8AA+SC1eE6bwdb22GSmDHubg2Z+IHOoaecrvbOJC4o87gMFwtJjO2LRdPrtx7hgwkSmVmDFwFnkqY98/thnZdGkV37ilDFGaEImntuFpTv5gRexCQl5GZSCc9EO2twhUO3t/kcyKgGEmpVdX7Fuc3pBJe7+Iski/K6Lqpl8JHg8Nx5817Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwjA6BTH8ZWpUjj7gzMajhJYmZ3C1iclArhYWN9xA1o=;
 b=VdQ5VtjTaCEwft3wJ70AGuOAabxPPRf994JOjotJy0uzYnDjbLxW8kWl2fRY06MW4crVYFblCr/mMJZ9TB0bKDt1aSNPnoS43T7g0L36ah0iCbsUEI4Vf5FP22BZM7hpHFxGX6QCj7enJJK/6W9/Sc7LvDqEWXyZE1JFJn/+LYA=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "George
 Dunlap" <george.dunlap@citrix.com>
Subject: RE: [PATCH 3/3] x86/ept: force WB cache attributes for grant and
 foreign maps
Thread-Topic: [PATCH 3/3] x86/ept: force WB cache attributes for grant and
 foreign maps
Thread-Index: AQHXU+iHZrSdS3qT+0aqrtTH7ImtXqsYDW1w
Date: Thu, 17 Jun 2021 09:31:28 +0000
Message-ID: <MWHPR11MB188653F8277F861018DB00118C0E9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210528173935.29919-1-roger.pau@citrix.com>
 <20210528173935.29919-4-roger.pau@citrix.com>
In-Reply-To: <20210528173935.29919-4-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.142.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 333c5d64-6cff-42c5-f03a-08d93172aefe
x-ms-traffictypediagnostic: MWHPR11MB0078:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB00780FB4A32A4B0AAC0FA8338C0E9@MWHPR11MB0078.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MnVZwdKYVTXgTw9U9OrHOa1qxWERUnyQKvyXSJo/3tswfGBf773uCSVwDWsZ3jcza/qKWjrURCYHXskMI8KSq7seNot2PqIGknfq6ACA1xNwnysm5xwRZtE8Js57GOAknpmqKhP/PnrMbtK5vHFn3xbQQ4+4LN5Aa7QxRS+ED6WghsL9VNKFQBZaa+uMKL0qJpLYn3qX6ZyHTc/0cyT16hyJ+7HOoERPIlOw2Ir8Bs0Rl3ifIpqH4r2D8PjCuhIbyrKfC65mvY0CEwiJF9qSijz147tL/otpZlIIjbECKbFU9wQ4oQqqTnVPjhcTtxALUAY7bY+IXMP2fIUJDAk7nYhRURA3qrmyQtk/mCLd+NPomN9LEQEPkPhhxL0YHhagLiJy7ZTwyHoIJUx2u+eUTq/Brdm45VPlaLG3qH4pVnhEc495D3Eiu78WgvAURzWXplziF47CsYk0nf1wx5mvLltHnCGa7TpLuRQm8FescX03XuTqTx3HTOwtgth0qXAqTqA9bGN/stDVchpQ3LjNtmDeXQsqX15QP2E0hrVXM2EwgkhWBjeMzBhI9gES5SZX5ZJkHqKtCLgvPmfQ9TCHy8B4YptGBSePNejDMJIYI3U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(39860400002)(396003)(366004)(136003)(110136005)(316002)(54906003)(83380400001)(8676002)(26005)(5660300002)(33656002)(4326008)(66446008)(71200400001)(55016002)(76116006)(186003)(7696005)(6506007)(52536014)(66476007)(66556008)(64756008)(122000001)(86362001)(9686003)(2906002)(478600001)(8936002)(66946007)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anJLeVlvNXIrZzlhL2JkQjRWa01lQWpMVDNsUXRpWXBUa0dvcTdXOHZ1dWIy?=
 =?utf-8?B?VTY2dEQ5ckxreEJ4YVNXNGhsSUpEOEJNSDNOZGhSTmJsWmZnSERjeGxGb1Vn?=
 =?utf-8?B?aVhBb3JmZTN1WGttLzdnNjEwS2hueWoxQng4TjZram1FemplQTErV3paSkwz?=
 =?utf-8?B?cTEwNHFvZUxZUlpoNWx1c3hyd0d1cVkyZ01pcGFmSnBsc1QyWG9jQm1UWVp6?=
 =?utf-8?B?TUU2L3pKa1dBb0VnQjI3M3VvOXpHMDJUQWNCd21pUUdqOUQva3J2eThWeGlK?=
 =?utf-8?B?VGxyUWFDVVBkVDh6QlRyTDBGZUh0UGxQSmRZUHY1RzRHUWdGa3FuVnNFdUFt?=
 =?utf-8?B?c3llMC9FZ3RsaDFEQXpCUkJmSjV1Mlc3M2xVYmd3VThTN3FIamtFVXd2d2JF?=
 =?utf-8?B?N2hkWFdVMGpKcGNWWDIrWm9wckV0M1BvaFd6UXloQjdza1FtZ0NOU3R3QU5H?=
 =?utf-8?B?Qm5tMWRmMUhvWW1qMzlxTS9lYngvVS9EMFRtWkpBY2ExK0dKQ2FYRGNPWUo5?=
 =?utf-8?B?RzZsb3p3UWhRc2dvOFA1dU01ak9LcXlhaGU2ZFNpTEh2UWlTSHVDL3R0eGQ5?=
 =?utf-8?B?RitCaU5QSDlzTUZYVUZPU2VqajZ5MjBSVmFvT00wUUh6Qlh4M0pnTFU0Z2VD?=
 =?utf-8?B?N3ZlYmVSMVlMNHNodUxOQ25kQkY0NmY1cUlVMUZNZ2FMN3ZUWU4wOUZnck9m?=
 =?utf-8?B?RE5yUzNLdjZDVHNzdGhaNVhoWFJ1V0FWS0ZzQVJYVlcvQ0xlaVJYNmZCKzNs?=
 =?utf-8?B?S2JwanRsdWFNTXVnM1ZDOUdkM0Z5WnVYc1JOMXV4THRsa29oMXBxV1JUa09U?=
 =?utf-8?B?cEoyUTRVanYwWjBROG5ZcExlSGRlelYrOU9RTldDZUk3dk9DRkZFeVY0OGNC?=
 =?utf-8?B?UmppbW9Sd3duVEVZTUcydUU5YnBtZXFZSGNObTV1S2RKRGYxRGVrYXlUNXA5?=
 =?utf-8?B?UllONGJpZnVVVjdyVm9QNHVlekpoOXBiMk1CckF2a0ZnWk9STjZrL1dRMzNq?=
 =?utf-8?B?ZnlBRnk0QmhaNHZPSGhNWFhHKzZyVHpKcFV4QXhhRzBnQ0Eza2NjelZ4TFhY?=
 =?utf-8?B?enVYbWMrNGNKVWlvS2JEaEpXMk4rUE96dGxnbGtXa1EwVlZQSS9CRWlvcS9J?=
 =?utf-8?B?OVdmZmViR0F3SEhtcC9tdjRncU1Va3E5WWlia1FlV2xPL0x4bXBLZWprWXFK?=
 =?utf-8?B?N1lBSHlCendvaHF0cHRHZnA4ZzIxTUI5WXNoc2huT3IvUDd3NG1MaGlDc0RY?=
 =?utf-8?B?TFBndVJDdGF3MkpPRXJNRzFKbS9vTnJaSll2UThaWGlGaW04VGRLbnN5Z3dZ?=
 =?utf-8?B?d1ArVVhwTDNNQUZJWGN6SGp0ZmRDQ3I3Ym43V0hMUFdPazZJL2VuMkdlZWIz?=
 =?utf-8?B?WmVzcmJLdGpaMDhoN2N2enc4dU05SXFiVGhMVVd4aVZDM3BPL1hpcWp4Zk52?=
 =?utf-8?B?K3BFdDZ2MUNyZUhPeEtFUXdjbUVoV0VZV00vY3RDb2p3SCtDY2tKeUNHWHNM?=
 =?utf-8?B?aFpQdkgzU2xpR0pOVGNobXhZNXBBbFZ3TkRqclFjRWlIbzJ3S2RVWUt3ZEc4?=
 =?utf-8?B?RjRYeVNRbjFJTlZDZDdUSU1mZ2hmdnZWNmtIWnl4M3lyQStXRGxPaWhxZ2JH?=
 =?utf-8?B?bjB5VUJoM05VMTFLcWFhQ2VWVEU5dXJ2eTdZN0FacnRsay85enZFb1psRjRS?=
 =?utf-8?B?NFN3THF1d1RPT29kMHg1RDdnSmlPbG9xZHM1ekZGc2hlTlcyQnJSZ3FPZXJy?=
 =?utf-8?Q?Yhtm21zovwUUoB1geeguAASLxcThnbBG4cIz1j5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 333c5d64-6cff-42c5-f03a-08d93172aefe
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 09:31:28.0472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R2dEl3M4ev3SMxzCtXKIi5HrNzY4RS8yf3K++41yXUsMNbgqqoK7+1ghBVZrXsSQIskKyvu8JFlf39c/oGCQBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0078
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBT
YXR1cmRheSwgTWF5IDI5LCAyMDIxIDE6NDAgQU0NCj4gDQo+IEZvcmNlIFdCIHR5cGUgZm9yIGdy
YW50cyBhbmQgZm9yZWlnbiBwYWdlcy4gVGhvc2UgYXJlIHVzdWFsbHkgbWFwcGVkDQo+IG92ZXIg
dW5wb3B1bGF0ZWQgcGh5c2ljYWwgcmFuZ2VzIGluIHRoZSBwMm0sIGFuZCB0aG9zZSByYW5nZXMg
d291bGQNCj4gdXN1YWxseSBiZSBVQyBpbiB0aGUgTVRSUiBzdGF0ZSwgd2hpY2ggaXMgdW5saWtl
bHkgdG8gYmUgdGhlIGNvcnJlY3QNCj4gY2FjaGUgYXR0cmlidXRlLiBJdCdzIGFsc28gY3VtYmVy
c29tZSAob3IgZXZlbiBpbXBvc3NpYmxlKSBmb3IgdGhlDQo+IGd1ZXN0IHRvIGJlIHNldHRpbmcg
dGhlIE1UUlIgdHlwZSBmb3IgYWxsIHRob3NlIG1hcHBpbmdzIGFzIFdCLCBhcw0KPiBNVFJSIHJh
bmdlcyBhcmUgZmluaXRlLg0KPiANCj4gTm90ZSB0aGF0IG9uIEFNRCB3ZSBjYW5ub3QgZm9yY2Ug
YSBjYWNoZSBhdHRyaWJ1dGUgYmVjYXVzZSBvZiB0aGUgbGFjaw0KPiBvZiBpZ25vcmUgUEFUIGVx
dWl2YWxlbnQsIHNvIHRoZSBiZWhhdmlvciBoZXJlIHNsaWdodGx5IGRpdmVyZ2VzDQo+IGJldHdl
ZW4gQU1EIGFuZCBJbnRlbCAob3IgRVBUIHZzIE5QVC9zaGFkb3cpLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNClJldmlld2Vk
LWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg0KYnR3IGluY29ycmVjdCBj
YWNoZSBhdHRyaWJ1dGUgYnJpbmdzIGZ1bmN0aW9uYWwvcGVyZm9ybWFuY2UgcHJvYmxlbS4gDQpp
dCdkIGJlIGdvb2QgdG8gZXhwbGFpbiBhIGJpdCB3aHkgdGhpcyBwcm9ibGVtIGRvZXNuJ3QgaHVy
dCBBTUQgaW4gdGhlIA0KY29tbWl0IG1zZy4uLg0KDQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L2h2
bS92bXgvdm14LmMgICAgICAgIHwgIDIgKy0NCj4gIHhlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMg
ICAgICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4gIHhlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL3ZteC92bXguaCB8ICAyICstDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDMy
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0KPiBpbmRl
eCAwZDRiNDc2ODFiLi5lMDliN2UzYWY5IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZt
L3ZteC92bXguYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0KPiBAQCAtNDIz
LDcgKzQyMyw3IEBAIHN0YXRpYyB2b2lkIGRvbWFpbl9jcmVhdGlvbl9maW5pc2hlZChzdHJ1Y3Qg
ZG9tYWluDQo+ICpkKQ0KPiAgICAgICAgICByZXR1cm47DQo+IA0KPiAgICAgIEFTU0VSVChlcHRl
X2dldF9lbnRyeV9lbXQoZCwgZ2ZuLCBhcGljX2FjY2Vzc19tZm4sIDAsICZpcGF0LA0KPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJ1ZSkgPT0gTVRSUl9UWVBFX1dSQkFDSyk7DQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1fbW1pb19kaXJlY3QpID09IE1UUlJf
VFlQRV9XUkJBQ0spOw0KPiAgICAgIEFTU0VSVChpcGF0KTsNCj4gDQo+ICAgICAgaWYgKCBzZXRf
bW1pb19wMm1fZW50cnkoZCwgZ2ZuLCBhcGljX2FjY2Vzc19tZm4sIFBBR0VfT1JERVJfNEspICkN
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMgYi94ZW4vYXJjaC94ODYv
bW0vcDJtLWVwdC5jDQo+IGluZGV4IGYxZDFkMDdlOTIuLjU5YzAzMjU0NzMgMTAwNjQ0DQo+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3Ay
bS1lcHQuYw0KPiBAQCAtNDg3LDExICs0ODcsMTIgQEAgc3RhdGljIGludCBlcHRfaW52YWxpZGF0
ZV9lbXRfcmFuZ2Uoc3RydWN0DQo+IHAybV9kb21haW4gKnAybSwNCj4gIH0NCj4gDQo+ICBpbnQg
ZXB0ZV9nZXRfZW50cnlfZW10KHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwgbWZuX3QgbWZu
LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXIsIGJvb2wgKmlw
YXQsIGJvb2wgZGlyZWN0X21taW8pDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBvcmRlciwgYm9vbCAqaXBhdCwgcDJtX3R5cGVfdCB0eXBlKQ0KPiAgew0KPiAgICAgIGlu
dCBnbXRycl9tdHlwZSwgaG10cnJfbXR5cGU7DQo+ICAgICAgc3RydWN0IHZjcHUgKnYgPSBjdXJy
ZW50Ow0KPiAgICAgIHVuc2lnbmVkIGxvbmcgaTsNCj4gKyAgICBib29sIGRpcmVjdF9tbWlvID0g
dHlwZSA9PSBwMm1fbW1pb19kaXJlY3Q7DQo+IA0KPiAgICAgICppcGF0ID0gZmFsc2U7DQo+IA0K
PiBAQCAtNTM1LDkgKzUzNiwzMyBAQCBpbnQgZXB0ZV9nZXRfZW50cnlfZW10KHN0cnVjdCBkb21h
aW4gKmQsIGdmbl90IGdmbiwNCj4gbWZuX3QgbWZuLA0KPiAgICAgICAgICB9DQo+ICAgICAgfQ0K
PiANCj4gLSAgICBpZiAoIGRpcmVjdF9tbWlvICkNCj4gKyAgICBzd2l0Y2ggKCB0eXBlICkNCj4g
KyAgICB7DQo+ICsgICAgY2FzZSBwMm1fbW1pb19kaXJlY3Q6DQo+ICAgICAgICAgIHJldHVybiBN
VFJSX1RZUEVfVU5DQUNIQUJMRTsNCj4gDQo+ICsgICAgY2FzZSBwMm1fZ3JhbnRfbWFwX3JvOg0K
PiArICAgIGNhc2UgcDJtX2dyYW50X21hcF9ydzoNCj4gKyAgICBjYXNlIHAybV9tYXBfZm9yZWln
bjoNCj4gKyAgICAgICAgLyoNCj4gKyAgICAgICAgICogRm9yY2UgV0IgdHlwZSBmb3IgZ3JhbnRz
IGFuZCBmb3JlaWduIHBhZ2VzLiBUaG9zZSBhcmUgdXN1YWxseQ0KPiBtYXBwZWQNCj4gKyAgICAg
ICAgICogb3ZlciB1bnBvcHVsYXRlZCBwaHlzaWNhbCByYW5nZXMgaW4gdGhlIHAybSwgYW5kIHRo
b3NlIHdvdWxkDQo+IHVzdWFsbHkNCj4gKyAgICAgICAgICogYmUgVUMgaW4gdGhlIE1UUlIgc3Rh
dGUsIHdoaWNoIGlzIHVubGlrZWx5IHRvIGJlIHRoZSBjb3JyZWN0IGNhY2hlDQo+ICsgICAgICAg
ICAqIGF0dHJpYnV0ZS4gSXQncyBhbHNvIGN1bWJlcnNvbWUgKG9yIGV2ZW4gaW1wb3NzaWJsZSkg
Zm9yIHRoZSBndWVzdA0KPiArICAgICAgICAgKiB0byBiZSBzZXR0aW5nIHRoZSBNVFJSIHR5cGUg
Zm9yIGFsbCB0aG9zZSBtYXBwaW5ncyBhcyBXQiwgYXMgTVRSUg0KPiArICAgICAgICAgKiByYW5n
ZXMgYXJlIGZpbml0ZS4NCj4gKyAgICAgICAgICoNCj4gKyAgICAgICAgICogTm90ZSB0aGF0IG9u
IEFNRCB3ZSBjYW5ub3QgZm9yY2UgYSBjYWNoZSBhdHRyaWJ1dGUgYmVjYXVzZSBvZiB0aGUNCj4g
KyAgICAgICAgICogbGFjayBvZiBpZ25vcmUgUEFUIGVxdWl2YWxlbnQsIHNvIHRoZSBiZWhhdmlv
ciBoZXJlIHNsaWdodGx5DQo+ICsgICAgICAgICAqIGRpdmVyZ2VzLiBTZWUgcDJtX3R5cGVfdG9f
ZmxhZ3MgZm9yIHRoZSBBTUQgYXR0cmlidXRlcy4NCj4gKyAgICAgICAgICovDQo+ICsgICAgICAg
ICppcGF0ID0gdHJ1ZTsNCj4gKyAgICAgICAgcmV0dXJuIE1UUlJfVFlQRV9XUkJBQ0s7DQo+ICsN
Cj4gKyAgICBkZWZhdWx0Og0KPiArICAgICAgICBicmVhazsNCj4gKyAgICB9DQo+ICsNCj4gICAg
ICBnbXRycl9tdHlwZSA9IGh2bV9nZXRfbWVtX3Bpbm5lZF9jYWNoZWF0dHIoZCwgZ2ZuLCBvcmRl
cik7DQo+ICAgICAgaWYgKCBnbXRycl9tdHlwZSA+PSAwICkNCj4gICAgICB7DQo+IEBAIC02NDAs
NyArNjY1LDcgQEAgc3RhdGljIGludCByZXNvbHZlX21pc2NvbmZpZyhzdHJ1Y3QgcDJtX2RvbWFp
bg0KPiAqcDJtLCB1bnNpZ25lZCBsb25nIGdmbikNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnRpbnVlOw0KPiAgICAgICAgICAgICAgICAgICAgICBlLmVtdCA9IGVwdGVfZ2V0X2VudHJ5
X2VtdChwMm0tPmRvbWFpbiwgX2dmbihnZm4gKyBpKSwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgX21mbihlLm1mbiksIDAsICZpcGF0LA0KPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlLnNhX3AybXQgPT0g
cDJtX21taW9fZGlyZWN0KTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZS5zYV9wMm10KTsNCj4gICAgICAgICAgICAgICAgICAgICAgZS5pcGF0ID0g
aXBhdDsNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgIG50ID0gcDJtX3JlY2FsY190eXBlKGUu
cmVjYWxjLCBlLnNhX3AybXQsIHAybSwgZ2ZuICsgaSk7DQo+IEBAIC02NTksNyArNjg0LDcgQEAg
c3RhdGljIGludCByZXNvbHZlX21pc2NvbmZpZyhzdHJ1Y3QgcDJtX2RvbWFpbg0KPiAqcDJtLCB1
bnNpZ25lZCBsb25nIGdmbikNCj4gICAgICAgICAgICAgICAgICBpbnQgZW10ID0gZXB0ZV9nZXRf
ZW50cnlfZW10KHAybS0+ZG9tYWluLCBfZ2ZuKGdmbiksDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBfbWZuKGUubWZuKSwNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxldmVsICogRVBUX1RBQkxFX09SREVSLCAm
aXBhdCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGUu
c2FfcDJtdCA9PSBwMm1fbW1pb19kaXJlY3QpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZS5zYV9wMm10KTsNCj4gICAgICAgICAgICAgICAgICBib29s
X3QgcmVjYWxjID0gZS5yZWNhbGM7DQo+IA0KPiAgICAgICAgICAgICAgICAgIGlmICggcmVjYWxj
ICYmIHAybV9pc19jaGFuZ2VhYmxlKGUuc2FfcDJtdCkgKQ0KPiBAQCAtODk1LDcgKzkyMCw3IEBA
IGVwdF9zZXRfZW50cnkoc3RydWN0IHAybV9kb21haW4gKnAybSwgZ2ZuX3QgZ2ZuXywNCj4gbWZu
X3QgbWZuLA0KPiAgICAgICAgICBib29sIGlwYXQ7DQo+ICAgICAgICAgIGludCBlbXQgPSBlcHRl
X2dldF9lbnRyeV9lbXQocDJtLT5kb21haW4sIF9nZm4oZ2ZuKSwgbWZuLA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGkgKiBFUFRfVEFCTEVfT1JERVIsICZpcGF0LA0K
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybXQgPT0gcDJtX21taW9f
ZGlyZWN0KTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm10KTsN
Cj4gDQo+ICAgICAgICAgIGlmICggZW10ID49IDAgKQ0KPiAgICAgICAgICAgICAgbmV3X2VudHJ5
LmVtdCA9IGVtdDsNCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92
bXguaCBiL3hlbi9pbmNsdWRlL2FzbS0NCj4geDg2L2h2bS92bXgvdm14LmgNCj4gaW5kZXggZjY2
OGVlMWYwOS4uMGRlYjUwNzQ5MCAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vdm14L3ZteC5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92bXguaA0K
PiBAQCAtNjAwLDcgKzYwMCw3IEBAIHZvaWQgZXB0X3AybV91bmluaXQoc3RydWN0IHAybV9kb21h
aW4gKnAybSk7DQo+ICB2b2lkIGVwdF93YWxrX3RhYmxlKHN0cnVjdCBkb21haW4gKmQsIHVuc2ln
bmVkIGxvbmcgZ2ZuKTsNCj4gIGJvb2xfdCBlcHRfaGFuZGxlX21pc2NvbmZpZyh1aW50NjRfdCBn
cGEpOw0KPiAgaW50IGVwdGVfZ2V0X2VudHJ5X2VtdChzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBn
Zm4sIG1mbl90IG1mbiwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG9y
ZGVyLCBib29sICppcGF0LCBib29sIGRpcmVjdF9tbWlvKTsNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IG9yZGVyLCBib29sICppcGF0LCBwMm1fdHlwZV90IHR5cGUpOw0K
PiAgdm9pZCBzZXR1cF9lcHRfZHVtcCh2b2lkKTsNCj4gIHZvaWQgcDJtX2luaXRfYWx0cDJtX2Vw
dChzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaSk7DQo+ICAvKiBMb2NhdGUgYW4gYWx0
ZXJuYXRlIHAybSBieSBpdHMgRVBUUCAqLw0KPiAtLQ0KPiAyLjMxLjENCg0K

