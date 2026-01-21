Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKqmOYUecWmodQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 19:44:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EAA5B72F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 19:44:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210163.1521971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vidBa-00086Y-ER; Wed, 21 Jan 2026 18:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210163.1521971; Wed, 21 Jan 2026 18:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vidBa-00083R-Az; Wed, 21 Jan 2026 18:44:10 +0000
Received: by outflank-mailman (input) for mailman id 1210163;
 Wed, 21 Jan 2026 18:44:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t4jW=72=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vidBZ-00083G-1q
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 18:44:09 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29bb788b-f6f9-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 19:44:05 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by PAVPR03MB8945.eurprd03.prod.outlook.com (2603:10a6:102:322::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 18:43:57 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 18:43:57 +0000
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
X-Inumbo-ID: 29bb788b-f6f9-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XN3bII5KRrKprbZcdO96keIyguuSczTRGUqeNGkt3fV3gC3DQVQtKpROWFBnAgtD0l3A5BztITaLzJbhg6kyI+L99SlvMNWMpYvF70+1+DXlHw+alRdxvDvky/i9zM7Bc5fRCRIQsK7w9CMuEhS0+Pk/OtS+M/o4/u2s94FYZFaA1Wp2nfUjvadQEUNsjnjeRGIIe0pMR9R+ggWUQ/vjU8knn+nfSmWxWhJQ2PGlQu/75Lj09dNSRYbie5TxyTK6j/Hudd4+d8PLU71UhfBJFooorpCsCnilNH0W+J/Q67fTFGEniSLLK96Uz/TUFucdGS1j952ZJ48Y7d6HwpWIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgFnC943YKWfNBpj2PlihUbnDFNiYD7hP1fbiPXbYg0=;
 b=T3ILay8laRxweTJ9KWsMA1y3qP8iZMk6b0AAmDf12oJdP719ZVbHqNJYi6rUbc9ui4rifVo29AwI2h2GNAWEvICWGaPkePjacaDIR9Ai5QCoaA6YfGPx584+Z5C6TBtVrbooZ1/9quDBweaS+2idCQoqeWduFo0fjLXTiYTtiyy0biUsuW48KqnGdOvjBGlR2IfBJ1R3hPdaZoEhKSNLydstj1smKGZCdrLRp4kwku5ltg5myiWQUvnLskuf4CLwp3qMSM7xFrbMTG82PxTy6b/d9+zslpz9Vvb4rkn2zRrWknMyvxsnntrdkqD2IKJd7wTmhvFdOWJqJ7SYQ+qSQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgFnC943YKWfNBpj2PlihUbnDFNiYD7hP1fbiPXbYg0=;
 b=lyQhC9ptIvtIFeagZ9/rSkl4JTUB77OEX9NNcl3oxV8Cnvm8ioNO28GQ/CJOyK0WJQD+55D4ekZQhOiRcERRh7W+/8FU3bcCjC5lFqwTfryNk6dEnsOUd+woCYfuKeDAAjlOQXaIYZyEdUUyNhE2ZY3DyeLhIa6up+rAJ7VnYLiATIZhKoS3cK7d15F1Dccylr9+EUVC3BQzXNMnkwaWxA2TZrBSepfXGtDVvKSc6w2oXM1Vuj/VCWu93vw7Y88Ngy216px6r6/qkh+q01kJsg/EhgpI+fK8ADG9707Fl6rQUQqou6d9k5+C6tRR43tlO5Q7ZMamZtaLrTaQYeCedg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v8 3/5] lib/arm: Add I/O memory copy helpers
Thread-Topic: [PATCH v8 3/5] lib/arm: Add I/O memory copy helpers
Thread-Index: AQHciwXl2jVTGILzyE6wM0DfzctyvA==
Date: Wed, 21 Jan 2026 18:43:55 +0000
Message-ID:
 <07fded74c7bc375a4e77596866072b65a546f8e6.1769020872.git.oleksii_moisieiev@epam.com>
