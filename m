Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHJvK0HOgGkvBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:18:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78121CED33
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:18:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218895.1527797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwcd-0007hC-Va; Mon, 02 Feb 2026 16:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218895.1527797; Mon, 02 Feb 2026 16:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwcd-0007XF-OX; Mon, 02 Feb 2026 16:17:55 +0000
Received: by outflank-mailman (input) for mailman id 1218895;
 Mon, 02 Feb 2026 16:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZh-0000fY-2d
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:53 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a754571-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:46 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI0PR03MB10299.eurprd03.prod.outlook.com
 (2603:10a6:800:202::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:14:43 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:42 +0000
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
X-Inumbo-ID: 4a754571-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBoLQHC3GmYHXpy2o7gFwP6RIqdYg6eftQ6MsOneBvd5di1qospcAb2J/PK5J1pzeffeGPQDlcTt9xPhONLCUod5Fb10HQ0EX4y3w/jUjF7xhC1w1rTSWL2dcxbngcQ8iJTGgELUuma451/f+DvaJ8zSH4xNt7nOQfb6vAd4S0jd6bm+izq5VQWWb9YWa9OI/u+QaO1kYp/SGh0GXi3HZ+xy4Wx/P3AbH2gipXlBMYJD8y9cdqfYwUW/slytC00O5ksFjrLDL/+pLnrQCwF7IVaRBPs8BiJg3EirXFfhZluE6H/TWV1VsvqhMuQLeM2w5XYma/NGyp8sGJKkNdc1EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGDkX3OwjMwisG4lxnwiN45k91l7748k1bwBYZp04Ys=;
 b=AuJvJohR+DFk9TkIiqqBgUTaH/vYjvjj3GU63B9F8Rugt2eoCA2oKNtSU0xZDO41lrw83O1pby+qQM17ggZhUHBEU01Uo7zPOkjsnfgEKMrCG/2nGm297P3M9bilqmMpnV33nuK62VdRKJwdODNy2jHrshf/qwfXFE7O/E50o6swWd1kjyQRJllp+fyPqOk6vr5bcpt5HH7dIfgP+NwaiHfviQ483ekPw5JHYJ95NnYE0Q8lT5PPfbe9OhlwP3S4tv5I3rtxQ4FAdmRUhwL3giEQwTorBx9bCu5POpIssMUMS0awD4Z5AWk+Ogk++pHhjqf57XLWIcv0b69gEnRksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGDkX3OwjMwisG4lxnwiN45k91l7748k1bwBYZp04Ys=;
 b=IiEvd/d5e+mvNPSYblaNgPl92Sdercb6Jh3BPqhR2fcsCjv85a0ejJWmD/aSYhQmaPd1ownL4ukVbnJ17DD4Xrmrc5CQMZGDlIa7KOzyZIxwVstXhEa7jSb8LOMmI2vjPPkyaSXraDqsqoPK66caOwvZ9RGCONRR40a80MZlH1RqzjrnoiCcecRBalDH24m9iKkupDngODpuCfq1fMG6Q7KDa/USA+t9dRbcNlCyexwNE+ojhU4ki2KyXVT5K5KR/OynwJdTKJ0C2oGWlrNkyMHyLH0zSgXw4IyZiz+FPzcw/Q9ivFSiftaazasztz3He0P6zChHJjCxu1m+lEHljw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 13/19] arm/gic: VPE scheduling
Thread-Topic: [RFC PATCH 13/19] arm/gic: VPE scheduling
Thread-Index: AQHclF8KXPFV5VVY2Umd/wd7Gk/+fQ==
Date: Mon, 2 Feb 2026 16:14:42 +0000
Message-ID:
 <6eee1cbcbfc221b0a6af00f7ec5ccc52f8bd5b75.1770046465.git.mykyta_poturai@epam.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|VI0PR03MB10299:EE_
