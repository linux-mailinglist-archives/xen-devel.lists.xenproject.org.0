Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCrfGtNlymll8gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:00:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D45DB35AB7F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267454.1556976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BHi-0001DT-8F; Mon, 30 Mar 2026 11:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267454.1556976; Mon, 30 Mar 2026 11:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BHi-00013v-44; Mon, 30 Mar 2026 11:59:58 +0000
Received: by outflank-mailman (input) for mailman id 1267454;
 Mon, 30 Mar 2026 11:59:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1w7BHg-0000WF-25
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 11:59:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7BHf-00CdRq-Db
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:59:55 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ca65af-bab6-0a2a0a5309dd-0a2a4503af12-48
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:59:55 +0200
Received: from [52.101.70.120]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ca65ba-1947-0a2a45030019-346546784220-6
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:59:55 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB8639.eurprd03.prod.outlook.com
 (2603:10a6:150:95::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:59:53 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 11:59:52 +0000
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
 b=IduI0HwK2pki22wBNIS+VQjP1Z5r5ldzHiSj11SSZHJG+kn7ZMGuVOEAIaEEoNmG9VpOsbJLkgC4rnBP5u04xekKflE4xhnwg86TZw2QhyKIEaIESWfaBhbk/5YFIJrd695bUpuN1vNDk95+2eSleJP3hozryMAoQO8OqgC0FfemiHcm09FErdA89Jb+xJM8MSLvGZAdZvXpVLDdZp83kbn2Z3zIA99yzMVo9+4C9tb/XMuBkIgFeZsOUfLTeiwazF+FYGXgCRoexSPem4iIR4E2ggF4uGmn4rE6onkUsEDooYOyUBOpsJqa6uMRCaKd58dnaX+1dTFsTAim1oDHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTCqvktoss0PlPaY9Z2E3mkzRUXnUI9T8SLc0HonleM=;
 b=WwQ/xLjfRLzJk5wHFZjvJrt3WuiRIS7hxEk7n7JkcZo5onmA5NUc+Zf/W5xj6fuOxRMbHVRz0PYDD2X0gBOFskd8av9JSk/1Utch0H37taXBNKeTnhzfNWH0u1aoBGoLqE7/3Jl19KcbxPrfKkOwNDHz9Lv2ww1OSGTt+EOd/pGA8/5Tq0lio9eVK08wdV8wboNLHOR6ESHZfCcQvIRDHnUoWYHxZXX12SXJWE1uRR8vUghHpHVWN/ThdWoNqWZkmlo91rOwhZkQUXVQemo5BbAT3dSSvo7IHujSGytg86c9F6fzAkxi9LSxU6kSKD0NdBKLeLgWxpzfxqnMxgIeag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTCqvktoss0PlPaY9Z2E3mkzRUXnUI9T8SLc0HonleM=;
 b=EpJOszXCnW5wHcID3ovYaGEpmMmxySUKTw8HYs100OAddwOm0vVs93pGqG+3Qe0omFcPD+gJS/kko1jOpmNWWnyXxM4Gcva53BVc16Xr4wwJ3MU9MhyxqzrfDfHzmJ25/IzuLjhJuIT/OWavslNCYkEjBJn97Xkv49489sRWI0ZnQCwQDVYR6hgR0yvZsI7j9SGJG+hAdGXThNVBhe0xKcfYkO5lNghkC1i/03CSde4e35237b6xb743oc/NzCfaNtg4RcZfWqiY2OQFFhTTPvkTTKwt8eO9MCBTXq5dPUzAg9es27yX+RRi5Wwv2pqZ+VCST1XdvocXSzTJffgwxA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 6/6] docs: Document CPU hotplug
Thread-Topic: [PATCH v7 6/6] docs: Document CPU hotplug
Thread-Index: AQHcwDy33hgEL/FPskqSHUwGNRQgfg==
Date: Mon, 30 Mar 2026 11:59:52 +0000
Message-ID:
 <97ad7b68c5e42fc396b155ef1d0a69a738b28881.1774871881.git.mykyta_poturai@epam.com>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1774871881.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB8639:EE_