References: <cover.1769020872.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1769020872.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|PAVPR03MB8945:EE_
x-ms-office365-filtering-correlation-id: 42d3c5c3-9da1-474e-1fad-08de591d08d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?nEMRlWtfYkqnh960u5F4I4D8NCtVaEUmTYCllL7yI9h/yf1UW3C79AWujv?=
 =?iso-8859-1?Q?+R1+3ba3a+jdvNaLHT843fEb6fDM0snGw1IZM/0ToBU0tLsIzqrSF5oVV5?=
 =?iso-8859-1?Q?L3aSpfxYLrxbhXTxFGRKSAHa1vKKhOob/DFcjyvPLGILCXErSQ0WCXrQEH?=
 =?iso-8859-1?Q?2u7tw/FIQ5pOefICzZlSdIHwkO+kw3lMvj5Sz3pYPrplniR4UsREU8KALZ?=
 =?iso-8859-1?Q?gZiKHNTNNXyIxDirprEzWoATnum39P45MMdNgjx5hQPw77yS/Z4IQcs3Vv?=
 =?iso-8859-1?Q?WQFKB5aCiTjNI+aLlaEswOOs7Qg3zJpZM/0OU2PUcTb8MwKD2/bH82VOlK?=
 =?iso-8859-1?Q?JEp44zKbYMOu7hKT+obafLF8VVB0DlMjwQ5/WY9g1bDcr1sXlkdXC3r7y0?=
 =?iso-8859-1?Q?IORxY30pf0D7iYT9WMkNGMRcZ7BKOCH2QjdA45QLsI5Z/OdXoeBctVee5T?=
 =?iso-8859-1?Q?IUXKUS7nUelXdQnPMiXvXQBATF5FW1/8aJcqr7SzVMKN+MoYaOshh/smm3?=
 =?iso-8859-1?Q?Va6pkQxU1+mG/dl6YrxboZwBL5PKRZpBQX/sohrZAQsMP+vBsx+DkpwG2J?=
 =?iso-8859-1?Q?YNP71mSti84aPnvXb2zcp1g/6rygi2Z5Ieg/c+bisbLJ7eTxTMz3+55Ydc?=
 =?iso-8859-1?Q?FLo/RC8JzuMFr8hTycTHFylbOX2ZBF0x58maNf5z+KYqo9BVpns7YvVYwx?=
 =?iso-8859-1?Q?dARmXoUzEAa43pt97P4RxodIx5zy29HlIUnsTvac5Rdr6TWq+WWnEifqkl?=
 =?iso-8859-1?Q?uDLpfvKK6ms/BuWyG9tCj879qfXyMn2NjxqxJIvBlbLXwds5dJ9z7PJiOV?=
 =?iso-8859-1?Q?MGpTHFdZ8BnFHTSsw10zm83+GZScLkxVhRXmj+f4irkEcTjGancgWFty9m?=
 =?iso-8859-1?Q?tC+1vfa9IWmiDUaxyP5aZgi9+9U+Iy0uBWbFNU3jLXBJJc2GI+Ou5+snrN?=
 =?iso-8859-1?Q?GjCJQAmxN6AUBLQMmx0x7bRmFo+iJBsc5qhinWlOG+i4Wj8e9SWpuavAXb?=
 =?iso-8859-1?Q?42ESIMwaJtAvc0CZvq5od57vTpRe/duHr9QwNhwwk/V4CvPEAT60Asr/4i?=
 =?iso-8859-1?Q?BVnRBW0qRTGKg0X8YYWyELVOvlSFn929nYwgndTTHsIXTEDsbXjfOS4clE?=
 =?iso-8859-1?Q?/6sVglVypCLOt56/YabXSwHdFWNOV2DFy68twf5dbIIVqlT6AmaHqIA7N8?=
 =?iso-8859-1?Q?peOpfvkI2z1HbeUIASFRm3zTWIMTfNbOC3UYbpNlUF3lRasBAMib/hEw9S?=
 =?iso-8859-1?Q?uIwt1kXho/tvUpah8VhCFntdifkAz/oWePsSmsoXhOgktaBHy6IXYdsoIo?=
 =?iso-8859-1?Q?7eEnTdrtSbPJUu3h019CybPDTF26qazYEqEQLmTJoJkWN5WMZjac+6HAa5?=
 =?iso-8859-1?Q?Fd/GYSI/uOYMEDhcjtju3REyCnQUVr0Ofd5LqJ6kfOIBbydrXppyw+DQ60?=
 =?iso-8859-1?Q?QTI28JDYNbf9YWjZ6wuAqC6Io6v/p7APFvTVaEkvMf5gz5KKyXUrrjZdiV?=
 =?iso-8859-1?Q?B6b/5dGLbgL5euc9Y5lfe4FCNP+5obKUoJHwRGhBBtxROcvBcogAD9IbuU?=
 =?iso-8859-1?Q?0urgzxzipZIkNepVzsSXnoDQybnOZRojB0grfs1xlSzrBw70cCXmjwj2YT?=
 =?iso-8859-1?Q?49+cOk5ocLNL7H7pbODzrGfRk87sytTkxaTBGDG8RIgxSlhANiBiIUgDzT?=
 =?iso-8859-1?Q?XagD7n0vGXayG+u/cvo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tFQ3FhNGapOUWjksGoJo/TQjfOaPWaatW/GCW0YT5uZ7KaHXQMbgqZdjbk?=
 =?iso-8859-1?Q?XkV++Frh0aKZMRrHddZPrUWlRI6tfR8d9pNPMdNLvigh7Z+wH7rAVssFPk?=
 =?iso-8859-1?Q?4upHw5sg6ZF6G+/dZ3dGrSceR8iqo6lAk0VuJgQhb1AYnR5RliA1auySq+?=
 =?iso-8859-1?Q?+lq/wAF83YfysxCStyrXIEtgsXYzOVXoCFtnr780xzCJKBlIGQFhAbkp9z?=
 =?iso-8859-1?Q?s4zyOu0GdzXM39h73dM/DhehpDqO0J5U1olqsPYxSOfxe+Ok+UVbe36Q5z?=
 =?iso-8859-1?Q?6iRkc9/4fseys3dfWOZdofFSIdjl7a7FGJDKWv21u/JCmd+A6HiF71vhTQ?=
 =?iso-8859-1?Q?wRO2+jEhO+e4N/Cf+H8S/QHXQWd3xvSuputon5i2hCFY2EDOlpsJPExdJ3?=
 =?iso-8859-1?Q?uFjCLrq/nlxZ+ZyrNyu9DKobKIpVhwcreCn+qT4tiqhekKNlMI9SRYN2Vv?=
 =?iso-8859-1?Q?qS0kT5kj9GkboeKJi+vCP4k9Yz/evSDocUxQAoTYX/xu2fFcnXONN+D/Q6?=
 =?iso-8859-1?Q?NmzWc4Ijk2ajpI8fY2+s23pXrxxMtjGf00URnW4x6QTcrxWMvItdntBM03?=
 =?iso-8859-1?Q?lHvWZW7WzFDA+sr3lie7jzRp1aXqoDPnjFhqs+XQjD4VhRQY4s5AdEqPzK?=
 =?iso-8859-1?Q?H7MCLgUZMDOWfDl1Wh7/t1nTxcH1/c4yq4qdAPE9mFdSPnTWQhMOLJIPhP?=
 =?iso-8859-1?Q?qC2NZXfsZR8NXnZ2TdOvQee5X7nUMjHvpJSFGkaNL3Gb+M04/nPfCW+T0+?=
 =?iso-8859-1?Q?DyA4V9gq1htrjaD4Eyys4OlQZCLb/qO/BTXEePwkSDR5BBlVbSVTSNlCbA?=
 =?iso-8859-1?Q?0eQ8Vg7Ur4gnWJFU5431k+0/HXld//Un9d6o8IWQj1HavgBfWNdVTsrk2m?=
 =?iso-8859-1?Q?Ml9Ef0Sm1y4ZlT56TBC6yArsc5s8F4it6g4yIAQeO1Ma71bOF6eTS5TUqH?=
 =?iso-8859-1?Q?86Tq1f3HJw11XWnnFXB182QAZtyEAgA3ofIFrLUIJ4fhmDoczlXfxWSxl8?=
 =?iso-8859-1?Q?xI7SJ6v2N9NzDh89oufMq/pR3lMBsnQDN9sbXVbkHJU9m2VtH34NUEXtR6?=
 =?iso-8859-1?Q?rkl28i44h/wKLYFQrQkHDT7ANmeLju2Lh2jxssv043kIy6m29d3perVb3P?=
 =?iso-8859-1?Q?Ob2ZeSU2edxiTmwdx9SBgY2INJqj+zck9YNBwFC3Xw/os/rm76fTuJk+FB?=
 =?iso-8859-1?Q?F2PFnzqBUHqJsk6gPL81zFEwxwCc0vO+QijMNDXX/mHRq+mh+8DtMSlGPP?=
 =?iso-8859-1?Q?Bild0jTi5OGj0RYaZbNGVR0CfT6b4Om+SaKq/MLRWV0UU84e5Yx6QjNik2?=
 =?iso-8859-1?Q?DRMy6iYyO1cJm9IOf55LJb5ELoZSB5RxiBrq+zxhbYztfsCljdpBFFhYpt?=
 =?iso-8859-1?Q?itBN15SenW05ZFQOwTm3jW4UvskKI0cBU5qc2HD7OXoozw6Y0W+DPftOAN?=
 =?iso-8859-1?Q?YYk4wp/diAU58esEpAPqf8SMJwIIOsSKTOm2iGA7tZeIlZU2q8hpx1/eJj?=
 =?iso-8859-1?Q?MQvsLBB+uU/GDxt2hKXdC+v2mrRPeoGui/ykvjciY0Pj8HFJ8XeozrutDY?=
 =?iso-8859-1?Q?0qY7aXzbj3gVOCYAPhvRUChTMc3fpd4aRrtWmjxkXhwSemT8pC/ggREHKB?=
 =?iso-8859-1?Q?0+OkiHgqHllwOoA8rol4WHi1nGscKWfeUf+cv4a4hXotAgxi3h0OaJsjZm?=
 =?iso-8859-1?Q?O+YUlH7AKyMqdtVRZ8eCVe9gp9YCLe99IgyT3O/50e3ZkN06j1e/NbhRFH?=
 =?iso-8859-1?Q?kJXyjDhRy9F0upAijQMUIe/Y1tG2VajmUQd1MFkXFdI+1zyEfbF7Y8UMdq?=
 =?iso-8859-1?Q?LKzt7Lt3fwKXenxb1NPPq/A8iJawMss=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d3c5c3-9da1-474e-1fad-08de591d08d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 18:43:55.2048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CxOB6Y71XWX4tL8JCES9xcOZ7+fTQcuZBxCz1VY1rn0pd1xXnfXEQaulvEsZxEqLub0NssLc4ymzARTsk+SiBztYie9+mBuqtQZAKxu0DmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB8945
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 38EAA5B72F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit introduces two helper functions, `memcpy-fromio` and
`memcpy-toio`, to provide a robust mechanism for copying data between
standard memory and memory-mapped I/O (MMIO) space for the ARM
architecture.