x-ms-office365-filtering-correlation-id: 45f50c92-6743-42d1-e590-08de62762c86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7inYCXsZEmCYFQQUv8E3DiITGmX3tgJAmlP6Elt5NiUxwAgTWZaBb5QVp4?=
 =?iso-8859-1?Q?PUwzGNA7Jiz0MHd4sp60GdL1WQcIoJowQU1Rq9d302xayKfEygopAodFe2?=
 =?iso-8859-1?Q?NAvQeyez2JxX+vcA+iriTuFno+w/4rUZeER/CMIiUE7aQelYwq04jwMOo2?=
 =?iso-8859-1?Q?Eo6cVu8wYxWUmqyCBjM49HhxnknAbyUpwsPSou8f94ZgW5f2xumRwrEIu8?=
 =?iso-8859-1?Q?ZjOhhi+crJN7UpakCtKu62elKFnrYKfV422dAjTTSO7gS/zCne+FP0onEk?=
 =?iso-8859-1?Q?m+jxQ7RE4iQAz2Otz1cxpLzjlOHJOpxvpwQNnC7h18a1lP7YWyDY5N3ZnY?=
 =?iso-8859-1?Q?yAXH2fIa47g0Y2se/9BTri2HtWjU81l/kZP6Tp0cW3+SZCAmVKWinas+we?=
 =?iso-8859-1?Q?xM3eoMqABfTk6P3yZjJfSs++rxPp1Uybp/urDRDGXRnpYgROmElstFMkGK?=
 =?iso-8859-1?Q?w00MOiboK/g86H8MiaZV9H1TwkA0DCyTBP4WXli0AdS0TtPUCBWF7Z5+fB?=
 =?iso-8859-1?Q?wEhmFRegENRivi57DZy0VomZL8Szs5AY6/Ht/u/8okyC0wnlNZM8ISuRKL?=
 =?iso-8859-1?Q?/k2uw6mkskesaPqhjml0L12tln6pup3rTLIOuuNMVJc2b1fY9R2phSzI3M?=
 =?iso-8859-1?Q?eXuH9JVV6iTLLNm3Qr32k8IeQiWIHZNjI7E4YdrdSoBhzvBi6EAzdsFV2F?=
 =?iso-8859-1?Q?MexLrNpBS6dtKYAg/iU4KxieWNYzdRw3h/sAON4sYP9vBdmz4l87lUzczV?=
 =?iso-8859-1?Q?TzkKxV87Ew8p3v7Ga+slkvDkpErPsxkruczf4skxHx5l37FmTJZkNfDI49?=
 =?iso-8859-1?Q?4WLkeQWU0UiTtjsWR0HoXW8j/ENtNoI2BvGSTRECGlVxbzRwglBCc3PS/3?=
 =?iso-8859-1?Q?fVgKg4zSoZcBCw5NBsbFDo5K0WVr3d85P3/geiDuWp+pwUXoYLaNXuQEvO?=
 =?iso-8859-1?Q?EgjqnEdy3J055TW0tEz7uUfP1pAyPX1TznMJz9q0lvRrFvoH8xsX6cMhRv?=
 =?iso-8859-1?Q?Z21YIHDoLGDg922G2VI1tIvx11I9SfdT2WRC+HiCstFtNMOu/kYk60R6jY?=
 =?iso-8859-1?Q?tFXrlxp+H0owGeoAKwjfC1iTkTN31fgkzaFVVQCwbf6mgusD9SsQe24QAw?=
 =?iso-8859-1?Q?2OuQd/cJrcHw7mUnWWrVTP7yftXXFJ4QjdkhMe1t39dRaUPuVfdkQP8ZHc?=
 =?iso-8859-1?Q?v7Mp+xb/SjSw8OKrzWi6CigwxkxJ37h45+0LCBG/JADQmobMGgW7l4uqL+?=
 =?iso-8859-1?Q?kC1SGJKzz1XdfMHGWg++6A+XaBCcaV2pjEAbY9wCN0MzNdN3wD2Z67Wl35?=
 =?iso-8859-1?Q?3zCzh7mvpSc7xw0J9AGqk4ijiWgoEGNgbp12qAibPO6hH/9446gw8ML3CI?=
 =?iso-8859-1?Q?F2U/XJb0cCoAJYnKRigUUGKx7bf2I/RaEudyzehGlmvOnahh3fe28ii4lO?=
 =?iso-8859-1?Q?WylFGkuRn09Cxtbi0rhe7+V0PqiXWoJS4y4SjZHSVbAwoyHlqx0LaHOG+e?=
 =?iso-8859-1?Q?Gn6gAkk2qzGu6H8sumzekk85I3Ed1tCGxxx/v/X2TSbW7SLjaFWt3AV1DB?=
 =?iso-8859-1?Q?FbkENutD8gKCugBuLaouVryAktc2ql39ZugKrducGStmSlSrqcRwtAW/hb?=
 =?iso-8859-1?Q?jGO3Hosyt/ZKZWxe4BGIRVIvzhAM4ycCqPWG8lOapa2Vdn1I5rBrrFIU+t?=
 =?iso-8859-1?Q?IhZbQtzZ61XRTKwo+TQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fv6E9r5lbv32caG22jW5y9LtU/wHEVHF/uEL9epY7qC12k/NIm69DOL9gO?=
 =?iso-8859-1?Q?5xHz6JLdpZZQ0BDIgFDT2IM1lxVTFJRgJ7+u9XnxgE+kh5xkOAL5IkbhPo?=
 =?iso-8859-1?Q?6z/8uGSlipRQhXFzjh2bldSUCCF+lt9IOb5L843ekO92VKYWsspm4nlzZy?=
 =?iso-8859-1?Q?MgzRVyzC7VgRf24uNheRBs4LQrx6oJ7MyoFP7/cYH3rsCyZFRYNMXBKcNs?=
 =?iso-8859-1?Q?hEVjyIBd0YqWqo75gRqbKVFObURH0+FvcdtnxUJR27PMENd2f/a2fBo5QQ?=
 =?iso-8859-1?Q?d38brDiOiUAr80lEyZtih/CzK7W92Eldb6D2SW7bfg12yUfnhuFKRJ1tMT?=
 =?iso-8859-1?Q?t7h7HH/4JY4+GWcseawiK+TiQRBajK1FD3hlUsQou/OiFTP0qKDJXS5Dg2?=
 =?iso-8859-1?Q?aNHBkhHGd+LsJKTKPeP29n5yMfl6U0jM2y4QHeCV5kTjh5YxFPnyudoiME?=
 =?iso-8859-1?Q?rVhkGt75x3T/Q6CP5yTJFll42UoyCpuf+P+qzPyLeqVP2eeUrOiYVk8z3z?=
 =?iso-8859-1?Q?0o4gfcQIWRlTRSQdBY2Jd6AvDDgoYVgsOo7zCyPK1ETIO2EEvRbWF0WB9J?=
 =?iso-8859-1?Q?HhHVgWzSdf4GbgdDuSPv4Dm52nPuv9VwdMC4gA8Jwz1o0a4PPLVD7vlXxn?=
 =?iso-8859-1?Q?nbdE6KHxtYklgupoG4VDKBaKb4PAhI3k8K+fl8QMwN+vgWQKhyauNTf7Qj?=
 =?iso-8859-1?Q?XRnwmIF0rXrKFAMREFzozzhZF7R4gOt9xVAs369RK8t7ZZrCa6ziR+YEja?=
 =?iso-8859-1?Q?j5Sgys+vfppzog5QfPlFZLjf2STmDmBt4gW854JRtqBosXwKvh1Af9yhgI?=
 =?iso-8859-1?Q?xru4hSctFSqg7XhuD0EtEhhnFmfsq88Lgr4jZEXb9+ogUefZcYoYjem8P6?=
 =?iso-8859-1?Q?vp+96+uqxON2ThLDfYgwYVPz8pfqzR7ceJknAHcqXohI1+39CO6bsBuWvD?=
 =?iso-8859-1?Q?mLZcPR0F7mCi6Qar2sQLLb86n4flJosa981YUny+RVUoO4Z6K5Hk0GcCNj?=
 =?iso-8859-1?Q?9iliFHRohEk6NAxubuDf0O65NftvDOtsGukoA3bZK2r7+q/ooLfsXokE8k?=
 =?iso-8859-1?Q?4teawiNywGdke2/w2Ieu3Nt+YZlcLxP3kTBNyZzXD1z9ycfB6ywtJu4Ukg?=
 =?iso-8859-1?Q?qYt9rkbYSh+8eBdEZqlJmgqm6510T4qNZQnKM6VHKu30unKg24gix6Zwjx?=
 =?iso-8859-1?Q?c21wpb9S7rYNyDTZvBoClAdcvr9B/sGNvHjNCQIdLc4+UPikF2smz7zjey?=
 =?iso-8859-1?Q?wcqggnzIcVpx0jYanLPz6WJSxMC1zCM+1FCn15uY81GvOfA2nQFbB5wZru?=
 =?iso-8859-1?Q?NryegbNikRy1glro4ReTsJuRoxOfilhArzhKI5U9Old9Bf7F7zKx9g6W/1?=
 =?iso-8859-1?Q?5Xhh521k66ZxlrPYvuqKjDJEBE0ZT+T4+NDWIIGaCkOjEcJ+2S+Wg6B47l?=
 =?iso-8859-1?Q?UmtfvX+zGR2v2Npjp+XaLSMHZlgR+AwI/dFpfxbk76zidoF+3L7be9/6D2?=
 =?iso-8859-1?Q?gaDlnlhfM9/G423lA7gFysLSRDFmE+WIjsDfjkuxTuKXNTxMO6fA56w9m7?=
 =?iso-8859-1?Q?9k9wJHnYwULd/EIoG79cfaY+I+XHnXcn5jY1E5OcmGz+DsyscTNcJkzkAH?=
 =?iso-8859-1?Q?zBw6RQPO6YdjfIgIXcFfIN+3+Sjej3nD6IGyPwwnAr9Q6R4NKhc4ej8rBY?=
 =?iso-8859-1?Q?KmNXfFxwKHVMZYAPHLMzRKb6Ad5yYhpw0tBW/KRytFnAv8ehlc1Caj4yRg?=
 =?iso-8859-1?Q?Ytu4+PYntxNHptkWtf5j/DQkst/D9qwLxLGELBCbC6G+KVaynq3t7lUEto?=
 =?iso-8859-1?Q?jCwxbPmW9lT8I2BFEuDG/UXDjSAQoiU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f50c92-6743-42d1-e590-08de62762c86
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:42.5831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3yppVIHYBl4L73U/JPqGlIP7DCVJbEmChT6/T+yHaU2EV7nWjzKbHBP44Sl8X7XJrfqXcxAtYmhz31Rf5GFrKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10299
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,kernel.org,xen.org,arm.com,amd.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 78121CED33
X-Rspamd-Action: no action

