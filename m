Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BB06E5872
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 07:17:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522553.812010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1podhb-0001MG-E1; Tue, 18 Apr 2023 05:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522553.812010; Tue, 18 Apr 2023 05:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1podhb-0001JU-AY; Tue, 18 Apr 2023 05:16:27 +0000
Received: by outflank-mailman (input) for mailman id 522553;
 Tue, 18 Apr 2023 05:16:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LW8D=AJ=fujitsu.com=dietmar.hahn@srs-se1.protection.inumbo.net>)
 id 1podhZ-0001JO-N5
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 05:16:25 +0000
Received: from esa8.fujitsucc.c3s2.iphmx.com (esa8.fujitsucc.c3s2.iphmx.com
 [68.232.159.88]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 285fc3f6-dda8-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 07:16:22 +0200 (CEST)
Received: from mail-be0deu01lp2170.outbound.protection.outlook.com (HELO
 DEU01-BE0-obe.outbound.protection.outlook.com) ([104.47.7.170])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 14:16:21 +0900
Received: from FR0P281MB2123.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:29::6) by
 FRYP281MB2558.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:76::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Tue, 18 Apr 2023 05:16:19 +0000
Received: from FR0P281MB2123.DEUP281.PROD.OUTLOOK.COM
 ([fe80::b0e4:c7ef:40f4:36f]) by FR0P281MB2123.DEUP281.PROD.OUTLOOK.COM
 ([fe80::b0e4:c7ef:40f4:36f%6]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 05:16:19 +0000
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
X-Inumbo-ID: 285fc3f6-dda8-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1681794982; x=1713330982;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6uAz/N+NDIV2IK/52/YqNAowWVLd0xRgDPHWNnQ0qQA=;
  b=qfti54PEw6hnj0KRXuwCO885AszUp7e5rZCslsgC7p/4TZbBZ0vJpTTt
   r6HV9HlVikw1eOSFM2ToNvMKdB34yU1d15zpA7UJuVbTw/EYk1jQ/0RNR
   J1FnwvnnC04MJ7m3hNwPHiMxYy8FnlvQKCDUejwr6Jt1axpcrLu8Uf27Z
   TzoiXZNKvDLiwsie8INf0rlztlTkmNcp9PN6mDtmudMiANVfp39a3jkNS
   OfXG/VrxMkC4/u49xyZ4UjOsaKlVWT014phfnaS3NX9FfnHzzuFMDcleQ
   QqE8gm/FOQ3OwBa1U2HlxVanJfph5RkD5HTPl+blKuyVqu0DHSUnagb+9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="82339988"
X-IronPort-AV: E=Sophos;i="5.99,206,1677510000"; 
   d="scan'208";a="82339988"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hk5pZisYA/oIArlJ0SRn4OQujHvsMyBIbWMGu45mnDSqWkc6pYeDZpCa3LBwUOfHYxnwdfRS2/fS0kFUvIlZC7rzABhmBoUlW5Blfk8MvArrz6AC/1i630gRLw6dkYei8LidmLSz0yubyvNhSziXB6yFPoJBpEqDGZCsgKJunJkOp0JqfSpvl1cj2TeJFEmnYzTpyVSshALet0fT/guOxgKyPDVlAWSFUVaG6STL03julFFuvBRqsCeTrxG1IV4V4gGzlTFXHedbYx5AFT6KDkSW7GpXnholog9ajrOzjcEVIsifQWQohjnI+YIoWMAvtUcS7BziGcpDlACWE+Rg/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4i5l61YbcnMjezwyjpCL15jLPNLE3FWAkzaiNX3FZs=;
 b=BZv0Idvmd4jKl770nlt5otLTIQOEqJObinAmhqRki3Be40soKf1y97rkt0RfVOkF8QD6c7zyrggVoGlPvS+CngxX+COs3DRsGPvNDPyC9r2FHjdJRK5TTOYEdqB0yGsgQJwRjE5E+vDqJ1C5z41I9FZ3EvBwrTHiMMCn1B9a853Ro2yNWKIQ0tdSDWd5Lo7L+9L3ry8pnjSMPleKGera0zIIjmsSuwOYeYIHDNZSm53QYGdrXPkTVUJ54G4NGOM0BW3omIBkeESQi076uHkHUjJE5wCE6I+zMgHv2kG76eMM6u2YAeIJRJp90sfk3ohhnBkGcJq+i6+QIi2R6km3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
From: "Dietmar Hahn (Fujitsu)" <dietmar.hahn@fujitsu.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: RE: [PATCH v3 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
Thread-Topic: [PATCH v3 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
Thread-Index: AQHZZ8aayKNwRwnxU0qZJCKcF1kheq8wmN2g
Date: Tue, 18 Apr 2023 05:16:19 +0000
Message-ID:
 <FR0P281MB2123CD306618A20094AD0749949D9@FR0P281MB2123.DEUP281.PROD.OUTLOOK.COM>
References: <20230405135629.21829-1-jgross@suse.com>
 <20230405135629.21829-2-jgross@suse.com>
In-Reply-To: <20230405135629.21829-2-jgross@suse.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=86363395-ed68-4ea2-abef-7d5070f3e675;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED???;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2023-04-18T05:11:18Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR0P281MB2123:EE_|FRYP281MB2558:EE_
x-ms-office365-filtering-correlation-id: 4e6b225d-2557-4049-8626-08db3fcc0b09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VwZ0MxqH3guVA3v+FuVEdTUx2IoJK/d/JwISJNvwL08RenOJeLWIQQ0TY8y8JOtWOYvegQjCmiRpWc05s3smc0jWn7qB+H4mJaST42KQK7Sd0l2YLeA14hjwyCIqhp1p8JtNhmO9hGm8oGdw0gC8u3+EUamgwyCA/chRVnNUmp+kue2rdkgqDwN/QIAF0ZNDqNlRlSPYgCFIA09IRzj5EbdtXI/aRkgpNdOpZ+zOsqF7xI5ALf+YtzA96MlJCm8WpWbtmQSUkGIkQiVs7zUMjgiPmOhQf6h5C1HRV3Ru6oolfvACKN1wgo9UQFwnSWoa+rKQE2hXWvINR8++JMgB+Y5IJu5qo80+xCpzF0qjjh7azAnYZog01RhcDwxpGb0FcKbtHz+GTLv3IdIgpHrmfNnuRyf0t/2WwwO+M4/IeVMBUVCB2d8socMiWBNFHhB8Qe+um+O9jF6XXBAuJDJ2DDrLFJNb+WzCevcBBBJkNgDGwEVXnvZVvo2EFEsjJn3w4uSnvgD5WaBCDM7L7KkVZTjL9Oa/n7sIa+vS44jSz9IoQGoxK02zacgI738nWtIm5XKWVj26caxW2vMYqwRIuszYfUp19HprapVwhn/Ecvsfcs6gMF/GclX4HNjCpSGy
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR0P281MB2123.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(52536014)(5660300002)(86362001)(83380400001)(186003)(9686003)(53546011)(122000001)(82960400001)(26005)(6506007)(38100700002)(8676002)(38070700005)(8936002)(33656002)(478600001)(54906003)(110136005)(7696005)(71200400001)(316002)(55016003)(76116006)(41300700001)(66446008)(66476007)(66556008)(4326008)(64756008)(66946007)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?NYils7nKpRilp8K+zhbfTQ7+E1XlVY73IAPaClt1WfjwR+P43UzdEYHv?=
 =?Windows-1252?Q?MC7yqvXSTWHt3/0aeWJH3j/Y5NZB42bnG/XORbBF8F+tQq3Hk/fOVPf/?=
 =?Windows-1252?Q?JlfSJUvfUMWZdO1hgmVslEW6T5afQpJlbztIvcskBwtV1rXgMIiBSdhp?=
 =?Windows-1252?Q?Fb0BdnGnfgTrPW8rPEKuvCAgTDhYZLXRFbxBQKZp0roTlrPCurixjLo+?=
 =?Windows-1252?Q?HFBULIEbxVIye0XZfs9SrnXWV++brX424mGBSYZkoRJyiJzGHiU6V+tW?=
 =?Windows-1252?Q?JeYVckaY5+ns7EieA4h6ljSHWJW7wFipaApSScwt1FPvpb/DPE8z6/8p?=
 =?Windows-1252?Q?V4zI38H7dL+eWqdo2QZwy295pnjNwfApzE+bv70AywarDvTj4ryO2cmG?=
 =?Windows-1252?Q?zTao5i8JI72aA/fR/0E8j0x/KeiaTZ5cITivywsUCr1Fj16C6YKbBS8h?=
 =?Windows-1252?Q?sXTNy8wwK3VIJl0IK51+Y/RRZ1G2wkvvPkqyQM8zhH5ivm0d5tOfswlC?=
 =?Windows-1252?Q?mTQB7YAQgloxtvEVIFiRR42lUvSdLkQBmRLgn+0jG+FVflYXUCb1uhat?=
 =?Windows-1252?Q?4BfKmo4lalJM8MycqPTXrE5RKQmEg5yPPUqRvKApx8hqkxwglqx0mhW3?=
 =?Windows-1252?Q?rNr+AV9zDQCOLa4i1TKT5rX3GudN65JUlg38Z1fo1jQdz2WjGyZDPUOx?=
 =?Windows-1252?Q?La49n7WConeeOEEYrQ6eYFhtpZ1rKvUWzwaJN6Rj8muh3Dg6pRySjFKq?=
 =?Windows-1252?Q?4J5J3s71jkSKwWVmuxPQORCPIgznjbdbYjdSc4W6Wp7kBqvaNorEhvkd?=
 =?Windows-1252?Q?OIjLE+JArzjE5ek7IhBYJvcRTkjBo2VKeVSX+NA/bpLI9tU1BHs8rSZN?=
 =?Windows-1252?Q?IJT8LViXwTf6NmE8j6ECdjLuY50kMz/VY6/ElpIYjdTRo+vIf9A17b+v?=
 =?Windows-1252?Q?npRt2TYlr9Qi0WD4gCP/W0ZvYb7A91KZtEaeEgWNqeC2jscxLLW+ScJZ?=
 =?Windows-1252?Q?sJ7NupdzLuaaEzEeR3kqT18EQSkItm9kDC+0x9C1TBFFE0UBEmexIknH?=
 =?Windows-1252?Q?YV+UI7sMvKpoY26Dtq5FIO/bI5QKIN1PFKuekKlpbK7BSy0fc+YBfHhd?=
 =?Windows-1252?Q?GuAcNkcdMxOkZZfmzuAl6Nh+PdLCV+DM9EoLUPIY5OQz4bIKLS+NGPb1?=
 =?Windows-1252?Q?Mxn+FBVCs+QK9HG7lhVQZncQhKzeQ1ckgqG4gpUfxhwXnj2piGWX3p5Y?=
 =?Windows-1252?Q?K3DChEx5joCXdH1hQ19vxz/Vzpws8rxlUh0flU5vcw1v7erz/9DcLnQc?=
 =?Windows-1252?Q?/egKLgX2y7NnDwXb8FuF7TR6FLWb5wLA3l7b05ZakhZnPg9Oui6m0xeY?=
 =?Windows-1252?Q?iubCTPMtyFIfhEyhLEc38jBsEtQhIFftDCkhuRpoJGKaWGS0Ygpnsn90?=
 =?Windows-1252?Q?li6aU7dFzTwH2CiBgFISybOxC9dsT3tsRN4qeH5nS1Tb3eWKlObMIrc6?=
 =?Windows-1252?Q?3Rp3Mrdt1iACOHne66FKiqfX5zDOY+bXfoZdxfd61f3Z/VFwUtKqhhA9?=
 =?Windows-1252?Q?3EH6V38vfI01xnHS8pym2Gmt/MluLr2batjHNaobOLTpkMPsfod/FqRv?=
 =?Windows-1252?Q?8K4GRlPnYRBZUDxo/wyzRz+ifRxEeW8g4EQ4xdPXovncm7M/K56y0U0G?=
 =?Windows-1252?Q?TFtt7/XUGbIJz5Yicptc1aKvgBDT8sW8?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ei9Iytjc7p91/5++yj5Pz4Cy6unluBZhkhQJwMuPXARsMMDDDBdHB92c+oqCQQK51Xw888QjbwUZFR1Hs9jJN2pWYDRF6aRMcs6mXvrKgzaWxYQKls8L4XSFHZwPmzfdinBlQ+Q6qknn8ZtqBBB/5V+ZQ9mgNayA1NJ5YXZze4wUyuM18AwZT49BrJBBvKMP/jEKyXixl+IgyuPfPwVxfwhfX4MaG1RgNZEcIl+laVC50Ugc73klg4VSnkZQ4Xc8YdDKPAMa/vWVJ7i4QzuxgCP40P0/9kRBJRr+2jmz4zk4zaWVartXCPVO814BDzleornnLjeDurkkd8aGSCaaQI0kRGIrdCHCcAygD6CBKEnej0oyKDUYxjj9C21dhv5YnWX+wvqDlzknKHmMRzK0hLXCJWWqIBLtq8RvY0X79XXg+oYhHo222xkgWEmWuAHIV/EDtbsOCgGY3zzo/8DYexShxAk4r+WGXAjP6bVmTaCynUqI8K1mHrBVJEoyhlVPTOUPrlNeSrQCnigIJXCmpBXmZJAAr7u9MjcFOPLWe7tZlkbMjVps37DVPItcLPguV0FGNZf8WfyRlwj3k8dVoF6ZmMDeTK0pE7kucemFVKqziKuaC5ZAa1kQaVlI5/tyQrX7y8TZTImE0e5eYGQfsbhHCaqdoZ8zhi/BY23N9Kh/WLJewior+BQ11F7IHFNVmoc/8jG0poNEmdMqDogeKtYIa9dIFhlYSyt8rx7LKGBhGEPG/Fckoa4RMwpYEPgdhFDachrGEEvN/cguuhbZ8QXUWt/sBWJXJ7WFxJim0q1DhdM4uX36gUwo+ZQZaqPoyi072jbqBWd1szUjNOQKx+Fq2nsYRFC4Kl0bl7pu5je6JeEavBqTzoHqR+qIR9iIJSS+4jKnAUQK5t/kSdDh3Q==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR0P281MB2123.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6b225d-2557-4049-8626-08db3fcc0b09
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 05:16:19.3862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XpG/qKmsP3+WcW5ljE1jlyYT65huJ3HTaRL/yvT1uZ12t1KqRhOr4mPvbEJV5fGdKlFgyPoeFhaaqv7zqr+K0dfLCo499CatK/a+C2AD8xs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB2558

Hi Juergen,

> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jue=
rgen Gross
> Sent: Wednesday, April 5, 2023 3:56 PM
> To: xen-devel@lists.xenproject.org
> Cc: Juergen Gross <jgross@suse.com>; Andrew Cooper <andrew.cooper3@citrix=
.com>; George Dunlap <george.dunlap@citrix.com>; Jan
> Beulich <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Stefano Stabe=
llini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> Subject: [PATCH v3 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
>=20
> In order to support hypervisor analysis of crash dumps, xen-syms needs
> to contain debug_info. It should be allowed to configure the hypervisor
> to be built with CONFIG_DEBUG_INFO in non-debug builds without having
> to enable EXPERT.
>=20
> Using a rather oldish gcc (7.5) it was verified that code generation
> doesn't really differ between CONFIG_DEBUG_INFO on or off without
> CONFIG_DEBUG being set (only observed differences were slightly
> different symbol addresses, verified via "objdump -d", resulting from
> the different config.gz in the binary). The old gcc version selection
> was based on the assumption, that newer gcc won't regress in this
> regard.
>=20
> So move CONFIG_DEBUG_INFO out of the section guarded by EXPERT.
>=20
> It should be mentioned that there have been reports that the linking
> of the xen.efi might take considerably longer with CONFIG_DEBUG_INFO
> selected when using newer binutils.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - expanded commit message (Jan Beulich)
> V3:
> - move DEBUG_INFO block to the end of the file (Jan Beulich)
> ---
>  xen/Kconfig.debug | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index fad3050d4f..279dbe8274 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -28,13 +28,6 @@ config GDBSX
>  	  If you want to enable support for debugging guests from dom0 via
>  	  gdbsx then say Y.
>=20
> -config DEBUG_INFO
> -	bool "Compile Xen with debug info"
> -	default y
> -	---help---
> -	  If you say Y here the resulting Xen will include debugging info
> -	  resulting in a larger binary image.
> -
>  config FRAME_POINTER
>  	bool "Compile Xen with frame pointers"
>  	default DEBUG
> @@ -132,4 +125,11 @@ source "arch/$(SRCARCH)/Kconfig.debug"
>=20
>  endif # DEBUG || EXPERT
>=20
> +config DEBUG_INFO
> +	bool "Compile Xen with debug info"
> +	default DEBUG
> +	help
> +	  If you say Y here the resulting Xen will include debugging info
> +	  resulting in a larger binary image.
> +
>  endmenu
> --
> 2.35.3
>=20

For the non-efi xen:

Tested-by: Dietmar Hahn <dietmar.hahn@fujitsu.com>

Dietmar.