These helpers handle alignment safely by using ordered byte accesses for
any leading/trailing unaligned bytes and ordered 32-bit accesses for the
aligned bulk transfer. Using the ordered `readb/readl` and
`writeb/writel` accessors avoids unintended endianness conversion while
respecting device ordering requirements on ARM32/ARM64 hardware that may
not support 64-bit MMIO atomically.

The interface lives in the generic header so other architectures can
provide their own implementations (as macros or functions). The ARM
implementation is placed under `arch/arm/lib/` (mirroring the x86
reference layout) and is split into separate compilation units added via
the architecture-specific lib Makefile.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v8:
- switched to ordered accessors to address the ordering and barrier
concerns.
- updated the documentation to match the implementation and explicitly
state the supported access sizes and granularity.
- rename memcpy_* implementation files to memcpu-* to follow naming
convension
- fix indentation to match Xen style
- fix intendation to match Xen style
- move memcpy-{from/to}io to more convenient library place

Changes in v7:
- x86 guidance: removed the speculative note; header now just says
  each arch supplies its own implementation or macro.
- name spacing: dropped the double-underscore; the helpers are now
  memcpy_fromio / memcpy_toio. The header also explicitly allows an
  arch to define these as macros before including it.
- updated io.c to keep 32-bit transfers safe on arm32
- moved to __raw_read*/__raw_write* accessors to avoid endianness conversio=
n.
- split the helpers into separate compilation units

