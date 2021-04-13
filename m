Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C85D435E227
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 17:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109925.209820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWKWU-0004gk-C4; Tue, 13 Apr 2021 15:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109925.209820; Tue, 13 Apr 2021 15:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWKWU-0004gL-8c; Tue, 13 Apr 2021 15:00:14 +0000
Received: by outflank-mailman (input) for mailman id 109925;
 Tue, 13 Apr 2021 15:00:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ovpe=JK=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1lWKWS-0004gG-Ue
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 15:00:12 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8287e31-4cb0-4bb2-868c-c66c1fbdd3dd;
 Tue, 13 Apr 2021 15:00:12 +0000 (UTC)
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
X-Inumbo-ID: d8287e31-4cb0-4bb2-868c-c66c1fbdd3dd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618326012;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=ZQW+xYPh6pAcVZBk/yiOOXBIDl4Fenh/P1Mq6G9poHY=;
  b=HPQQo809LvxadtjeHHkOMoG52BfHyeDJOl6lu+ZjGJCpzs+3yS4oA8Fj
   +gBAAOqfp2ttuA7rhjCFpXKu3kkYI/08s9y7F60taGafUVpkPq1V2yKXH
   bfjgOnzypOZEeiasyccEybC1nY3TTVnD0QEhBJHGnIUmZfkzwV0uZ9KP2
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Lcq8ByzOzGWas/782Fc6QBIujTlVoNAq1CcJXinhudrbLiB02EadTUJ2LB7e8nfR2yTFcpL5FG
 uiN3LPEMa9daBXmaVVWBfhE/gsQfw/3O7Quj9HPw89Ouil/5RDgjqoptY6QhWiMZZhleEMvyOL
 +BinOHJwrmabZswoIM09bKPwqq//A0SCd39ofxsWBNfZX2ssR6FUxs4e+4NskgIxAZDaEr2cgi
 ztZDXqJNuIRF6eakQkRrvduVUbw72P/HpfNYsNgWKUnZIl5rcIoFjVXKObCT808B46+60u8dNW
 /O4=
X-SBRS: 5.2
X-MesageID: 41620965
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:HkBpVK0MOHdUm18MkU1yZAqjBWhyeYIsi2QD101hICF9WtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7LE/035hz/IUXIPOeTBDr0VHYSb1KwKnD53nbGyP4/vNAzq
 sIScJDIfD5EFQSt6nHySaiFdJI+re62YSJocub8Ht3VwFtbMhbnmVEIyKWCFd/SgUDJbdRLv
 qhz/FKrTahZngbB/7TbhU4dtPOusHRk9beaQMGbiRN1CC1kTiq5LTmeiLovSs2bjUn+9Yf2F
 mAqSPVzOGJs/a3yhjTvlWjlah+qZ/a5fZoQOCJgsgRAD3whgivf5QJYcz+gBkF5NuBxXxvvN
 7QowoxH8kb0QKsQkiF5SHD9iOl8DEy52TswVWV6EGT3vDRdXYBJOdqwad6GyGpj3YIjZVH/4
 9gm1+9jd5xCyjNmSzsjuK4Ly1Cpw6PjlcJ1dIIg2c3a/p4VJZh6bYx0WlyC5k6ECfz+OkcYZ
 JTJfCZ3vpQfF+ABkqp2FVH8ZipVnQ3KB+MXlIPjMyTyyRXh3B01SIjtbUioks=
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208,217";a="41620965"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juqfoYocTJIVPJjaQBnk9kAiyLoCwqiN0oxZ86XNL5j57rO8aZnDcZJpheOfozPjihmG6Qj02CpErS/KcLQZFEYWOdj2wdnRQ0QtGlZ3+pPcgtejL7jhAc6JB372Ud0BobiDAywRqerxVRwVoGREhX16KCtJWIoP/jdR6JTSE9IUfqVwdFjsAURRGbYXRjDX+4Qyn9JMwYosLpQVzCNYy97pCLoKbti5KMwhxBsa7uLqm9uDJtIcqFMkm4+VfveXCxXrPaOvIYFgjXDoc3g6AGUooFKd6dr60oCuK5EUCvMSX+ztt4yBMJl3gG2IqgrqIYC9IoOb9j8+0Do5zSO/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQW+xYPh6pAcVZBk/yiOOXBIDl4Fenh/P1Mq6G9poHY=;
 b=dP5ZQTO3fUwBYjNplAfJWCZr1xSiYi9gLkoAr5v7pTUfgod2wf+6WQKdxNDmboLFhrVHCQxIKG6kih9DXz/ACbUyVVMjdPNR1IArDdd0xG/MuBUIpd5EE/dRPU+PW1IQ27Cnfr+byy1RuPF7Kg/K1b9zruGJTqzg1UpCRKGsiA/FwURIoeZy85bmjEcFzg/UvEDinPuyDG6k6H9vrFBv+Anhgl6ASdVu7YhRfBhRAe3VdIK+5CbeZuyc+sqYozBFRdNSZdgvDlJq+/8yO0W9V2WMrQwHQxzeJfh80IGz2kXe6jE/f7qxfHxrHq4XDoL751JJtl2aCVLSj/mTJkQ19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQW+xYPh6pAcVZBk/yiOOXBIDl4Fenh/P1Mq6G9poHY=;
 b=O0EPeibZ7R2NR1JmiX9AflnxhBKCOgzxnOeMxJErQDcnYs9PMdMSM7Q7K2HZFfnNjlCcaiGKvcSR4Bp9TiEUTzt5b0BL5i6gpyOgjAw8+t568Sy3lqOzWtzv36/RvEn9t2KN1Xgl7NN+5IeS+AsFm82uLqQNovUSHGbIKV9Yz3I=
