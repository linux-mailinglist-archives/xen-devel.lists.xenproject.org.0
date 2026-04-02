Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH1AH/eQzmkbogYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 17:53:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B89E738B809
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 17:53:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272143.1559998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8KLI-0003R0-SE; Thu, 02 Apr 2026 15:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272143.1559998; Thu, 02 Apr 2026 15:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8KLI-0003OP-Oy; Thu, 02 Apr 2026 15:52:24 +0000
Received: by outflank-mailman (input) for mailman id 1272143;
 Thu, 02 Apr 2026 15:52:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1w8KLH-0003O3-3E
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 15:52:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8KLE-005maE-Sk
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 17:52:22 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ce90a5-bab6-0a2a0a5309dd-0a2a4504e2ac-24
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 17:52:22 +0200
Received: from [52.101.84.86]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ce90b5-bb33-0a2a45040019-346554562de3-4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 17:52:22 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by FRZPR03MB11711.eurprd03.prod.outlook.com
 (2603:10a6:d10:1c9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 15:52:20 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 15:52:20 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xc0cNF1uBD55s83KHL26RXwXJJ8T0KuQ1D0MFM2dnB/JXgILtMI/cwN6xfbo1X93P/I4zq7GIo6qSlUAy1EKTB1IoW/MrRHxlC4pfV3VAt8ODPS9PcZ9NVJ/mMD6Fz7I+27zlBE0Ioee67VRCdnYm2cL2bqr06kyMcPGHTnx6L17PiTQpJZDIpYR1c37FS2LRbJ28CVw7yQawBK4OOgEGJa4DJSvXSm3kWNCY3bN+HDJHckQ6J3ROjqniI+USonw58DHWROUbQ4Vdmd9FQXJfwIBmY9SqTvKGvAiu2c7+3JLXRjS4tsKoskgtmRp2hTu1tDzzYP7GFRL1Ecx3HM5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaeQ8h1iJNhyinlJBVQjg89/c/eTss9GxwDuxdgoFJA=;
 b=Pq0YMEZjvkdgUaHAG5os+uU/GQvv/WbdEFeSg0mrmP2UdG3D9l4lyaGkH+JKHFfM+xyxTPSmEBZCK218gxCAcOtDozLoc4bp3rIvwHY0TspgcYrPQ7LR2ptKe1Z52J0X3G7bk9iVBR8dRwy5Mul/JKBOFJ8vH98fZm9AcUhFOlTcHEXi7uBzDuwCyM8vu/TtDug0Jw8ecxqlF7HVuG4/zkll870RTvwd56xyYY+RP38Bx8cTx+RJStAcpplCQ9g3xNlt8g0IgcXxpp+gtI9WCDv3m82DaZsd9yWl6p79iasb1eYFjXPfwZ3CnwUr8DTctQ0tNaS+uoHLeHCcmKwoHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaeQ8h1iJNhyinlJBVQjg89/c/eTss9GxwDuxdgoFJA=;
 b=RlMmMV406ZGgLVgHhS+6UPiZoAZ7i1q6DMjIB9DJgGxGaFeKLSWQIzFa0DeoiOVuamks4u4tOzvZ4Hyirt/M7L0urAAAMpCua59OvL0gOHg65kqUjwPU4m4ytScdWg0bwJTAAfunewUZ0Kmdk8ZY59+gX9F1nv1U6pLtmDf+PZXxu3q4ASlwAdCWjhxrtMNAEA/6qHohVSmYgp0RnwtC6OxDLbNfnZs6UXaM+ik0pmWXBSaBvDMITxBOErzAYyPD7lx5AdewEKko+cQahcytj9gKilFIP71yPSVVh8kMEygulU+N4u8qM0FdrKJ/dJqZgKJ3Ps2gAfQxGS6Dl0NEqw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 2/4] vpci: allow queueing of mapping operations
Thread-Topic: [PATCH v3 2/4] vpci: allow queueing of mapping operations
Thread-Index: AQHcuzsjSQhCcIF69U+TfmTRWDgaEbXL+uoA
Date: Thu, 2 Apr 2026 15:52:20 +0000
Message-ID: <d792d3dc-a99c-4dc6-a3d0-13b9c2762299@epam.com>
References: <20260324030513.700217-1-stewart.hildebrand@amd.com>
 <20260324030513.700217-3-stewart.hildebrand@amd.com>
