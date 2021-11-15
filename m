Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79C644FEA0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 07:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225663.389722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmVJi-0002bX-Ae; Mon, 15 Nov 2021 06:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225663.389722; Mon, 15 Nov 2021 06:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmVJi-0002Zl-7I; Mon, 15 Nov 2021 06:18:10 +0000
Received: by outflank-mailman (input) for mailman id 225663;
 Mon, 15 Nov 2021 06:18:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rbjM=QC=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1mmVJf-0002Zf-RY
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 06:18:07 +0000
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9a7bea9-45db-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 07:18:04 +0100 (CET)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2021 22:18:02 -0800
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 14 Nov 2021 22:18:02 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Nov 2021 22:18:02 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Nov 2021 22:18:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sun, 14 Nov 2021 22:18:02 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 14 Nov 2021 22:18:01 -0800
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN8PR11MB3842.namprd11.prod.outlook.com (2603:10b6:408:82::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 06:18:00 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81%9]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 06:18:00 +0000
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
X-Inumbo-ID: c9a7bea9-45db-11ec-a9d2-d9f7a1cc8784
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="294206443"
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="294206443"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="505784370"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJkFpouZiJlUNJI7krCoGfYqFJj1SMMuD/k1Qzm7SVCd/efysMehMFjlDfMKdFnmCdV6ITweWys5JdXR5JR/MCexfpY+FIRW/Hozd+839aldaXrPcZnTE/n2VPLxgyo3rNsMmd8xu8bwaD5pmlvza++GSp6H/GHH+Tgv+sYn/Q4FeHLOhmgpLV4I+R5QV68FAz69U8XcnmZYD8DtRu51Q5GV9i5HKPCVPNBqR/beTMDA5MlOVYo4DuREFMg5pJNlw0ps1VDd5++eA6hJ7AoqMaFwaA9vSkDeSdQWEN2VetcJ6uZkVFUQD76I/Q5JSbwPi1fgl7eQs7YnfioTgEKxSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vJYdC9UmRXVosbZeop0uhLXUgUNFr4BZOaFjHp9LKI=;
 b=NzFfxX1X742z7crdvpwWUyK6awMmKcX8FfE7xJGQxGsSNN6r86toCPFN6sRFRT7oE2aVvAa3z9x02IT1g7HJoQNGlhPjiggFG+LmQEviH+w9f2iVteA+SJFO4sKDZvSISpGomopMy5/GAw0q7uCubAVD+TUpcI1XBiM6SE+YV7YhrW4duUnREvHNo6wjbek/tua9Fe3aFOBptPp9x92ZIfhNT21gwS8K09ozfwLbJXvsMuZzRfUoQNuUjYIMI/YGvxc9QIJm0gY8GfhlDWLBisjNtuuiItLUExuIUu5x1CY5dItfsq0bSakAq5VwyXKYg37oCpuiKh7AMpXvNrkd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vJYdC9UmRXVosbZeop0uhLXUgUNFr4BZOaFjHp9LKI=;
 b=bzey2boJvsPocbWY5ztPqxiXLLaB66TRmWaKQoT3IYF8Hr4NLisginybzOWoiJt5wfGnrmf2Z1jAIV5fIsOJ83DS3jjp6VYQBlDmHMe0oG9jgXQ5xGQqEpJVCmkD8F+Auuv1gbiQrzEKsPFny/xI7SVmBxZZdVm+k5Elq3PgjCU=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 6/6] VT-d: avoid allocating domid_{bit,}map[] when
 possible
Thread-Topic: [PATCH 6/6] VT-d: avoid allocating domid_{bit,}map[] when
 possible