x-ms-office365-filtering-correlation-id: 7d63fa7e-606f-4695-e969-08de8e53da48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 kGA23be0nnST3cqucJHVH9+CsH8s3Kx2o/JTDj7//F3QmkDRIunkIeZPL5HbrexhOAat0hk5kxLfYX0u594ckUtIBIiZjMApQnNWYKrWQ+W89bkXBggOZDUTZfN6GAvb2WZ6qvf/vz04shQQDtX9naLsMdXQcN1dlKTR9Utbk3QX5PwRRI5/TLDuiR/Tsn/QHsYRMyuLGjuzKh6qDoR3OeMbsN3lH7vVaR+tx6GMgjj4AB28dVjC0h9r83pEh/5lGP/DevaKX2mWtokkpPGQwRibAAMGuRgQRiOMB2Iz0cCw8L5JmetJfSATbBm1VTLQonvjFmvKx+bgyEViJNh2YnqQkuKdYgefnjndEqZIeFxCgCZ4Sx1qdEJqkAWI6nYnGMLAe7zAebWEhz5QaxbRr1bAJgBQte/1V9x5aPKHEvbA/JEvk62eU2M0kbxjYzyQWkHIeh0MeDOWegqAowkptVqXrrYxemsTfjaMWHv2hZs2rnrjYoBQh6Nf0L8SBlBzj4Z+Ce3igbLHsXQPhfa9KSpkuhusXxhnOGirCzp0j9nHh9XPEKFCQbokqM2gRmLTlQbWxVWYubgueGtAgtKrj0lSKbfNQu+tde+7Pr1HbTIpJvNNZe9yy6g1O5VT60bWOM5ycvNjXA9CKj7Q3jUHLyyrOHavBQYjN05khKdMZDpsU3iFcDgmZ/IPyQcA4Xz7uC1xJj/vnJH6uQQbtU4on/fpPLHLt56fYqF+tbX1mXe2WSPkjJ4yq6tOYpZCLcDvF0db/mzkWELuxwrJsBsNpcaKhzFvbOLs2C5fQVhohpw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?puMQJfbNdBBnX3hfCITSYda1IQsahj4yh+wZS4fGJcg0Tza+bZdHQ9Q0ka?=
 =?iso-8859-1?Q?3HRgorx6XJBhR/A/CEhZC3Nvd4LIaW7RoysVHp5qXBalPG5Vn553PsI4a0?=
 =?iso-8859-1?Q?7tzNWNe60ZqNJc5XelpI483ULyl/SgVbYRdk4IFyY3vLq6sM0HSdkeo9uv?=
 =?iso-8859-1?Q?v2dq1JZCiL6vXcBLOXcqT1QWaUeXx7PKczOlbzBXMV7/C0MDoW5mQpSri/?=
 =?iso-8859-1?Q?f9hQ1XVBjSas1ahz/K8kuVoUJzHMkxtKZ731hK8Nc/nw+S8T5a0fr+NcW5?=
 =?iso-8859-1?Q?eygKlE+cm8U2gueAq9UiKRzpfLLNJ2at+Ll0BXg7ssR912P8OHwE37GyPh?=
 =?iso-8859-1?Q?AMiy2yI1CTDVwY+TnKaD5au5dFAZZhvYL7IQ+pMPUsxnsTYKSYnMJtUksR?=
 =?iso-8859-1?Q?Mkb4KLybcxNJ5Zban5slfIr6qqXopuGGsNUomhORpifom/MzP7AhohBtiy?=
 =?iso-8859-1?Q?Kd312nvrbsMRnQxvfQGtsXNUuYMSY5SFw7qo04FVwzU+ErmumWyvZZwJIZ?=
 =?iso-8859-1?Q?JrtW/0OonpAao5J2HWYbjuPE9sSflJTkhgxXIiENVsvUDVYZI3eIA/JnPB?=
 =?iso-8859-1?Q?jy2iKExtyYE7+g9imXvJrnsngDVYBQnw2NWL0ya8apwcFZrDjqntCCyS3e?=
 =?iso-8859-1?Q?nUgLJHJJpjIBT4/y7MJZ+bs9AUGppvj29zGXuBFCZ6fpL7JKXY9sgxVifT?=
 =?iso-8859-1?Q?osWgYuInrCi+a8GkVXNdkMXgrR04Ymp3sAgvOdoyl37kPujpsQvJnpb6C1?=
 =?iso-8859-1?Q?kZEMC9fxVEigDgyKX94aJ1k+NA30lXpir6XLnVCGNRUFlLurgJjcU4Itk9?=
 =?iso-8859-1?Q?1WHPwSHBwCZncis8Lloc3MF+ZCRWOZGlloW3Maq9XL0yNZITuD2nhD/eLC?=
 =?iso-8859-1?Q?gkPympF4/Ow4tXbr1ReUTffuMI1yDuNUgEkMK+XbgB6pnISOBuZa66krTM?=
 =?iso-8859-1?Q?dd1rhVoLjMFloS9I36Vyi7KiNsNadhhQz4AUD+L9lVOxjUgk8AJw2yrPlo?=
 =?iso-8859-1?Q?Ky+SMyPQ+At53HJ0VvoEdBThi/byYsYeQ4OM8ChpCkIAvPgZbYTYbxkUM9?=
 =?iso-8859-1?Q?8tb4AsV9t+x8wljjZVTMLClldSUncXF0n66ADVDcyOY06hXYZPsKN3ONLS?=
 =?iso-8859-1?Q?h5/QWTO+SWimFv+uLtWU13rZk2/RWAx3ILNt5TEoTSy/YHAYTC3BrxuiSO?=
 =?iso-8859-1?Q?mhhydemWXfq61o4yDpZ7g7jQ4CwIPz3icVRjzlgifiL4sDWCdFABg1HcuQ?=
 =?iso-8859-1?Q?IwJPsEepDsgCGX/VrX94KQEz+PZ9C7knyOEle1Hlr7cRVKWf9ZpDfBUcHl?=
 =?iso-8859-1?Q?fc654XEojVAGkXCm3o7VJZeLPQ0+OUz394uHhKETXv3vW1Yqnj5v8LaIdD?=
 =?iso-8859-1?Q?jE6oZuD5yp++I69YohyjSDYAHmeom2lbyHuPL18MypDpArbqtXI13qhzJ5?=
 =?iso-8859-1?Q?tr2s1j/3JS0P070fV+Ai331tDhBpfYDidy6F7omIDIk9gNxprkRs0jI2bz?=
 =?iso-8859-1?Q?T5pXSmLy/OAmMqMIkzIEmRzuKtWok7zoqR85wWmNxZyOG1ZEWQLQ1wXLfu?=
 =?iso-8859-1?Q?4vI3keqlpDyUSOOnEO1WU99kG+wCmZWM6AtjVZLVPw4JAQGQApukn2tpc/?=
 =?iso-8859-1?Q?r7S4B9wZvs+nDC90ghZTxyn2dA/7UMbLJi86cNDgLGiEdcnXiSiiWcM9SF?=
 =?iso-8859-1?Q?Y12rj8IN/s8ao6uCZtPzTLCZx0F2YduGqC6HTDxK04KHqEf3bQw7MV6xbb?=
 =?iso-8859-1?Q?UrEmvksDQ94gmRz1A6YJxcM3dxQaA4wuIZQM/lM+xBPcDXp0r1VjWwTZLV?=
 =?iso-8859-1?Q?A+sAirtv4YgHmo8jY3AV0yhF3izfwRQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d63fa7e-606f-4695-e969-08de8e53da48
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 11:59:52.5644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LaJ5pDIxn4vYEks2N7zU6DRGieQYx2Gm2DNdgbH8wwjEzRoxMuiwuVwB37YfRl7aeq1rkmDHlJ7gFhxpRgGhKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8639
X-purgate-ID: tlsNG-33051d/1774871995-4866F72C-2CA92510/0/0
X-purgate-type: clean
X-purgate-size: 4305
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,support.md:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D45DB35AB7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v6->v7:
* add testing and limitations

