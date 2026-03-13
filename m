Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJw5LIEWtGlkgwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 14:52:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9FE284433
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 14:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253742.1549813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w12vf-0000kh-Ja; Fri, 13 Mar 2026 13:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253742.1549813; Fri, 13 Mar 2026 13:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w12vf-0000jC-Gw; Fri, 13 Mar 2026 13:51:51 +0000
Received: by outflank-mailman (input) for mailman id 1253742;
 Fri, 13 Mar 2026 13:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc6w=BN=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w12ve-0000j6-Er
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 13:51:50 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c53c53db-1ee3-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 14:51:45 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DM6PR03MB5132.namprd03.prod.outlook.com (2603:10b6:5:1e4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 13:51:30 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 13:51:36 +0000
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
X-Inumbo-ID: c53c53db-1ee3-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9iJ1M+40aHljvlBqqx0bR1ngDhoDJwUs1shxrUEszYYcmdN3ZmF1L7AuTmY7xku5eA0WFKT14RucgseZBXUga/HESoNk5CnI/yvK9eOgsK0T/aO890B7OaCEhoIcXl485H8vfW1cjR5IFazpwIXAvGfUg4msf/39xrsIrQ9Ad3kwLZE36psztLmKoePJkHrsSIbwF/BIhTYtMfGxsDHSP14OVjIGCrqyTe82T3WafAwm0fqMwgNCxj3s/COOml45eOQZh6PSzsHqm/u6pS5TvVzp4vdV2ZveJuxDXU0WbXhU7mjHneIONwJXboQ3KHbqlANRppvqmYyZcYzWJxAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBMjWIV5DbwwQRt9PenOijdXap2/xcZHjGWEN0gQWlA=;
 b=OfQ0qpk4pn+r9Su9SL+pRoIu0O0KvabK65iemmB0N6EnIZKETETiLP7zG5MAVpPe+3DWFVHH+wgY8830JqJwye4tPCsSihwX9X6MCCtMTXYVAFlTvp+C5p9/vaBB01aJRiPeEY0wrWYmsPvfPjVp+sHtoFlOAoHf58Tfp8CIimTNpqn+Iko4eDuOAyyWmYPVY65kqlI+m3a9m1iGMqSuuKNXKU3edlFge++/SZ/Pnjey1zxpBnqZlkx9HMfIgB5EJ3qynZWyL9O6laZkKdtlgFOLWOEhFq/gh+4NO0KYmVvegpWaVKQFkj/19nTN9pt+nos+QHp2FIpbtOmNB7IHqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBMjWIV5DbwwQRt9PenOijdXap2/xcZHjGWEN0gQWlA=;
 b=HPqbYhSIafTpMbRGO+rxOLEQiVIe25C2fqepzIQpNt1O96OdbjGa1zm5tphDelfgGPkfWHxBesr04Wup5z4gblIHBsO57QNUmj+zZpF6/kEY2UgVSilbXHtt7tdczkc9Ot4ZpgYK2Jej6nODHPr6xtfBrlSmcD42KZ79Ie4y+LY=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH v v2 1/7] x86: Remove x86 prefixed names from mcheck code
Thread-Topic: [PATCH v v2 1/7] x86: Remove x86 prefixed names from mcheck code
Thread-Index: AQHcsmDsLyrsERR4wkGR6TwdeRLYp7WrlD6AgADkKjA=
Date: Fri, 13 Mar 2026 13:51:36 +0000
Message-ID:
 <BY1PR03MB799679D004858F9E772F3F9AF345A@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
 <20260312204339.740403-2-kevin.lampis@citrix.com>
 <abbcce95-836f-4a06-a250-4480061ac3cf@citrix.com>