Thread-Index: AQHX16q9WmxQsBgQrkWPsFUCOcTQhKwEGx2A
Date: Mon, 15 Nov 2021 06:18:00 +0000
Message-ID: <BN9PR11MB5433479ED71950BF52AFB8AD8C989@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <74734976-b5a0-3372-7c7c-9f866945777c@suse.com>
In-Reply-To: <74734976-b5a0-3372-7c7c-9f866945777c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27630fe5-98cd-4ad9-a472-08d9a7ffacb0
x-ms-traffictypediagnostic: BN8PR11MB3842:
x-microsoft-antispam-prvs: <BN8PR11MB3842D444E5C966ECACEF84DD8C989@BN8PR11MB3842.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hrITrmQ0w3WmOAkPncNBOvyCSZNxfACLqPzCWqtXHphH2VmPs8T2eCRa4+1l/LyggTEDzA1lxmGbmAAdVKKoq3Hirhh8bdl53Ux1Inl2p0YRexlVzD0OXDJ6Ik1aNAcDsebUkVoc1C7oscuTgyHFeXI7rsk0Y6iJI7N7zXSLGZftbJm9Nj54kZmUJYPIqKlIgswyEltscazp8QiUUmV/Gwig9ZcYq5esQS7KlofMGMdm9O8Xc/hdBurRMmRz3X/fKAI+ZuWDetxPgRHP222s7XWkOpcM3B+fHsKAdKyCLBSAT3weUs+CyEHi4CgcAtoXqD9aXfqE9G858wAVzhIGISlodtHF+0vF+Cm/ymZEyWebIZHcumpYdaoLnvVCWmsnP7wzBxDXKd/VE0oC9wUDNs1fB3rFxGm4VFGWtfAw8h3An86ognpOHhzaD5W6s/7YZvdXMFOUcvWzJvAeJHKN+DoDgZq7yF1Cj4DcNxYXaM8KJ4Zq6osDKEw7PG9woWHt1GW0jZe0+BAUgJ5icH9jn7fke5sHHIkOYoYCl3cDRhbzDPRaWbJnGonryVC+iS+V5x5fW3PHdTQO2yJaf6iqgSVL6iommIhouT/dMs70sN3KKROd3I3VcWnwrtc1cYzB7CQxOLKKALI+BLc0C5XSAoqzI0+QRJFZHFtOwissB8xNx4/REPh1VM4wqPZrPJoyBxEeubfmdSCAe1kbmnM1Qw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(76116006)(64756008)(66446008)(7696005)(55016002)(66476007)(38100700002)(122000001)(71200400001)(110136005)(316002)(508600001)(6506007)(9686003)(5660300002)(33656002)(2906002)(66946007)(86362001)(52536014)(66556008)(38070700005)(8676002)(186003)(82960400001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NS8yZStGakZTclBPemhWWVZFdFNtRkVqdmc1RDBKNEdmcXcxQlNIaytBNEpS?=
 =?utf-8?B?bGpiK2lHaGU2U3BJUXBhR1BDeHFkZWhHQTZ2SUdkYzREaG1qakhaRVF4ZzUr?=
 =?utf-8?B?dk1nSitZN2x1MGVsejZ2Vmc2RkduQ3JhbzVKMXN1WHprVm5HcG03QU1qKzJs?=
 =?utf-8?B?VTVKeWw4ZVFtNmNzclZCbWxuRUtVZFBHcURuUENZVGoxelBKZ1prZ0cvYWha?=
 =?utf-8?B?WTR0YWw0dW9TcnA3WkdpcjlNWXZ1RDFWd1pRb1IvZnZOQ2R0ZmVNdFAwaUxZ?=
 =?utf-8?B?R2FhS2lRYmVIOTdGSmdLOUgyaVNVSmdKL0Y5bDZzVUduL0dkYnc1TFJmWjV1?=
 =?utf-8?B?ektOZlhDZGw4SkJkNVdPNDJlY1ZqSDdERzYrN1VuYjk3c21JVTI3b2psM0Q3?=
 =?utf-8?B?Q1hPM2lZLytWNlNsbUQ4TjV4RmpoZzRHNDYvVk1CSDZnQ2tLYitLZHlpdTY3?=
 =?utf-8?B?U1ZPV3hkQkRhWlhOR3puMHBmMUQ0dlJsZE5rSzdiVVY4Y2lsdXlrNzkxUndC?=
 =?utf-8?B?bVlUVWplNFdaU1RuWGR6N2FmNU1NdmtUYithNURtaWNQWmFyODJLT3lkUnN2?=
 =?utf-8?B?bDM3QkNsMlo4ckk5TTdJNTZBWVpzYzVyR0kvcXJoZStRMHlSWlZkK2tnUFlr?=
 =?utf-8?B?ekhJcXhrMGxKQnBuNkZOWHd1cVY2SXpnRDRGb3RJZlU4ZldyWkVZUUpnMWVm?=
 =?utf-8?B?OTAzT1ZwZXd5S1dkc2cxWklrT09FbHBSdnRFZ0tPWXJTYTZMMkRZQVRkZUVh?=
 =?utf-8?B?QTZmbC9zK1p0OFBMWEF4TGZ4RVFGTGd1S1V5UVFrZ2dCREQrOFlJTGxCdUlj?=
 =?utf-8?B?d2h4VUloVVQvcEtLZi9jSjVwa3B1VitYRThMWkxxQXZqRDNiQ1FXQXJDdjFx?=
 =?utf-8?B?UzlqVTVxbFRVY0tSYTBCcStGbk92MFVieEJua2kzWnJUVDNOVlZqazdZOWFD?=
 =?utf-8?B?ZENDMWxBdzRJaThkbUZNaDMwd2hrNmlLMUk2Mm5jTjZ4QnBmRW1iTGoxZXJK?=
 =?utf-8?B?VitzYTN1VlhyRktaaXQrVEM3UUlEVmVKbTErSkRqenZ4TkhoQ3hkNnRCbXlz?=
 =?utf-8?B?ZjFISU5JKzVyeWlpdlJjMXZFWko3bUw5SkI2NlNmUmQ2c21GUWw3V2dPWisr?=
 =?utf-8?B?dlJNTmRpWTc1emhzY2ZJbmI1dlEyTllKdG9iOWkwWXZVVHVWOGwzbVkvSE03?=
 =?utf-8?B?Y0hzVmh6MWdYMmdWZkRnSjJwNUVNNzF3NEZLSFJMU0t6RkRIZjMwcHQxSTVr?=
 =?utf-8?B?akl5UVN2ZkdxcXpYUkJhVVcrdktRUGpVNDFBSU9iWHl1eXBsby9HTy9rcnRi?=
 =?utf-8?B?U2F5TUYwbERkZ2MxNk5XTUJFdGhlelAydkZLRjhXd1ExMHIreEpVaUdBcGFt?=
 =?utf-8?B?Vkk4L3JIWDRtOTFKZkZtNlprR21tR3JHZFVMcDM5R1pyamRTMzJYQmplSm04?=
 =?utf-8?B?MDA1SmlsaDRSelExdWU3SmJONTZFREd4UGMxYVBoUEo4ZVdYdENrNGdvRjBv?=
 =?utf-8?B?cGFGUFpTZmg0Q2NUWUtXRWhHeG02a1l5Nms1U1hxbEZBVFZhWk1yQ1Z0K3lM?=
 =?utf-8?B?d0Ywcm9LeXlYM0lCelJCaWVURXpVUTJEOGltYUhUeWdxOXAvei96YjFEL2J6?=
 =?utf-8?B?N0l3eHVNZDFZdEFuRzRSL1VsVnZhamZiUk1KSXh2dFVlS3dzZ3I4VXpjdk5R?=
 =?utf-8?B?dEZsUWFIQi80MFJLZGlQeXlPV29DaG1EajdUNms2MXZRUkNMcURXbE1qWDRZ?=
 =?utf-8?B?N1dkMmg4SjVsYitBNnkrSkVkNHNQdC81WGJIaUJnQ1JXTUFpN2VpcXBkWTVD?=
 =?utf-8?B?T3lZaldSWFRqL29pam11ViszTEpOZWJpbHBFZTRjdm9lbVo3bnZqWmU4WEts?=
 =?utf-8?B?cS90ellWYlBXWmFGVUFyT1V3YlNVbUIzMjBHTlN2N2JsTkQ0OFJTd1B4emps?=
 =?utf-8?B?NUxkdjhtTURnUGxYK2F4NTJISU9CbkRlalkvYVVRVEFpQVhlZTJHVENGaVZN?=
 =?utf-8?B?R2lJeTBrTGllL0VrV3U3Yk5nclU0dVJGcXl6Yi9aSE5ZT3FxdmJ0dnQ3c2Er?=
 =?utf-8?B?WmZ4eU1JbE42TzFnd1BKYjZvaE9VWFVsNlV2RnVnekJ2TGdEOG5SVjU0UklZ?=
 =?utf-8?B?SjkvNzViT3BQOGcxTmgyM0d4emdXY3g3dnRtb3FZUFJVWWRXQlpzRERyNHYz?=
 =?utf-8?Q?OAjWUagVX8cPH6l1/bxNAoE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27630fe5-98cd-4ad9-a472-08d9a7ffacb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 06:18:00.4227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CT/zTPUSjL7OzE3sy3qvB5hUvvkxdjufmV3uWBYhIEX3JcqNjVp5ZNWvDuw1mNnLT79fgbyReeB1KmSWRth84g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3842
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
Tm92ZW1iZXIgMTIsIDIwMjEgNTo1MCBQTQ0KPiANCj4gV2hlbiBhbiBJT01NVSBpbXBsZW1lbnRz
IHRoZSBmdWxsIDE2IGJpdHMgd29ydGggb2YgRElEIGluIGNvbnRleHQNCj4gZW50cmllcywgdGhl
cmUncyBubyBwb2ludCBnb2luZyB0aHJvdWdoIGEgbWVtb3J5IGJhc2UgdHJhbnNsYXRpb24gdGFi
bGUuDQo+IEZvciBJT01NVXMgbm90IHVzaW5nIENhY2hpbmcgTW9kZSB3ZSBjYW4gc2ltcGx5IHVz
ZSB0aGUgZG9tYWluIElEcw0KPiB2ZXJiYXRpbSwgd2hpbGUgZm9yIENhY2hpbmcgTW9kZSB3ZSBu
ZWVkIHRvIGF2b2lkIERJRCAwLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPiAtLS0NCj4gRm9yIHRoZSBjYXNlIHdoZXJlIHRoZSBtZW1vcnkg
dGFibGVzIGFyZSBuZWVkZWQsIHh2emFsbG9jX2FycmF5KCkgd291bGQNCj4gb2YgY291cnNlIGJl
IGFuIG9wdGlvbiB0byB1c2UgaGVyZSBhcyB3ZWxsLCBkZXNwaXRlIHRoaXMgYmVpbmcgYm9vdCB0
aW1lDQo+IGFsbG9jYXRpb25zLiBZZXQgdGhlIGludHJvZHVjdGlvbiBvZiB4dm1hbGxvYygpIGV0
IGFsIGNvbnRpbnVlcyB0byBiZQ0KPiBzdHVjayAuLi4NCj4gDQo+IC0tLSBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3Z0ZC9pb21tdS5jDQo+IEBAIC02MiwxMSArNjIsMzIgQEAgc3RhdGljIHN0cnVjdCB0YXNrbGV0
IHZ0ZF9mYXVsdF90YXNrbGV0Ow0KPiAgc3RhdGljIGludCBzZXR1cF9od2RvbV9kZXZpY2UodTgg
ZGV2Zm4sIHN0cnVjdCBwY2lfZGV2ICopOw0KPiAgc3RhdGljIHZvaWQgc2V0dXBfaHdkb21fcm1y
cihzdHJ1Y3QgZG9tYWluICpkKTsNCj4gDQo+ICtzdGF0aWMgYm9vbCBkb21pZF9tYXBwaW5nKGNv
bnN0IHN0cnVjdCB2dGRfaW9tbXUgKmlvbW11KQ0KPiArew0KPiArICAgIHJldHVybiAoY29uc3Qg
dm9pZCAqKWlvbW11LT5kb21pZF9iaXRtYXAgIT0gKGNvbnN0IHZvaWQgKilpb21tdS0NCj4gPmRv
bWlkX21hcDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGRvbWlkX3QgY29udmVydF9kb21pZChjb25z
dCBzdHJ1Y3QgdnRkX2lvbW11ICppb21tdSwgZG9taWRfdA0KPiBkb21pZCkNCj4gK3sNCj4gKyAg
ICAvKg0KPiArICAgICAqIFdoaWxlIHdlIG5lZWQgdG8gYXZvaWQgRElEIDAgZm9yIGNhY2hpbmct
bW9kZSBJT01NVXMsIG1haW50YWluDQo+ICsgICAgICogdGhlIHByb3BlcnR5IG9mIHRoZSB0cmFu
c2Zvcm1hdGlvbiBiZWluZyB0aGUgc2FtZSBpbiBlaXRoZXINCj4gKyAgICAgKiBkaXJlY3Rpb24u
IEJ5IGNsaXBwaW5nIHRvIDE2IGJpdHMgd2UgZW5zdXJlIHRoYXQgdGhlIHJlc3VsdGluZw0KPiAr
ICAgICAqIERJRCB3aWxsIGZpdCBpbiB0aGUgcmVzcGVjdGl2ZSBjb250ZXh0IGVudHJ5IGZpZWxk
Lg0KPiArICAgICAqLw0KPiArICAgIEJVSUxEX0JVR19PTihzaXplb2YoZG9taWRfdCkgPiBzaXpl
b2YodWludDE2X3QpKTsNCj4gKw0KPiArICAgIHJldHVybiAhY2FwX2NhY2hpbmdfbW9kZShpb21t
dS0+Y2FwKSA/IGRvbWlkIDogfmRvbWlkOw0KDQpJZiBET01JRF9NQVNLIGdyb3dzIHRvIDB4RkZG
RiAodGhvdWdoIHVubGlrZWx5KSwgdGhlbiBpdCB0cmFuc2xhdGVzIA0KdG8gJzAnIHdoZW4gY2Fj
aGluZyBtb2RlIGlzIHRydWUuIFdlIG5lZWQgZXh0ZW5kIEJVSUxEX0JVR19PTigpIHRvIA0KY2hl
Y2sgRE9NSURfTUFTSyBpbiB0aGlzIGNhc2UsIHNpbmNlIGNhY2hpbmcgbW9kZSBpbXBsaWVzDQp0
b3RhbF9zaXplIG1pbnVzIG9uZSBmb3IgYXZhaWxhYmxlIGRvbWFpbiBJRHMgDQoNClRoYW5rcw0K
S2V2aW4NCg==