GICv4 needs to know which VCPU is currently scheduled to be able to
deliver VLPIs. Implement switching of VPEs on VCPU context switch by
extending the existing save/restore mechanism used for GICv2 and GICv3.

Scheduling a VPE is done by setting up the VPENDBASER and VPROPBASER
registers to the appropriate tables for the currently running VCPU. When
scheduling out, preserve the IDAI and PendingLast bits from VPENDBASER.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/gic-v2.c                  |   2 +-
 xen/arch/arm/gic-v3.c                  |   9 +-
 xen/arch/arm/gic-v4-its.c              | 138 +++++++++++++++++++++++++
 xen/arch/arm/gic-vgic.c                |   6 ++
 xen/arch/arm/include/asm/gic.h         |   2 +-
 xen/arch/arm/include/asm/gic_v3_defs.h |   6 ++
 xen/arch/arm/include/asm/gic_v4_its.h  |   9 ++
 xen/arch/arm/include/asm/vgic.h        |   2 +
 8 files changed, 170 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 0cd41eac12..c16fa5d67e 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -181,7 +181,7 @@ static void gicv2_save_state(struct vcpu *v)
     writel_gich(0, GICH_HCR);
 }
=20
-static void gicv2_restore_state(const struct vcpu *v)
+static void gicv2_restore_state(struct vcpu *v)
 {
     int i;
=20
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index d4af332b0e..07736179db 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -133,7 +133,7 @@ bool gic_is_gicv4(void)
 #endif
=20
 /* per-cpu re-distributor base */
-static DEFINE_PER_CPU(void __iomem*, rbase);
+DEFINE_PER_CPU(void __iomem*, rbase);
=20
 #define GICD                   (gicv3.map_dbase)
 #define GICD_RDIST_BASE        (this_cpu(rbase))
@@ -475,13 +475,15 @@ static void gicv3_save_state(struct vcpu *v)
      * are now visible to the system register interface
      */
     dsb(sy);
+    if ( gic_is_gicv4() )
+        vgic_v4_put(v, false);
     gicv3_save_lrs(v);
     save_aprn_regs(&v->arch.gic);
     v->arch.gic.v3.vmcr =3D READ_SYSREG(ICH_VMCR_EL2);
     v->arch.gic.v3.sre_el1 =3D READ_SYSREG(ICC_SRE_EL1);
 }