v5->v6:
* no changes

v4->v5:
* s/supported/implemented/
* update SUPPORT.md

v3->v4:
* update configuration section

v2->v3:
* patch introduced
---
 SUPPORT.md                |  1 +
 docs/misc/cpu-hotplug.txt | 97 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 docs/misc/cpu-hotplug.txt

diff --git a/SUPPORT.md b/SUPPORT.md
index d441bccf37..7b93ae69e7 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -52,6 +52,7 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
 ### ACPI CPU Hotplug
=20
     Status, x86: Experimental
+    Status, Arm64: Experimental
=20
 ### Physical Memory
=20
diff --git a/docs/misc/cpu-hotplug.txt b/docs/misc/cpu-hotplug.txt
new file mode 100644
index 0000000000..09a2855873
--- /dev/null
+++ b/docs/misc/cpu-hotplug.txt
@@ -0,0 +1,97 @@
+CPU Hotplug
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+CPU hotplug is a feature that allows pCPU cores to be added to or removed =
from a
+running system without requiring a reboot. It is implemented on x86 and Ar=
m64
+architectures.
+
+Implementation Details
+----------------------
+
+CPU hotplug is implemented through the `XEN_SYSCTL_CPU_HOTPLUG_*` sysctl c=
alls.
+The specific calls are:
+
+- `XEN_SYSCTL_CPU_HOTPLUG_ONLINE`: Brings a pCPU online
+- `XEN_SYSCTL_CPU_HOTPLUG_OFFLINE`: Takes a pCPU offline
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE`: Enables SMT threads (x86 only)
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE`: Disables SMT threads (x86 only)
+
+All cores can be disabled, assuming hardware support, except for the boot =
core.
+Sysctl calls are routed to the boot core before doing any actual up/down
+operations on other cores.
+
+If there are Xen-bound interrupts pinned to the pCPU being offlined, they =
will
+be automatically migrated to other online pCPUs. Interrupts used by guest
+domains are handled by the scheduler when it reschedules the vCPUs to a ne=
w,
+online, pCPU. When a pCPU is being onlined, some Xen-bound interrupts will=
 get