In-Reply-To: <abbcce95-836f-4a06-a250-4480061ac3cf@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|DM6PR03MB5132:EE_
x-ms-office365-filtering-correlation-id: 8f577c6a-1b6e-4683-714e-08de8107a4ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 2YRrzAXp2zhkSXga12KI4UTngzH0Fd2J2utLohywiFC0rp/aWlKThWe17RQzrI89LMXsmVxtsPOo17zdFbetz3Xx/igE3tsCAUtHuB+dpTOkwHMc8bPx1+No7OuoqjB9w6RF5DlM7Elm9ZKhMOU7ybIhNtRxMM9Zgwx++fEKmqlswVM1knZL6MU6PGwRy+ARuPuf3WS6ecCnvGvtrCwprgBQbXGIZanWmfDQsL5NEJ13zohtrFAuxwT4kHoY561WN2+M2C1dadfvLIuIpXCzj5gXbF+UhfKgPlYJii+dEf0FEvKP9XbyllVHn9EpsmirUTZtWSF1779wdPz9DWS8PByoZ6hFej7B6BCNWxNGwSbDw+kKZUACaJAmrUiTyxlHOnnZCh8KEZqCjtj/0nPoxL8M0RyRlU6PPCj+D4CnV1JHVZ0aKslP5IFXccetSmdSUAQObszELM41WKc3zxbYyjtlqrRQxkNu/1fppjWVrkr5WmvoMm6SZZXm3JfcsgTzGhJKfAA5LPVLvyEiIDjNgoO28lTY4253vJwPkZNnkPw1ZLokpYchmZkDzIK4/GGonTydMHYVzVvxRwWehJynsznJHgloeoD9yHtZSi25cWafy4/Ctjb76O8bhTp0Iq85nW7dOEmLpDWvt/cqgaXeGUyI3THOsVzXp4SSLN7Zg5rfPvJADAag3DCOCsU7thTQmjEFR1nXM7ooJGWPRlswqEieAmHctGzofmXve032e6KwwbZKQ1VaehCPRZswVAAEsUOeKATmwtQZNoo+Ow8sNopcz95FHEwZL3QEDvtEAdw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?x7aJNrUndtYB8DHtn11Ay0G0cV/RMR6sdYNmU3qfGShU05WTugNKittdL5?=
 =?iso-8859-1?Q?/0SQNWe/n4o1adKvprlZhfjQNtttWoz0iV51qYUM32iJy+94p6wozVhB7o?=
 =?iso-8859-1?Q?Kn6Uqm/wDSOT5MUG9CH4dAYuQ0ZYfaYc5L6N6688gJtSSne1rVkGprBv60?=
 =?iso-8859-1?Q?B9DJyL6USJDLberee5YGsGfVtQia7Aro31X0lImO+qzcIZ8lDM17Jv2iee?=
 =?iso-8859-1?Q?EN+xJoFGGZd1QV6hDgaOI1yy7MrQ6qTH7oK0879KdxfPKbKdfQwWiBvfX3?=
 =?iso-8859-1?Q?wRVxVVLMN8OG3WzgdoVfXaVnuB+4jiX9kdxLDcdidKx+J2MyQgqhmNHxca?=
 =?iso-8859-1?Q?WX+uUmq7jCZOriKiyskVKNOoh7aQUMNtsDgyRnKYEOIjdtQGMXtYe7m64V?=
 =?iso-8859-1?Q?lHLoieLUd8s+Lq+Kq7GNs8R2wFzZFRkAE41BUedRSFL8tiofixGMJMPZCw?=
 =?iso-8859-1?Q?aCHwPpnFzbaaF4vJvCfNJlOaxv/gie+YZj56RxgAdphwlRK/MjFSrevun5?=
 =?iso-8859-1?Q?OWnblmXsfoXoYF+WDL+mKqWY5jYlqUU+AI4lZ+cPcwb9BTNKG7hxC+X+RF?=
 =?iso-8859-1?Q?R8JRzz44AVk+ElTRaOi4XHNDKDANlMbtpjg5n5PWB/9rYs8b0QkSqQoajZ?=
 =?iso-8859-1?Q?2GlgOvYK44aHCFdkyrDGZgWVTFwqTvNDehKXii6RYQWo27sA0YraJKSE4j?=
 =?iso-8859-1?Q?J0Do91TkgYALq/OZulJU/Z5JT5+3R4VrHm6u0m+O7I72x8mxhg2WQ5K4iD?=
 =?iso-8859-1?Q?ynhNoQBeH/TNCWu8QAn4QgymDf9BmJrcVU2E+2LmOvNZOitJxeN1hdHEBf?=
 =?iso-8859-1?Q?B2ct7+jUHbmtk23IbuYPBbpb1uc9pPC/e3s7ShC3c+vB+X8ZifHbONUsR7?=
 =?iso-8859-1?Q?gJhEVFVOi4rOz8K7UpigRDjJMf+Ch2/9AydDHsEZoN1NTBRkXy+UBXx5ra?=
 =?iso-8859-1?Q?mLMaeJ+eQCJVlUnennVP0FyBXkQbUFelIAG/hGNyI3X0aJqzPKf2V9LfSX?=
 =?iso-8859-1?Q?SqaXTt/xig/CoKrH5JTzL8sI/AbJX+9eU509n9unGiv9su+ipTDkL8kySR?=
 =?iso-8859-1?Q?tdsbPHDIKigclPEX+4PHlC/blRBKuWwi4VjprwbIEezrk+FentbBtLVW38?=
 =?iso-8859-1?Q?ju1zi5QyH5MhvFiX9ukL/HWkG2eHiwMOaT43P648WQVSFcfscuXhUEqRnf?=
 =?iso-8859-1?Q?5kydEJffsvxVUJBu/DdW8uNGdBQ9tKj8A0Qi9romm2tsjBJbYGm3iwT0W7?=
 =?iso-8859-1?Q?XOjDNWuLkYhphuJTebnQyGMK2i3hPYjLldQh3LgYJYLYRTVeuF4bDJ0Ypa?=
 =?iso-8859-1?Q?XSSRu7HmJKTWYp8G9/pZ2upOXB18kZVTO5Yft5Z+DEB3xcInv2F8RNsbMQ?=
 =?iso-8859-1?Q?Vlq1Q06e5Sn48xu0zgPdlTx+pCjUncskn10q6dNHVjk6HIcNCw3TdQFnKj?=
 =?iso-8859-1?Q?GVPN4pKIeISAu/SxA2xOumnX6mOZ+iZAuP4rE7u5eM0b110FA6FBqOV8ZZ?=
 =?iso-8859-1?Q?CMnFMWJDSsW194vghMdFMusSI/cpRMV06PLVD9U73D034n0sllK4BaKEAH?=
 =?iso-8859-1?Q?2FGoPjlMsFZXJyWz+s4cQffB+/P/1PZBfVuTtTdLx7xdGy1QmhDRR8dTEI?=
 =?iso-8859-1?Q?XJ/VdZE4ufa1dekEhc8VAbZAG0y6vjIu+PuugKn+sBCCg13vwrS+DCgXBp?=
 =?iso-8859-1?Q?l8HJQnSzpT+EZJHSEH64oQWOQLkyNIdwxp1+Uwhs3JkNC7qYNfAFIr10gs?=
 =?iso-8859-1?Q?/SxME9jVbcMXdjfKIf+b3mvzRChQibGvrwrMpVdncrAWNfIFUlNndkwhUJ?=
 =?iso-8859-1?Q?rrMN/3ympQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f577c6a-1b6e-4683-714e-08de8107a4ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 13:51:36.4551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u+mbDBaJu59or1wcMOqeISvmvBxBdUpTNuVqU2KWRvlec9KfGyoZvXv4QIFttY5grlKsMA77pXzeeiJUOb3iLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5132
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,BY1PR03MB7996.namprd03.prod.outlook.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1B9FE284433
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>> -=A0=A0=A0 if ( c->x86_vendor =3D=3D X86_VENDOR_INTEL && c->x86 =3D=3D 6=
 &&=0A=
>> -=A0=A0=A0=A0=A0=A0=A0=A0 c->x86_model >=3D 0xe )=0A=
>> -=A0=A0=A0=A0=A0=A0=A0 return true;=0A=
>> -=A0=A0=A0 return false;=0A=
>> +=A0=A0=A0 return c->vendor =3D=3D X86_VENDOR_INTEL && c->vfm >=3D INTEL=
_CORE_YONAH;=0A=
>>=A0 }=0A=
>=0A=
>This breaks P4.=0A=
>=0A=
>It is not safe to write expressions like this, and I've already=0A=
>explained why.=0A=
=0A=
Last time you said it's not safe to drop the `vendor =3D=3D X86_VENDOR_INTE=
L`=0A=
part because `vmf >=3D ...` by itself will pull in other vendors. Sorry, I =
should=0A=
have realised the same logic applies to the family field too.=0A=
This "breaks P4" because Pentium 4 NetBurst is family 15 and will now match=
=0A=
this new `vfm >=3D ...` expression when it didn't before.=0A=
=0A=
I'll take Jan's suggestion below to match `vendor =3D=3D Intel` and `family=
 !=3D 15`.=