Changes in v6:
- sorted objs in Makefile alhabetically
- added newline at the end of Makefile
- used uint{N}_t intead of u{N}
- add comment about why 32 bit IO operations were used
- updated cast opertaions to avoid dropping constness which is wrong
- move function definitions to generic place so the could be reused by
other arch
- add SPDX tag to io.c

Changes in v5:
- move memcpy_toio/fromio to the generic place

 xen/arch/arm/Makefile            |  1 +
 xen/arch/arm/arch.mk             |  1 +
 xen/arch/arm/lib/Makefile        |  2 +
 xen/arch/arm/lib/memcpy-fromio.c | 48 +++++++++++++++++++++
 xen/arch/arm/lib/memcpy-toio.c   | 48 +++++++++++++++++++++
 xen/include/xen/lib/io.h         | 71 ++++++++++++++++++++++++++++++++
 6 files changed, 171 insertions(+)
 create mode 100644 xen/arch/arm/lib/Makefile
 create mode 100644 xen/arch/arm/lib/memcpy-fromio.c
 create mode 100644 xen/arch/arm/lib/memcpy-toio.c
 create mode 100644 xen/include/xen/lib/io.h

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7494a0f926..bd8638c8a7 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -10,6 +10,7 @@ endif
 obj-y +=3D firmware/
 obj-$(CONFIG_TEE) +=3D tee/
 obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
