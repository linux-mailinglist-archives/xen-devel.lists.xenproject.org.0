Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7457744FE05
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 06:01:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225622.389633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmU6W-0008Mx-Hu; Mon, 15 Nov 2021 05:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225622.389633; Mon, 15 Nov 2021 05:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmU6W-0008LE-DQ; Mon, 15 Nov 2021 05:00:28 +0000
Received: by outflank-mailman (input) for mailman id 225622;
 Mon, 15 Nov 2021 05:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rbjM=QC=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1mmU6U-0008L8-Ez
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 05:00:26 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef7b9989-45d0-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 06:00:23 +0100 (CET)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2021 21:00:20 -0800
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 14 Nov 2021 21:00:20 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Nov 2021 21:00:19 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Nov 2021 21:00:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sun, 14 Nov 2021 21:00:19 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 14 Nov 2021 21:00:19 -0800
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN7PR11MB2563.namprd11.prod.outlook.com (2603:10b6:406:b0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 05:00:15 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81%9]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 05:00:15 +0000
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
X-Inumbo-ID: ef7b9989-45d0-11ec-9787-a32c541c8605
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="220588529"
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="220588529"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="547874803"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDUbhyfOeyhImvGWuN3lQeDgNwAIbrRBNR0tMdJlxtLnZcRVvs2bukXQK6udZChWxsb6S/EczjGFm5j5wJVpBj2R22LuHywR7ckCZli//kiTeA6SmvpdAB0zTQI6fF3+cygxcB0gnSaGvpSYJ7CAolyHXOQwGGzsJuPx8f1gHncBZzWi2Z0HGYTEvQDfZ4KmowdSMrylV3B0QGy/RJAqwYEtcvgPNOO5Z6gT7rjwOHZKWJMlGJjz1j4Vm8CEPqFGfVmBGfM3nOukWAqNO9QRz33vL+XmcRKrED1E7TQIyt/0AEhNw/zKxfHaAbyG3vmTJnlR6ygZfaVUzTu21RaGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLl+NxyQpvuV+cVlUlzsT8lUoFCJeUl9WH/lRAGCTuY=;
 b=M0H4IzP7TKSvP36VE4Uvc5gFc3jnLCLDgoU9lUalfSnviqRM5n+RwAf5XDldyMW5PBXo7UPxxEFlkymNm3m94Hhg5wUR0CHozHr7DCJSrFEdUH99LkGAeLwmVkRRmQ0U/mr0rhmSe2nuI4IRUw5LT54yGfxtvcdQ+ku0mQi1zlPpOSMcOLIAkXt356cD6oKKUMI4jZ0owotv4EeklguZS1WwcyWTyLbM9q5PQwSUORGqIZWoJDT2IDpLLcoN5LVtR/lHApsU0bCVYLHw6QmCorGRhjkbkEdVMH3jYxSEgwcuRCb+NwZwqam1UjD7MNi3rSD9TUW52BwyJhz+HKS2NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLl+NxyQpvuV+cVlUlzsT8lUoFCJeUl9WH/lRAGCTuY=;
 b=qot6jWqjAuF1+zkcblzVUxC8Fk6ZyDcJDurrm291iSb82muvwY6ZT1Nhu4qqk+8LvSC6a3DZfFAsRr4tHjTOnfvkrrrLJ9xgTXZtwZhtY8qL+sjV8mknqofxWmQ//0WxnyzfQ07qWaUTu9Bm2hLW7JoiX0iMcgcCqCbCTLrLAjU=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] VT-d: prune super-page related capability macros