=20
-static void gicv3_restore_state(const struct vcpu *v)
+static void gicv3_restore_state(struct vcpu *v)
 {
     register_t val;
=20
@@ -510,6 +512,9 @@ static void gicv3_restore_state(const struct vcpu *v)
     restore_aprn_regs(&v->arch.gic);
     gicv3_restore_lrs(v);
=20
+    if ( gic_is_gicv4() )
+        vgic_v4_load(v);
+
     /*
      * Make sure all stores are visible the GIC
      */
diff --git a/xen/arch/arm/gic-v4-its.c b/xen/arch/arm/gic-v4-its.c
index fac3b44a94..6a550a65b2 100644
--- a/xen/arch/arm/gic-v4-its.c
+++ b/xen/arch/arm/gic-v4-its.c
@@ -18,6 +18,7 @@
  * GNU General Public License for more details.
  */
=20
+#include <xen/delay.h>
 #include <xen/errno.h>
 #include <xen/sched.h>
 #include <xen/spinlock.h>
@@ -44,6 +45,21 @@ void __init gicv4_its_vpeid_allocator_init(void)
         panic("Could not allocate VPEID bitmap space\n");
 }
=20
+static void __iomem *gic_data_rdist_vlpi_base(unsigned int cpu)
+{
+    /*
+     * Each Redistributor defines two 64KB frames in the physical address =
map.
+     * In GICv4, there are two additional 64KB frames.
+     * The frames for each Redistributor must be contiguous and must be
+     * ordered as follows:
+     * 1. RD_base
+     * 2. SGI_base
+     * 3. VLPI_base
+     * 4. Reserved
+     */
+    return GICD_RDIST_BASE_CPU(cpu) + SZ_128K;
+}
+
 static int __init its_alloc_vpeid(struct its_vpe *vpe)
 {
     int id;
@@ -571,3 +587,125 @@ int its_send_cmd_vinv(struct host_its *its, struct it=
s_device *dev,
=20
     return gicv3_its_wait_commands(its);
 }
+
+static uint64_t read_vpend_dirty_clean(void __iomem *vlpi_base,
+                                       unsigned int count)
+{
+    uint64_t val;
+    bool clean;
+
+    do {
+        val =3D gits_read_vpendbaser(vlpi_base + GICR_VPENDBASER);
+        /* Poll GICR_VPENDBASER.Dirty until it reads 0. */
+        clean =3D !(val & GICR_VPENDBASER_Dirty);
+        if ( !clean )
+        {
+            count--;
+            cpu_relax();
+            udelay(1);
+        }
+    } while ( !clean && count );
+
+    if ( !clean )
+    {
+        printk(XENLOG_WARNING "ITS virtual pending table not totally parse=
d\n");
+        val |=3D GICR_VPENDBASER_PendingLast;
+    }
+
+    return val;
+}
+
+/*
+ * When a vPE is made resident, the GIC starts parsing the virtual pending
+ * table to deliver pending interrupts. This takes place asynchronously,
+ * and can at times take a long while.
+ */
+static void its_wait_vpt_parse_complete(void __iomem *vlpi_base)
+{
+    if ( !gic_support_vptValidDirty() )
+        return;
+
+    read_vpend_dirty_clean(vlpi_base, 500);
+}
+
+static uint64_t its_clear_vpend_valid(void __iomem *vlpi_base, uint64_t cl=
r,
+                                      uint64_t set)
+{
+    unsigned int count =3D 1000000;    /* 1s! */
+    uint64_t val;
+
+    /*
+     * Clearing the Valid bit informs the Redistributor that a context
+     * switch is taking place.
+     */
+    val =3D gits_read_vpendbaser(vlpi_base + GICR_VPENDBASER);
+    val &=3D ~GICR_VPENDBASER_Valid;
+    val &=3D ~clr;
+    val |=3D set;
+    gits_write_vpendbaser(val, vlpi_base + GICR_VPENDBASER);
+
+    return read_vpend_dirty_clean(vlpi_base, count);
+}
+
+static void its_make_vpe_resident(struct its_vpe *vpe, unsigned int cpu)
+{
+    void __iomem *vlpi_base =3D gic_data_rdist_vlpi_base(cpu);
+    uint64_t val;
+
+    /* Switch in this VM's virtual property table. */
+    val  =3D virt_to_maddr(vpe->its_vm->vproptable) & GENMASK(51, 12);
+    val |=3D gicv3_its_get_cacheability() << GICR_VPROPBASER_INNER_CACHEAB=
ILITY_SHIFT;
+    val |=3D gicv3_its_get_shareability() << GICR_VPROPBASER_SHAREABILITY_=
SHIFT;
+    val |=3D GIC_BASER_CACHE_SameAsInner << GICR_VPROPBASER_OUTER_CACHEABI=
LITY_SHIFT;
+    val |=3D (HOST_LPIS_NRBITS - 1) & GICR_VPROPBASER_IDBITS_MASK;
+    gits_write_vpropbaser(val, vlpi_base + GICR_VPROPBASER);
+
+    /* Switch in this VCPU's VPT. */
+    val  =3D virt_to_maddr(vpe->vpendtable) & GENMASK(51, 16);
+    val |=3D gicv3_its_get_cacheability() << GICR_VPENDBASER_INNER_CACHEAB=
ILITY_SHIFT;
+    val |=3D gicv3_its_get_shareability() << GICR_VPENDBASER_SHAREABILITY_=
SHIFT;
+    val |=3D GIC_BASER_CACHE_SameAsInner << GICR_VPENDBASER_OUTER_CACHEABI=
LITY_SHIFT;
+    /*
+     * When the GICR_VPENDBASER.Valid bit is written from 0 to 1,
+     * this bit is RES1.
+     */
+    val |=3D GICR_VPENDBASER_PendingLast;
+    val |=3D vpe->idai ? GICR_VPENDBASER_IDAI : 0;
+    val |=3D GICR_VPENDBASER_Valid;
+    gits_write_vpendbaser(val, vlpi_base + GICR_VPENDBASER);
+
+    its_wait_vpt_parse_complete(vlpi_base);
+}
+
+static void its_make_vpe_non_resident(struct its_vpe *vpe, unsigned int cp=
u)
+{
+    void __iomem *vlpi_base =3D gic_data_rdist_vlpi_base(cpu);
+    uint64_t val;
+
+    val =3D its_clear_vpend_valid(vlpi_base, 0, 0);
+    vpe->idai =3D val & GICR_VPENDBASER_IDAI;
+    vpe->pending_last =3D val & GICR_VPENDBASER_PendingLast;
+}
+
+void vgic_v4_load(struct vcpu *vcpu)
+{
+    struct its_vpe *vpe =3D vcpu->arch.vgic.its_vpe;
+
+
+    if ( vpe->resident )
+        return;
+
+    its_make_vpe_resident(vpe, vcpu->processor);
+    vpe->resident =3D true;
+}
+
+void vgic_v4_put(struct vcpu *vcpu, bool need_db)
+{
+    struct its_vpe *vpe =3D vcpu->arch.vgic.its_vpe;
+
+    if ( !vpe->resident )
+        return;
+
+    its_make_vpe_non_resident(vpe, vcpu->processor);
+    vpe->resident =3D false;
+}
diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index ea48c5375a..44db142dbd 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -377,6 +377,12 @@ int vgic_vcpu_pending_irq(struct vcpu *v)
         }
     }