From: Christian Lindig <christian.lindig@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, David Scott
	<dave@recoil.org>
Subject: Re: [PATCH v2 3/6] tools/libs/ctrl: use common p2m mapping code in
 xc_domain_resume_any()
Thread-Topic: [PATCH v2 3/6] tools/libs/ctrl: use common p2m mapping code in
 xc_domain_resume_any()
Thread-Index: AQHXL6/OkwM8g8S8xkOjh61WGG0vPaqyjAMA
Date: Tue, 13 Apr 2021 15:00:09 +0000
Message-ID: <A21C5456-8017-4A9A-9460-91D250E100FF@citrix.com>
References: <20210412152236.1975-1-jgross@suse.com>
 <20210412152236.1975-4-jgross@suse.com>
In-Reply-To: <20210412152236.1975-4-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4984bf97-078c-4173-d740-08d8fe8cd4f1
x-ms-traffictypediagnostic: MWHPR03MB2896:
x-microsoft-antispam-prvs: <MWHPR03MB2896D854B38FF8A4C84C272AF64F9@MWHPR03MB2896.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Un/0vl5Qw9ZM8Z0ivqyOVk9wEgQWzUehBzKSr8TTZbt9BpVl+RQ9h35gBw6NPm/U/0xuN2QjnCOP7saeiQDl0SLFX/aEZeSYynCOaxQ8NTzXxVw3/ml2nnCnnp+8fDM/d6nLL1zKYDlwmorGZuDD+dgiAeq4WBgiZbDDQLVsyN3bDx5MV2gCObhUyizwoFO4CCK4+qf1cXrhsu4EctGtOioHU6QzREcq5HgLvNSAn4lMuqJwXCFO+MjW8UPgDpkGTstgyeFGDK3BYP1Hc6FR8d7P/hFe/tx7WGIJdd50AYhJ8uvmZC/udFl/iU6BfD1Cs2JTO9yzE0FGWismdypysFQ1qwMcSY5AsFkYq5lhzxHzXeh7ae17Xp1Q0yGRqzQag+fEjhkL+J5OjmpeNVP6ZJykAfVgyhkkxBBYoR5RrHoPVjDAEeyeqbqjjjZC5K5n6zNrZlBc155OoGaND09zK/oHV9H8SQyhKzq3piCdW1XRkTPOXqXHaR7Adakn+qAbd4z82P0wkf5MKgWQYJj+L6U4nWfPWlwVcVMcQ3Lq078/WJN1JW75jDajT0tlxfq7z2hovJy7PvxPkpOTMURN3vEe2JIgCPh1laZ2lxWHa9B1F+cOlBfb2n0hfVrqIAV++b7dtvacT2v4nOLvSZt016885tJUfcwTgbr4BGHH08M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR03MB2445.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(478600001)(44832011)(2616005)(86362001)(66556008)(36756003)(38100700002)(6486002)(53546011)(54906003)(64756008)(186003)(66946007)(4744005)(2906002)(4326008)(66476007)(5660300002)(33656002)(91956017)(6916009)(76116006)(6512007)(26005)(316002)(71200400001)(66446008)(8676002)(6506007)(8936002)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Q0RnM2dtaDh0RmliZHBiN3lmK3BUdTNVY2xGVnlHa1NyTkdlRXJ1dEIyWmg5?=
 =?utf-8?B?SUYxdnJHMFhUb3FsZzVQNitUbWI4dlgzbFBJdTl4UjBpL2VTZWE3eWx5YU56?=
 =?utf-8?B?UklyL09iU0hpeTc0Uy9UbE9BQjEwcEIxNkRxK0lBUjdCRHBOMStNeEhhZmJR?=
 =?utf-8?B?ZG5uUUxKOE1yc25CdVN4aW5ob2NXeW1Cb0xObGxGbnRGaTNEaUxyNUxMQWNk?=
 =?utf-8?B?eFA3emdkQ3Q2YjY0eUovNjNlQlZSdmoxTSttMElZblNMZ2R4MVNCTWJ3RVIw?=
 =?utf-8?B?ODRRem54ZXlUSlF4UVA2OVMzbnFGU0ZWTWtmL2dqNThPYVNSY0NIZ0g1Q1pw?=
 =?utf-8?B?YW1aTHZZS21JRXdBb3g1RGhLa3IzVkVpRXhxaTk5ZTYwbkVla3l5R3FCQ0V6?=
 =?utf-8?B?dXZRRGl6RzVMUGhzTEtMSGM5L3NoY2VBNG5PL1ZzOHFyQSthVUt4eGp6MTZv?=
 =?utf-8?B?allvZllKT2FyaHZ4aXRiczB4bUlkL05CU0psWFcvWDkvV3FQaTUzTURiUXhO?=
 =?utf-8?B?TEMzVW1WdFFhTWUxalZONENPL1JZWVU0TVhBbkhtY29kZDNLVm8zVGgzM3o2?=
 =?utf-8?B?Mkc3OFhCMmVaUDJBL2ZJWlFtek9DY1hnSTJ1QVloZGc1d2Vsc3hRV2lEOFQw?=
 =?utf-8?B?MXY2L0JIcmdyWUZ2LzE4S2Z1ZEVEUFZmZE00eEg1dExzMXpHMXBiVUlqSG5S?=
 =?utf-8?B?UE9kTndmR2JYUDltRVg5REY2eTg4WnZOV3RFbVNrZVYxS0krNys5aHhEWmlS?=
 =?utf-8?B?T0NLbWM0M2hkM2IxSDlNZkJBS3NMWkhYVEpMY1E5M0tsM25STVF2STVCTjQ4?=
 =?utf-8?B?ZXRmNXdEVkZRVW5haWVqc3JCaUd2TDRzaHpyUWNVb0dJbzlXY0JtY3gvWnZm?=
 =?utf-8?B?SEVoeVRudGxTUDRBdFQ1QUl0dmFuSnR1bUE3N1g1OFRreW52WHhHTEhlOWVK?=
 =?utf-8?B?WFRlODNmc3hralN6TXp4c29McnJ6TWdpeTJZRUgxMjRkaEFJRWdkWHA1VVQw?=
 =?utf-8?B?ZktNaWZnWjhBNk84bTJJalB6MXNxNG93Nm5iN3hMdjBvTzRuZUcvV0libnZN?=
 =?utf-8?B?d2pmblJDQ0wvMkZVQkYvMEcrSCs4eWNXWnRweWpKdlloTklGWUhINTNJRXZp?=
 =?utf-8?B?UmdvQlAzYmFxYjFFSElxSE1RUmo2Q0hOREttc01KbXRER0NzSExGMUFSdXZt?=
 =?utf-8?B?Ym53Q1JlY1c0Z2RzR1RqSThLd2hIc2Jyc00vVUs4Z2Nzdm5aWjFMOU1jSm8x?=
 =?utf-8?B?cE93VXlxY0h1cEtkalZFbTRsbXdPTkVTdTlZdk0zdGtCM0Y2TmZUY3JuT3N6?=
 =?utf-8?B?YU1PWm1tVmVLbGt4MEtVOFplVFliMElvNTVFdTVRZUF5V2JDMndYeHUvaFA1?=
 =?utf-8?B?TE9sM01CcXBhaVhBdFJ2NW9PSUJBMlJ1L05HazBDc09OOXhtV0daeEpSSUJq?=
 =?utf-8?B?Slg0Y0c0RytuODRSblMrV2FodHkrOHRXNjcvRkVPKzNPUCtYZ3pVRVMwN3g2?=
 =?utf-8?B?QmYvaVBhMGtGUFFwTCs3RWlrcTV1VTF2Z0I1MVB1bnZOcWxsbFlhbDkxRWRr?=
 =?utf-8?B?aGN6MFBVYmN0cGE0Zk4wUkZVdUl4ZDB2THpkQ1BtNGl5aVlDb3VuWUNqbTF0?=
 =?utf-8?B?eVBwQmlScVp4ZWE0bk9QeS9MYmJ5RWw3TVQ3Sk9KSjNuU3ZoUno0SUxRMFdw?=
 =?utf-8?B?eG1FMFpGT0g3Z201MVBxOXN2dmtzTnNOVitoc29NajJsUDgzeGsvUml2V3Uw?=
 =?utf-8?Q?qf/+kvEUFx3OttXOLA0yrDgB3hZ92WuXc/MvkEF?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_A21C545680174A9A946091D250E100FFcitrixcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR03MB2445.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4984bf97-078c-4173-d740-08d8fe8cd4f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2021 15:00:09.3451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ome0eRhOo+Uv+5xakQWJJRgbWqOsWNkINIumjThthka3wfNjLhK/nQC7bPlBOBbyUlHj19gbrobUFIGFU0EPTDsVuSUH52fjSX+Y/JFrxLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2896