+obj-y +=3D lib/
=20
 obj-$(CONFIG_HAS_ALTERNATIVE) +=3D alternative.o
 obj-y +=3D cpuerrata.o
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index dea8dbd18a..0c28dbeb87 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -2,6 +2,7 @@
 # arm-specific definitions
=20
 ARCH_LIBS-y +=3D arch/arm/$(ARCH)/lib/lib.a
+ALL_LIBS-y +=3D arch/arm/lib/lib.a
=20
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
diff --git a/xen/arch/arm/lib/Makefile b/xen/arch/arm/lib/Makefile
new file mode 100644
index 0000000000..07a0d9186c
--- /dev/null
+++ b/xen/arch/arm/lib/Makefile
@@ -0,0 +1,2 @@
+lib-y +=3D memcpy-fromio.o
+lib-y +=3D memcpy-toio.o
diff --git a/xen/arch/arm/lib/memcpy-fromio.c b/xen/arch/arm/lib/memcpy-fro=
mio.c
new file mode 100644
index 0000000000..85377137c3
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-fromio.c
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <asm/io.h>
+#include <xen/lib/io.h>
+
+/*
+ * Use ordered 8-bit and 32-bit IO accessors for portability across
+ * ARM32/ARM64 where 64-bit accesses may not be atomic and some devices
+ * only support 32-bit aligned accesses.
+ */
+
+void memcpy_fromio(void *to, const volatile void __iomem *from,
+                   size_t count)
+{
+    while ( count && (!IS_ALIGNED((unsigned long)from, 4) ||
+                      !IS_ALIGNED((unsigned long)to, 4)) )
+    {
+        *(uint8_t *)to =3D readb(from);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        *(uint32_t *)to =3D readl(from);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        *(uint8_t *)to =3D readb(from);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 8
+ * tab-width: 8
+ * indent-tabs-mode: t
+ * End:
+ */
diff --git a/xen/arch/arm/lib/memcpy-toio.c b/xen/arch/arm/lib/memcpy-toio.=
c
new file mode 100644
index 0000000000..588497ed0f
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-toio.c
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <asm/io.h>
+#include <xen/lib/io.h>
+
+/*
+ * Use ordered 8-bit and 32-bit IO accessors for portability across
+ * ARM32/ARM64 where 64-bit accesses may not be atomic and some devices
+ * only support 32-bit aligned accesses.
+ */
+
+void memcpy_toio(volatile void __iomem *to, const void *from,
+                 size_t count)
+{
+    while ( count && (!IS_ALIGNED((unsigned long)to, 4) ||
+                      !IS_ALIGNED((unsigned long)from, 4)) )
+    {
+        writeb(*(const uint8_t *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        writel(*(const uint32_t *)from, to);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        writeb(*(const uint8_t *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 8
+ * tab-width: 8
+ * indent-tabs-mode: t
+ * End:
+ */
diff --git a/xen/include/xen/lib/io.h b/xen/include/xen/lib/io.h
new file mode 100644
index 0000000000..1c0865401e
--- /dev/null
+++ b/xen/include/xen/lib/io.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic I/O memory copy function prototypes.
+ *
+ * These functions provide low-level implementation for copying data betwe=
en
+ * regular memory and I/O memory regions. Each architecture must provide i=
ts
+ * own implementation based on the specific requirements of the architectu=
re's
+ * memory model and I/O access patterns. An architecture may supply these =
as
+ * functions or as macros in its own headers before including this file.
+ *
+ * Architecture-specific implementations:
+ * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ * Each architecture should implement these functions in xen/lib/<arch>/io=
.c
+ * (or define them as macros) based on their hardware requirements. See
+ * xen/lib/arm/io.c for an example using explicit I/O accessors.
+ */
+
+#ifndef _XEN_LIB_IO_H
+#define _XEN_LIB_IO_H
+
+#include <xen/types.h>
+
+/*
+ * memcpy_fromio - Copy data from I/O memory space to regular memory
+ * @to: Destination buffer in regular memory
+ * @from: Source address in I/O memory space (must be marked __iomem)
+ * @count: Number of bytes to copy
+ *
+ * This function handles copying from memory-mapped I/O regions using
+ * architecture-appropriate I/O accessor functions (e.g. readb/readl on Ar=
m)
+ * that already impose the required ordering for device accesses. Typical
+ * implementations may:
+ * - Handle leading/trailing unaligned bytes with 8-bit accesses
+ * - Use the widest safe aligned access size supported by the target (ofte=
n
+ *   32-bit on Arm where 64-bit MMIO may not be atomic)
+ * - Rely on MMIO accessors to provide the needed barriers
+ *
+ * Limitations:
+ * - Only suitable for devices that tolerate 8-bit and 32-bit accesses; it=
 is
+ *   not valid for devices that require strictly 16-bit or 64-bit access s=
izes.
+ * - Callers must ensure the target MMIO region is mapped with appropriate
+ *   device attributes.
+ */
+extern void memcpy_fromio(void *to, const volatile void __iomem *from,
+                          size_t count);
+
+/*
+ * memcpy_toio - Copy data from regular memory to I/O memory space
+ * @to: Destination address in I/O memory space (must be marked __iomem)
+ * @from: Source buffer in regular memory
+ * @count: Number of bytes to copy
+ *
+ * This function handles copying to memory-mapped I/O regions using
+ * architecture-appropriate I/O accessor functions (e.g. writeb/writel on =
Arm)
+ * that already impose the required ordering for device accesses. Typical
+ * implementations may:
+ * - Handle leading/trailing unaligned bytes with 8-bit accesses
+ * - Use the widest safe aligned access size supported by the target (ofte=
n
+ *   32-bit on Arm where 64-bit MMIO may not be atomic)
+ * - Rely on MMIO accessors to provide the needed barriers
+ *
+ * Limitations:
+ * - Only suitable for devices that tolerate 8-bit and 32-bit accesses; it=
 is
+ *   not valid for devices that require strictly 16-bit or 64-bit access s=
izes.
+ * - Callers must ensure the target MMIO region is mapped with appropriate
+ *   device attributes.
+ */
+extern void memcpy_toio(volatile void __iomem *to, const void *from,
+                        size_t count);
+
+#endif /* _XEN_LIB_IO_H */
--=20
2.34.1