+redistributed to the newly onlined pCPU to prevent imbalance.
+
+If pCPU being offlined has some vCPUs pinned to it, they will be automatic=
ally
+unpinned and migrated to other online pCPUs.
+
+Limitations
+-----------
+
+On Arm64 cpu hotplug is currently not compatible with ITS, due to an issue=
s with
+the redistributor assignment.
+
+On Arm64 there can be problems with FFA if secure FW support notification =
ABI.
+
+Configuration
+-------------
+
+The presence of the feature is controlled by CONFIG_CPU_HOTPLUG option. It=
 is
+enabled by default on x86 architecture. On Arm64, the option is disabled b=
y
+default and marked as EXPERT.
+xen-hptool userspace tool is built unconditionally.
+
+Usage
+-----
+
+Disable core:
+
+$ xen-hptool cpu-offline 2
+Prepare to offline CPU 2
+(XEN) Removing cpu 2 from runqueue 0
+CPU 2 offlined successfully
+
+Enable core:
+
+$ xen-hptool cpu-online 2
+Prepare to online CPU 2
+(XEN) Bringing up CPU2
+(XEN) GICv3: CPU2: Found redistributor in region 0 @00000a004005c000
+(XEN) CPU2: Guest atomics will try 1 times before pausing the domain
+(XEN) CPU 2 booted.
+(XEN) Adding cpu 2 to runqueue 0
+CPU 2 onlined successfully
+
+Disabling a core with pinned vCPUs:
+
+$ xl vcpu-pin 0 3 3 3
+$ xl vcpu-pin 0 2 3 3
+$ xl vcpu-pin 0 1 3 3
+$ xl vcpu-pin 0 0 3 3
+$ xen-hptool cpu-offline 3
+Prepare to offline CPU 3
+(XEN) Breaking affinity for d0v0
+(XEN) Breaking affinity for d0v1
+(XEN) Breaking affinity for d0v2
+(XEN) Breaking affinity for d0v3
+(XEN) Removing cpu 3 from runqueue 0
+CPU 3 offlined successfully
+
+Testing
+-------
+
+The CPU hotplug feature has been tested on both x86 and Arm64 QEMU setups =
and on
+R-Car Gen5 (Arm64) hardware.
+
+The tests included:
+- Offlining and onlining cores with no pinned vCPUs
+- Offlining cores with pinned vCPUs
+- Offlining cores with Xen-bound interrupts
+- Offlining all cores except the boot core
+- Offlining the boot core (expected to fail)
+- Enabling and disabling SMT threads (x86 only)
+- Ofllining cores to which guests with passthrough devices are pinned
--=20
2.51.2