X-OriginatorOrg: citrix.com

--_000_A21C545680174A9A946091D250E100FFcitrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDEyIEFwciAyMDIxLCBhdCAxNjoyMiwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPG1haWx0bzpqZ3Jvc3NAc3VzZS5jb20+PiB3cm90ZToNCg0KSW5zdGVhZCBvZiBvcGVuIGNv
ZGluZyB0aGUgbWFwcGluZyBvZiB0aGUgcDJtIGxpc3QgdXNlIHRoZSBhbHJlYWR5DQpleGlzdGlu
ZyB4Y19jb3JlX2FyY2hfbWFwX3AybSgpIGNhbGwsIGVzcGVjaWFsbHkgYXMgdGhlIGN1cnJlbnQg
Y29kZQ0KZG9lcyBub3Qgc3VwcG9ydCBndWVzdHMgd2l0aCB0aGUgbGluZWFyIHAybSBtYXAuIEl0
IHNob3VsZCBiZSBub3RlZA0KdGhhdCB0aGlzIGNvZGUgaXMgbmVlZGVkIGZvciBjb2xvL3JlbXVz
IG9ubHkuDQpbLi5dDQpkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0
dWJzLmMgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYw0KaW5kZXggZDA1ZDdi
YjMwZS4uNmU0YmM1NjdmNSAxMDA2NDQNCi0tLSBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3Ry
bF9zdHVicy5jDQorKysgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYw0KQEAg
LTMyLDYgKzMyLDcgQEANCg0KI2RlZmluZSBYQ19XQU5UX0NPTVBBVF9NQVBfRk9SRUlHTl9BUEkN
CiNpbmNsdWRlIDx4ZW5jdHJsLmg+DQorI2luY2x1ZGUgPHhlbmd1ZXN0Lmg+DQojaW5jbHVkZSA8
eGVuLXRvb2xzL2xpYnMuaD4NCg0KI2luY2x1ZGUgIm1tYXBfc3R1YnMuaCINCuKAlA0KMi4yNi4y
DQoNCkRvIHdlIG5lZWQgdGhpcyB3aGVuIHRoZXJlIGFyZSBubyBvdGhlciBjaGFuZ2VzIGluIHRo
ZSBmaWxlPw0KDQpBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0Bj
aXRyaXguY29tPG1haWx0bzpjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+Pg0KDQoNCg==