Thread-Topic: [PATCH] VT-d: prune super-page related capability macros
Thread-Index: AQHX16rhBc/SqHgVkkqU69tKyIu0P6wEC+9Q
Date: Mon, 15 Nov 2021 05:00:15 +0000
Message-ID: <BN9PR11MB54333BF66C56160EE2C499DA8C989@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <30305930-0402-c01a-226f-508597a15a1a@suse.com>
In-Reply-To: <30305930-0402-c01a-226f-508597a15a1a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8733159d-8b51-4094-cb67-08d9a7f4cff4
x-ms-traffictypediagnostic: BN7PR11MB2563:
x-microsoft-antispam-prvs: <BN7PR11MB256337423D310A137FF9848A8C989@BN7PR11MB2563.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C2VP7ZZQtpZV2Mus5+Fx+pZlckMZnZ5oGBZmGuhad59BeSWCStkJDpaI46ekeIvmrwV+PbRwJr2MQsFlWELscCZTZvti9PkgfzCB1u9RVP0YsYnbfqrAhSWfS48NaS0RCJMiYLFAT+YcbwP/4DakZsBMxe0sksWKgHaHO5b0XsA+WNYF2eyxOR+m6BMgil6PMKqz7ISBz8z1+uy1io5agzD37s/rrJMBywIwjYY4V1IWCkFoLX84YxlojIYYjTbwm1NRQFq0Fx8hM4ugdPFnhFLWnSjj5+ugbeK7I6gOlh4CmKGbkfz5sdOUG/rFjO9SJTwPaFTWOtOOLnegbuTSAv3Cz1dBOnYpsYg55b1s4uP7d7yPIB8i1DcNw7pOtZC9P3BBxVPuxNAapXJTdt5nekPJVPEtb80ePAA7c9Lcnf9JQDWj8Zv7N0H0BKfkVLF5LLyziU4MVAMbzywM6+Oe15GQ6NIOmzpiv1WBZ4LX+UXId94GQcYT3lfYlMa+nRfQIAgP5LOALFxwPj8IfnUWT8ywKI1Gb3qHpAjmakAt5KHjFb/+lxigjbQZwh+W9QERSP5RmdDRfOR6uL0MJYipf4uQM4rIvIte91f9dhneNJg1lVe2ukSB2MuzfJzrS3Vql9YLLvz3T9Y0aMHrW+awtukF3gc3YwkYxB+dOv8bo9Vl0VhsUc52XzUQAj+dOYdDFM4s8mt8sfofdnDWgr6gEQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38070700005)(5660300002)(66946007)(66476007)(186003)(2906002)(508600001)(8676002)(26005)(55016002)(52536014)(86362001)(110136005)(316002)(76116006)(66556008)(9686003)(122000001)(8936002)(71200400001)(6506007)(33656002)(64756008)(66446008)(82960400001)(7696005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2ZLelV4NXRFSnBJRFI5ZVNkN0s5SVM4blNLbE9BdW03dE1ybytoemYyZWJq?=
 =?utf-8?B?eUlrOWltb3ZzVHI0Q1E2SDFvZnQrNEtEYWlRbi9MOHVSUkJqbENtcm5YZmU1?=
 =?utf-8?B?a0hSWTJTcXB6SVVXdlB4dlJaRXpPaUR5T1FydkJsM2lrNDlmMFZaYWxUaHpv?=
 =?utf-8?B?dWY0cnJiODZxZ0FhV2JGSFMxVHRlREZkY01WRUYrYmtzSnE2aXBxbGNhaHVG?=
 =?utf-8?B?aVl3UUJ1QkE2cFFwTGVZWGlSSWNKTDBVTnFib2hZbWxaMzVMUkY4Zk50dXU2?=
 =?utf-8?B?QzlFMEIwaWovNW1OQk9OODB3NUE0MmRPRDRwdXJoekg1bW1jNnU2WDBkc3NP?=
 =?utf-8?B?OXZjLzhqUlM4SjM4VVlkZUZnTWxnaDRobVFnRHpXVVUxelJaTk1TS3didGtB?=
 =?utf-8?B?WTdYRUxFSzNodk9VeDJpc20xbHdYakQ1VnlHdzNxTm9xYUNRQk9McmN5c3lC?=
 =?utf-8?B?YmM4MFNFdlBielFpUnVpdnZTK1NLaG4rUkhCRUwyNUx0Wjhtd0F6a0dNdUYy?=
 =?utf-8?B?UEVHZzg3MVlwWjF2eCt2YWR5cmF1S3NrUHFBd0o5T1AwWlkzZWNYdjZEdUoz?=
 =?utf-8?B?UEtNM0xXMHNTN1p4YzRvZnJFVnJPdW8zRWluQXYxTnIyaXpLaGpIdC9OdXZV?=
 =?utf-8?B?Yll0cWhLcjJRbDI4ejVLL0l0UUw0cTA0R00xOXViUFVUUko4Q0w3L0x6VVFq?=
 =?utf-8?B?TzFZT1A1Mk1qZ1JYY3lFYkNRWVZVN0lMbzRWRjFBbytoQlVWTWVVZE16MGky?=
 =?utf-8?B?bjhQSmZ3S0R1b0lRa25STUNheEc5Yy9Vbm9KVCtuTjNGRVlubEpoTSs1QVlm?=
 =?utf-8?B?MDZ2eEtWTFRFR29HZUgxcWdvVlordllzVjRXai9kdTh2UDhBNnlvakpmTll5?=
 =?utf-8?B?MTViU01KY0Q1KzRxV240MEQ3UzhaS2xIODBNZHNQUnBoL3JBVkpFZTM5ZjUy?=
 =?utf-8?B?T1FvdmM3UkErVGpSUXRiSVhFdVRocFBWQXhyK0lsWnNDeEJTSExYRVF2Y2dh?=
 =?utf-8?B?bDVIOW9EUkU5UWVWM3U4WFpPY3YxM0Nhc0xJSVc1d1hqZ0RZZ0xpL2FsemQz?=
 =?utf-8?B?aEJJektCSkhDWk5PWVBJZVJzOUkvUmdaZzg5N1hMME1zNmpSdDFyODdPYjMz?=
 =?utf-8?B?TXFhNUx3a0NjVDdVYmlIRHFrQnZxSnZRSGVuMDArWmRZVmlPOGhTczFacFMr?=
 =?utf-8?B?R0JIMGhyb05FVXFUTUlQekxMc0kzQkcwaHppeTFhR0NxTnpTelJSODUwR29p?=
 =?utf-8?B?S3J6UkNYK05OV29GOWlEMXBuMjdBU0U2V1RBemN0Y01HSVNpM2czOGczS3FL?=
 =?utf-8?B?K0Rpb1cveEx4WXB4dHhuNHFRaG5lL1pkYmlaN1JYUnljN1J3SE9pTFlTdmx6?=
 =?utf-8?B?WmMxV0tTcjJybzBvZzBqWENkNDBnL0NGWWtkS0xMR0hpSjlKTHVvNWxQYTJW?=
 =?utf-8?B?ME5pemZQMFhxT1I2MXBVSFVISm1FaUNKQ1Zrb2h6R3FGdy9RditsUCtlYkxo?=
 =?utf-8?B?WDQ0dVUzRnp4QTB2SXIreldPdUtMd09wS1hSZ0R2Tko3QlA4T2ZJcFNIaFhX?=
 =?utf-8?B?R2g5QjZzbDgyU0w0Y2VEOVB4OHYySnJiaFoxL2N0TFFGZmROZEhGV05Ga3Fw?=
 =?utf-8?B?c0U5Z2g1YXRWR1VENzdic2l6TG1zZ0VXVnZ2d1BMUW5HUy9nSlBVbzNSVnFs?=
 =?utf-8?B?SmRwTDFrSGtxMHVYdVgrcWpESDV6dlNHV0Z1K29TTjBaTXZCUUVRejFkSjd4?=
 =?utf-8?B?WEFGb2FRT3FsM3lpaURnMDVWSC9neDYvQ1ZFbWRCVnNram1nM29DQ1dmQk92?=
 =?utf-8?B?aXlwQ29tNTJKSFRsd0RzMEJ1NDR5dTBGSE9sYm9ZYUdWclVabHo2OWo0ZjV5?=
 =?utf-8?B?dE96SEFZVFIrWkwyOGwyK0grM0Z5ZTlVWHd5LzJBVFVrYWl3aGlYMlBrUFJD?=
 =?utf-8?B?eVpNWEc0UUJUVnNEUHlBaGczcnpwSHpqWmtJWVNjaXhGbEZZaFZwemRXa0FY?=
 =?utf-8?B?WkN4aExjK1dDUE5VREFnSmRXL3ZPSG1Ga01PQS9Hb0NqMnJveDZpTkNHTFk5?=
 =?utf-8?B?MjFnRmo5dW1vU0J1ZFkzSXViQ2ViQWk2dndHZFFIWnVybTREUzFYK25IU3lS?=
 =?utf-8?B?c3FKTEUxRVJ1QXcvT29ENEpKdmVuM2NXdnRsR1ZuTFo3UGpsNVkxTG1PcXh6?=
 =?utf-8?Q?RjVjQzrYahaWguDVUJ/lTO4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8733159d-8b51-4094-cb67-08d9a7f4cff4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 05:00:15.1445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZVGUZLjZaLjHq7EARGlGXxnLIUToEdEMUTiAA23H+4XnprVZblaVJqFYn8SkhNl3Dx9PjGEwlzb9gWLc3Agcvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2563
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
Tm92ZW1iZXIgMTIsIDIwMjEgNTo1MSBQTQ0KPiANCj4gY2FwX3N1cGVyX3BhZ2VfdmFsKCkgYW5k
IGNhcF9zdXBlcl9vZmZzZXQoKSBhcmUgdW51c2VkIChhcGFydCBmcm9tIHRoZQ0KPiBsYXR0ZXIg
dXNpbmcgdGhlIGZvcm1lcikuIEkgZG9uJ3Qgc2VlIGhvdyBjYXBfc3VwZXJfb2Zmc2V0KCkgY2Fu
IGJlDQo+IHVzZWZ1bCBpbiBpdHMgY3VycmVudCBzaGFwZTogY2FwX3N1cGVyX3BhZ2VfdmFsKCkn
cyByZXN1bHQgaXMgbm90IGFuDQo+IGx2YWx1ZSBhbmQgaGVuY2UgY2FuJ3QgaGF2ZSBpdHMgYWRk
cmVzcyB0YWtlbi4gUGx1cyBhIHVzZXIgd291bGQgaGF2ZQ0KPiB0byBjaGVjayB0aGUgY2FwYWJp
bGl0eSByZWdpc3RlciBmaWVsZCBpcyBub24temVybywgZm9yDQo+IGZpbmRfZmlyc3RfYml0KCkg
KG9yIGZpbmRfZmlyc3Rfc2V0X2JpdCgpLCBpZiBzdWl0YWJseSBjb3JyZWN0ZWQpIHRvIGJlDQo+
IHZhbGlkIGluIHRoZSBmaXJzdCBwbGFjZS4gWWV0IGFzIHBlciB0aGUgc3BlYyB3aGVuIHRoZSBm
aWVsZCBpcyBub24temVybw0KPiB0aGUgbG93IGJpdCB3b3VsZCBhbHdheXMgYmUgc2V0LCBzbyB0
aGUgcmVzdWx0IHdvdWxkIGJlIGluZGVwZW5kZW50IG9mDQo+IHRoZSBhY3R1YWwgdmFsdWUgdGhl
IGZpZWxkIGhvbGRzLg0KPiANCj4gRnVydGhlciB6YXAgY2FwX3Nwc181MTJnYigpIGFuZCBjYXBf
c3BzXzF0YigpLiBXaGlsZSBlYXJsaWVyIHZlcnNpb25zDQo+IG9mIHRoZSBzcGVjIGhhZCB0aGlu
Z3Mgc3BlbGxlZCBvdXQgdGhhdCB3YXksIHRoZSBjdXJyZW50IHZlcnNpb24gbWFya3MNCj4gdGhl
IHR3byBiaXRzIGFzIHJlc2VydmVkLiBBbmQgIjQ4LWJpdCBvZmZzZXQgdG8gcGFnZSBmcmFtZSIg
d2Fzbid0IGluDQo+IGxpbmUgd2l0aCAxVGIgcGFnZXMgYW55d2F5IC0gY2xlYXJseSAyNTZUYiBw
YWdlcyB3b3VsZCBoYXZlIGJlZW4gbWVhbnQNCj4gaGVyZS4NCj4gDQo+IEZpbmFsbHkgcHJvcGVy
bHkgcGFyZW50aGVzaXplIHBhcmFtZXRlciB1c2VzIGluIHRoZSByZW1haW5pbmcgdHdvDQo+IG1h
Y3Jvcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KDQo+
IA0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuaA0KPiArKysgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuaA0KPiBAQCAtNjgsMTMgKzY4LDggQEAN
Cj4gICNkZWZpbmUgY2FwX251bV9mYXVsdF9yZWdzKGMpICAoKCgoYykgPj4gNDApICYgMHhmZikg
KyAxKQ0KPiAgI2RlZmluZSBjYXBfcGdzZWxfaW52KGMpICAgICAgICgoKGMpID4+IDM5KSAmIDEp
DQo+IA0KPiAtI2RlZmluZSBjYXBfc3VwZXJfcGFnZV92YWwoYykgICgoKGMpID4+IDM0KSAmIDB4
ZikNCj4gLSNkZWZpbmUgY2FwX3N1cGVyX29mZnNldChjKSAgICAoKChmaW5kX2ZpcnN0X2JpdCgm
Y2FwX3N1cGVyX3BhZ2VfdmFsKGMpLCA0KSkgXA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKiBPRkZTRVRfU1RSSURFKSArIDIxKQ0KPiAtI2RlZmluZSBjYXBfc3BzXzJtYihj
KSAgICAgICAgICgoYyA+PiAzNCkgJiAxKQ0KPiAtI2RlZmluZSBjYXBfc3BzXzFnYihjKSAgICAg
ICAgICgoYyA+PiAzNSkgJiAxKQ0KPiAtI2RlZmluZSBjYXBfc3BzXzUxMmdiKGMpICAgICAgICgo
YyA+PiAzNikgJiAxKQ0KPiAtI2RlZmluZSBjYXBfc3BzXzF0YihjKSAgICAgICAgICgoYyA+PiAz
NykgJiAxKQ0KPiArI2RlZmluZSBjYXBfc3BzXzJtYihjKSAgICAgICAgICgoKGMpID4+IDM0KSAm
IDEpDQo+ICsjZGVmaW5lIGNhcF9zcHNfMWdiKGMpICAgICAgICAgKCgoYykgPj4gMzUpICYgMSkN
Cj4gDQo+ICAjZGVmaW5lIGNhcF9mYXVsdF9yZWdfb2Zmc2V0KGMpICAgICgoKChjKSA+PiAyNCkg
JiAweDNmZikgKiAxNikNCj4gDQoNCg==