=20
+#ifdef CONFIG_GICV4
+    if ( gic_is_gicv4() )
+        if ( v->arch.vgic.its_vpe->pending_last )
+            rc =3D 1;
+#endif
+
 out:
     spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
     return rc;
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index afb1cc3751..04a20bdca5 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -362,7 +362,7 @@ struct gic_hw_operations {
     /* Save GIC registers */
     void (*save_state)(struct vcpu *v);
     /* Restore GIC registers */
-    void (*restore_state)(const struct vcpu *v);
+    void (*restore_state)(struct vcpu *v);
     /* Dump GIC LR register information */
     void (*dump_state)(const struct vcpu *v);
=20
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 3a7d18ef59..0db75309cf 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -257,6 +257,12 @@ struct rdist_region {
     bool single_rdist;
 };
=20
+/* per-cpu re-distributor base */
+DECLARE_PER_CPU(void __iomem*, rbase);
+
+#define GICD_RDIST_BASE             (this_cpu(rbase))
+#define GICD_RDIST_BASE_CPU(cpu)    (per_cpu(rbase, cpu))
+
 #endif /* __ASM_ARM_GIC_V3_DEFS_H__ */
=20
 /*
diff --git a/xen/arch/arm/include/asm/gic_v4_its.h b/xen/arch/arm/include/a=
sm/gic_v4_its.h
index ba81b25bde..37b6b92f0c 100644
--- a/xen/arch/arm/include/asm/gic_v4_its.h
+++ b/xen/arch/arm/include/asm/gic_v4_its.h
@@ -56,6 +56,15 @@ void gicv4_its_vpeid_allocator_init(void);
 #define GICR_VPROPBASER                              0x0070
 #define GICR_VPENDBASER                              0x0078
=20
+#define GICR_VPROPBASER_OUTER_CACHEABILITY_SHIFT         56
+#define GICR_VPROPBASER_SHAREABILITY_SHIFT               10
+#define GICR_VPROPBASER_SHAREABILITY_MASK                \
+        (3UL << GICR_VPROPBASER_SHAREABILITY_SHIFT)
+#define GICR_VPROPBASER_INNER_CACHEABILITY_SHIFT          7
+#define GICR_VPROPBASER_INNER_CACHEABILITY_MASK           \
+        (7UL << GICR_VPROPBASER_INNER_CACHEABILITY_SHIFT)
+#define GICR_VPROPBASER_IDBITS_MASK                    0x1f
+
 #define GICR_VPENDBASER_Dirty                   (1UL << 60)
 #define GICR_VPENDBASER_PendingLast             (1UL << 61)
 #define GICR_VPENDBASER_IDAI                    (1UL << 62)
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 580310fec4..9ef667decb 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -417,6 +417,8 @@ bool gic_is_gicv4(void);
 int vgic_v4_its_vm_init(struct domain *d);
 void vgic_v4_free_its_vm(struct domain *d);
 int vgic_v4_its_vpe_init(struct vcpu *vcpu);
+void vgic_v4_load(struct vcpu *vcpu);
+void vgic_v4_put(struct vcpu *vcpu, bool need_db);
 #endif /* !CONFIG_NEW_VGIC */
=20
 /*** Common VGIC functions used by Xen arch code ****/
--=20
2.51.2