In-Reply-To: <20260324030513.700217-3-stewart.hildebrand@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|FRZPR03MB11711:EE_
x-ms-office365-filtering-correlation-id: e349892b-de38-4a18-3687-08de90cfd305
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 TLVpAp2HWBKjf1BttJu+UJ40j2w6wjMX/nydH/yw68tkn43TJHzfnxT2Vr/uGFbKKnzsXlpSIpHeMRRimKmzO8GQ7RL5+S13wBSOMHm81Mepthq/PZp3W0GoxYcjWI7OLYBYYJ+ESwvnKHAKG/svugQ7acJnNFhluh/U0cayKr12zvGo3JcJsLkl8MsTRmP3TRUso3o4GIJ4Rfx4kGdHzgHmmOX/7s8pKRIZT40SAF5cZpv6cxWbxsRis6ptf+M34IqXVkPr4kSrcwy8tb8uVknE87M66auReoPF7/W5BfQkq8EBbzwHPdZuUoDT6F0jzyDQnNN28ctt4d1c3R6svvOKvmA8PmdlbrVhGIJokj1UO4xzd671dMvCRz8hsf/uUq+diLAxLFNpVBfBL97Y/ojowVOyfQSXSCYpKg+2uQ4GMwIYbZAd9CtktZQEDhApqa4WORlU9wquVtUWZqu4IYIC0YETS3X8FkgXjUfW2LADc7qyn5wUElE7ZMsFwhevNpv0exrQT1vipB6YmWWoSd3dGS/Q1GlUVSuv+8v1JM3horo3i6Fd9mrnm+ng8/g3D8GGA4EPbFfCVievyN+RnKQKHPdw8by2v2hzbxBLxpnXNTKmNGUqdYhGv03C5iT/F21l+V8fhI6LZvZF0wmRHGXdi5yGbF7+sirP/oPmzZLUgVEaibM7tJ1BDuMSnJH9l0EUvex1tC5p1CN5DP7tLD/bcl/vkAS8st6+IXxTN4i7gYcVWOlPh5z+WnSWuVuz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z2E5VjlJaUZnaWlRc3Q4R0lGb29MZDl1SDJheE1wSUV3RUhVYVpOWTJscTNo?=
 =?utf-8?B?dDNBVFkvMGNycExDLzNjNlQ3SlVUZDFiMVBJUVc5d1lwOThVV0Y1NDJwR1Ns?=
 =?utf-8?B?cXRLbkpkUWVvdGhVU21MUDBkSnV5RGpjbU5pU1RVRldtQks4YXlXVlZPb1Ft?=
 =?utf-8?B?akQxZ2Q4U0VmcUdFVHhrRkVqZUVZdjl6QnM0T0s2dTRuZk1OVVRrZldTZlow?=
 =?utf-8?B?MDQvR0pGanVtclNwSkpQd2VZQzk5OER0cFVmMlVQMUVFOExhb0FpNUJ6Vzg4?=
 =?utf-8?B?Wlk3QVhDTmxGTU92RDZtTm83RU5MMHFvcHZJVDhRdWcyNTJCTGRsdlJyVitO?=
 =?utf-8?B?ZWExbldWYXYyMk0wOTJIR2hoZjNTdnpQdWd5OFVBT3NLT2pOOXp5MzlBTGlq?=
 =?utf-8?B?U2JwVDBlWnpUaUNIV0tjc25ITnZlRjhEVWYzTkxKNUNDZlN3YlRiL2k3cUhF?=
 =?utf-8?B?R2NQWGZ4K2VSdXRWTkxBakJDRm5IaXY0MkNjdUtBYmF6a0J5MFFyK2tOMDBa?=
 =?utf-8?B?NjlOK1g4QU9FaTIrZjhtdXViK2NTQktSc2EwN2NFZWEwTlFYa212S3FUOUZq?=
 =?utf-8?B?Q0FZUG9iN3JEWTRaYlNtODVreHYwZit5Nk9CdGoxWmpXQ21yQWJHNFRLSnJS?=
 =?utf-8?B?d1FQeGRIMGRZQU1jOGQ0MDlEWXBsUU10WG9icE4veHo4OExLT2swNTZrOEVz?=
 =?utf-8?B?SHROdVBtWktaVFNwY285NXFjS2NiSVYwSjBZbnNvTllPTS9oOXJyaTljMHVj?=
 =?utf-8?B?Uy9ZQmIrcTAwejBVa1hkZDRGT3Z0RVRIQUh5NFdQWVhJUDZjbSsvcHNOeFVr?=
 =?utf-8?B?eWdGWWtKNHlvTFBJNUl4RzlPRVdWK1owUHp5dFZHRXpkeVhHbTY5Q1pVUDM2?=
 =?utf-8?B?SlRkYjdJUk9Qa0tTNHlrVzluQmY2RmpSVTR6NS9MZUpSczVkZjV4bVhWSEZR?=
 =?utf-8?B?UXlwampYd2twL0ZVUktLYUNXc3ZvaEppNlh6OG8rRlJJSkk2b3JXTGJxaE4v?=
 =?utf-8?B?WGRReWhUaGFGZE9CM21UZmYwZGtQZ1MwTGtHNVBpTkVjc1BZdXFBb1ZJQjNZ?=
 =?utf-8?B?SXB1S1hVM0swZXZvN3M4YWVlN3dpL0tJeUVtY3hOTG80YzgvaEwzUm4wbzd0?=
 =?utf-8?B?NllNWlQxUjBINm5NYmJlNEh0RUlmeVNsZ3V4Yk0zZEdJVGpLZSs0YXcvRHdv?=
 =?utf-8?B?cFFnMmhCa3djRCtmUkdkWHMySkJTbmtoZzJ6WitpYWxGdERYSFBqSW5HZWlG?=
 =?utf-8?B?dXFLUkI3SDhuY2FqOXR2eWZKVWJEdmVhVDVJeUFLaHFLME5Day9rY2g5cGF2?=
 =?utf-8?B?TGVOZG51aWNRUXFDTE9iRlRkb2hUWFBZSnB5Y2tOL3NYVHlGSi9nUk9NYWJu?=
 =?utf-8?B?Z0FNRm80MFZ2OUcxRUhlWitsSHBGL1RuS1NHZTVMb3Y2RnlNSWxyVlhtTTY5?=
 =?utf-8?B?ekp4WDJuREh6TmlWT2tlNERPZFdoQTRIc3dkRHI3ZGJEdkJOMjZ3Sm83eDA0?=
 =?utf-8?B?MFhsbS9hRTJSTlJOWUlLdk9IK2MxR0FwdWR5dVUralh0amk3OHZBTFpaa05C?=
 =?utf-8?B?NmRyUVFYWW9SQWRQTURXYnJqa0dGdVRrMkFtWVR1Zkw3RDlQclo2SERGblB6?=
 =?utf-8?B?NlMwQm5jOVNJRGxFZTFERWRYam83UUN5SVBPdFl4b3ZBMFNoa1NUeEhLUEZ3?=
 =?utf-8?B?Mk0rL3hWQnpoUmJYSjI1VnNmNzUwTnQ0bitscTFFUnBrbUR2azE1N2UwQUE1?=
 =?utf-8?B?dFRub1RhRi9nVndBRWk4d2xZbEtlMEdrbk1uOUoxV3hLQU1UTVFORFpuYVUx?=
 =?utf-8?B?TGpHSUJ3S3d5T1E3TXJJeGdjVGh0SVU0aVIxUnV0bExGL0xGYm5ITEk0emlT?=
 =?utf-8?B?NDA0RXJxTitacjRNNkZ1aWlmclBtTkIvQ2hoSkN1emFENUQ1VVREek1aN2dJ?=
 =?utf-8?B?OHludXlna2hDTnFpUldaVnJMRTg4NENPSUtIbUVQTUFyRXZHZVQwMlRkdENj?=
 =?utf-8?B?VkJTNzZIbnRZa3JaTXloU3lpOUhlWHo1S09TT0twWFlCeFBGRUt5clVWMk5a?=
 =?utf-8?B?LzNKbTlPVEZ2K3ZuVWpYZGNsV2hNUzFTd1dwT1YvRjkvQ1luK3B2VDdmOW02?=
 =?utf-8?B?N1pnbmUwVXgxYzJjRCtxTjNRd2xWMS9DdVdFV05CTXdHMisvTFJaTEJqM212?=
 =?utf-8?B?Q1oxNWdxV2lNejl3RGZ5RlIxTE56SDJnNUIvdDltNTZUb3RIMXdSK1g0ZWdD?=
 =?utf-8?B?SmxUK0RFK1hwZktheW84aTlnRitLL1JiYzdiakl6QWFoV0FFQnNqL2lYSkNE?=
 =?utf-8?B?WXMvdDIvYjRrR3RvbnlMcTVOUUFmNkxMcnlZTlltZGswajlkNXlSaEVRSWxj?=
 =?utf-8?Q?TQSfBfmv2cRxDSRo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E08560B0CDA42B4686C4BDB721795C6F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e349892b-de38-4a18-3687-08de90cfd305
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 15:52:20.5634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 26EHGJk3o4gBggpX+4d3OtgjDnZCMo44PhsXGvDuvzK1hh8/8fSPalxHjoImOy+IjIMqU3u/z/Du3uynjujQ2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR03MB11711
X-purgate-ID: tlsNG-ebf023/1775145142-32F3E51B-77C6B6CB/0/0
X-purgate-type: clean
X-purgate-size: 2058
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B89E738B809
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8yNC8yNiAwNTowNCwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOg0KPiBJbnRyb2R1Y2Ug
dlBDSSBCQVIgbWFwcGluZyB0YXNrIHF1ZXVlLiBTdG9yZSBpbmZvcm1hdGlvbiBuZWNlc3Nhcnkg
aW4gYW4NCj4gYXJyYXkgaW4gc3RydWN0IHZwY2lfdmNwdSB0byBwZXJmb3JtIG11bHRpcGxlIHAy
bSBvcGVyYXRpb25zIGFzc29jaWF0ZWQNCj4gd2l0aCBzaW5nbGUgZGV2aWNlLg0KPiANCj4gVGhp
cyBpcyBwcmVwYXJhdG9yeSB3b3JrIGZvciBmdXJ0aGVyIGNoYW5nZXMgdGhhdCBuZWVkIHRvIHBl
cmZvcm0NCj4gbXVsdGlwbGUgdW5tYXAvbWFwIG9wZXJhdGlvbnMgYmVmb3JlIHJldHVybmluZyB0
byBndWVzdC4NCj4gDQo+IEF0IHRoZSBtb21lbnQsIG9ubHkgYSBzaW5nbGUgc2xvdCBpcyBuZWVk
ZWQgaW4gdGhlIGFycmF5LiBIb3dldmVyLCB3aGVuDQo+IG11bHRpcGxlIG9wZXJhdGlvbnMgYXJl
IHF1ZXVlZCBhbmQgcGVuZGluZywgdGhlcmUgaXMgYSBjaGVjayBpbg0KPiBtb2RpZnlfYmFycygp
IHRvIHNraXAgQkFScyBhbHJlYWR5IGluIHRoZSByZXF1ZXN0ZWQgc3RhdGUgdGhhdCBpcyBub3QN
Cj4gYWNjdXJhdGUuIFJlbW92ZSB0aGlzIGNoZWNrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3Rl
d2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbT4NCj4gLS0tDQo+IGFw
cGx5X21hcCgpIGFuZCB2cGNpX3Byb2Nlc3NfbWFwX3Rhc2soKSBhcmUgdmVyeSBzaW1pbGFyLiBT
aG91bGQgd2UgdHJ5DQo+IHRvIGNvbWJpbmUgdGhlbSBpbnRvIGEgc2luZ2xlIGZ1bmN0aW9uPw0K
PiANCj4gdjItPnYzOg0KPiAqIGJhc2Ugb24gKCJ2cGNpOiBVc2UgcGVydmNwdSByYW5nZXMgZm9y
IEJBUiBtYXBwaW5nIikgZnJvbSBbMV0NCj4gKiByZXdvcmsgd2l0aCBmaXhlZCBhcnJheSBvZiBt
YXAvdW5tYXAgc2xvdHMNCj4gDQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2
ZWwvY292ZXIuMTc3MjgwNjAzNi5naXQubXlreXRhX3BvdHVyYWlAZXBhbS5jb20vVC8jdA0KPiAN
Cj4gdjEtPnYyOg0KPiAqIG5ldyBwYXRjaA0KDQpIaSBldmVyeW9uZSwNCg0KDQpXb3VsZCBpdCBi
ZSBwb3NzaWJsZSB0byBtb3ZlIGJhY2sgdG8gYSBkeW5hbWljYWxseSBhbGxvY2F0ZWQgbnVtYmVy
IG9mIA0KdGFza3M/IFRoaXMgd291bGQgaGVscCB3aXRoIG1hcHBpbmcgU1ItSU9WIHZpcnR1YWwg
ZnVuY3Rpb25zIGEgbG90LiANCkBTdGV3YXJ0IEBSb2dlciwgd2hhdCBhcmUgeW91ciB0aG91Z2h0
cz8NCg0KQWx0ZXJuYXRpdmVseSwgSSBjYW4gY29udGludWUgd2l0aCBhbiBhcHByb2FjaCBkZXNj
cmliZWQgaW4gU1ItSU9WIA0Kc2VyaWVzLCB3aGVyZSBWRnMgYXJlIGhhbmRsZWQgc2VwYXJhdGVs
eS4gSSBmaWd1cmVkIG91dCBob3cgdG8gcmV0dXJuIHRvIA0KZG9fc29mdGlycSBhZnRlciBtYXBw
aW5nIGVhY2ggVkYsIHNvIGl0IHNob3VsZCBub3QgYmxvY2sgdGhlIENQVSBmb3IgdG9vIA0KbG9u
Zy4NCg0KDQotLSANCk15a3l0YQ==