--_000_A21C545680174A9A946091D250E100FFcitrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <D5F23B481A60244995DF568646B6AA5A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IDEyIEFwciAyMDIxLCBhdCAxNjoyMiwgSnVlcmdlbiBHcm9zcyAmbHQ7PGEgaHJlZj0ibWFpbHRv
Ompncm9zc0BzdXNlLmNvbSIgY2xhc3M9IiI+amdyb3NzQHN1c2UuY29tPC9hPiZndDsgd3JvdGU6
PC9kaXY+DQo8YnIgY2xhc3M9IkFwcGxlLWludGVyY2hhbmdlLW5ld2xpbmUiPg0KPGRpdiBjbGFz
cz0iIj4NCjxkaXYgY2xhc3M9IiI+SW5zdGVhZCBvZiBvcGVuIGNvZGluZyB0aGUgbWFwcGluZyBv
ZiB0aGUgcDJtIGxpc3QgdXNlIHRoZSBhbHJlYWR5PGJyIGNsYXNzPSIiPg0KZXhpc3RpbmcgeGNf
Y29yZV9hcmNoX21hcF9wMm0oKSBjYWxsLCBlc3BlY2lhbGx5IGFzIHRoZSBjdXJyZW50IGNvZGU8
YnIgY2xhc3M9IiI+DQpkb2VzIG5vdCBzdXBwb3J0IGd1ZXN0cyB3aXRoIHRoZSBsaW5lYXIgcDJt
IG1hcC4gSXQgc2hvdWxkIGJlIG5vdGVkPGJyIGNsYXNzPSIiPg0KdGhhdCB0aGlzIGNvZGUgaXMg
bmVlZGVkIGZvciBjb2xvL3JlbXVzIG9ubHkuPGJyIGNsYXNzPSIiPg0KWy4uXTxiciBjbGFzcz0i
Ij4NCmRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyBiL3Rv
b2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jPGJyIGNsYXNzPSIiPg0KaW5kZXggZDA1
ZDdiYjMwZS4uNmU0YmM1NjdmNSAxMDA2NDQ8YnIgY2xhc3M9IiI+DQotLS0gYS90b29scy9vY2Ft
bC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYzxiciBjbGFzcz0iIj4NCisrKyBiL3Rvb2xzL29jYW1s
L2xpYnMveGMveGVuY3RybF9zdHVicy5jPGJyIGNsYXNzPSIiPg0KQEAgLTMyLDYgKzMyLDcgQEA8
YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+DQojZGVmaW5lIFhDX1dBTlRfQ09NUEFUX01BUF9G
T1JFSUdOX0FQSTxiciBjbGFzcz0iIj4NCiNpbmNsdWRlICZsdDt4ZW5jdHJsLmgmZ3Q7PGJyIGNs
YXNzPSIiPg0KKyNpbmNsdWRlICZsdDt4ZW5ndWVzdC5oJmd0OzxiciBjbGFzcz0iIj4NCiNpbmNs
dWRlICZsdDt4ZW4tdG9vbHMvbGlicy5oJmd0OzxiciBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4N
CiNpbmNsdWRlICZxdW90O21tYXBfc3R1YnMuaCZxdW90OzxiciBjbGFzcz0iIj4NCuKAlDxiciBj
bGFzcz0iIj4NCjIuMjYuMjwvZGl2Pg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8ZGl2PjxiciBj
bGFzcz0iIj4NCjwvZGl2Pg0KPGRpdj5EbyB3ZSBuZWVkIHRoaXMgd2hlbiB0aGVyZSBhcmUgbm8g
b3RoZXIgY2hhbmdlcyBpbiB0aGUgZmlsZT88L2Rpdj4NCjxkaXY+PGJyIGNsYXNzPSIiPg0KPC9k
aXY+DQpBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmNocmlz
dGlhbi5saW5kaWdAY2l0cml4LmNvbSIgY2xhc3M9IiI+Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXgu
Y29tPC9hPiZndDs8YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxiciBjbGFz
cz0iIj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_A21C545680174A9A946091D250E100FFcitrixcom_--

