Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAsaL/Eoy2nLEQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3873632F4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268222.1557537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OGv-00083E-TN; Tue, 31 Mar 2026 01:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268222.1557537; Tue, 31 Mar 2026 01:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OGv-000817-P2; Tue, 31 Mar 2026 01:52:01 +0000
Received: by outflank-mailman (input) for mailman id 1268222;
 Tue, 31 Mar 2026 01:52:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OGu-00080k-7v
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OGt-00Cy64-GH
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:51:59 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb2851-5cb7-0a2a0a5109dd-0a2a450ce0c0-34
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:51:59 +0200
Received: from [40.107.162.115]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28bf-f93d-0a2a450c0019-286ba273d9ed-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:51:59 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by PAWPR03MB9202.eurprd03.prod.outlook.com (2603:10a6:102:342::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:51:57 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:51:57 +0000
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
 b=HsiXqiQ18oKYenCvDJuv643jjJ2sbiqq7vxoJsiF6R+i4T+SpYWa8cwKxCF7dPv1Ex9J94JSKu1l+UXFLdg1HdeAuFrpHh/SZWb8O9WhRH8A7qCD2tulnqzLHeQ9z02CgkMaOWooeAVhyQwwTyZah5XCLZy0pn6J3IpdFVFaoiKwEPbYi732PxWb47eMOr0VzVbdt66Rxe/n3FGXnWvgUUEeFitu2EUSJ4eSgYfWhdKt3yyr3k/XQ+9Pebyj19JvGe+3zoF4v3Ms0hMk1qMEdGlHQe7CyEAcPLgA3kkGOBXDb4LJVXbwvXLQePTkAUYorQLJfhngVDnRKAOF50dwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7XogBKcOl28rCBoj5eBhnCjmXH5hva/MVY1Q1e3WbQ=;
 b=gemqmFeXZfK7lJekpDTLAGPZLjq1zW1VheXktbIqscLml3AHTivRM2WG7wfDe6YBQ2ElQE8uTQNoKHpaVe6Hg+GBt/3GviXTfrFm0k5dKhUIWeOZ8MUF8JDH9tpbxufWCvgAe4mb/MsP/J2wszI/UyfXit/AAu0ligqGYxRttHMqKcI4QM1swZia+NO69RKz0FLDANW2ABLHoQxU4czbtcAK4kamM0foo+6BIDKzhGMSaqqR6419vrDRfcpV46uDEewH5mLeYLE450KlNRfW4wzg/CLWfkZW2TkSl9AGNwdkyqII0PmIxJ451c8oi6sZxysTjFOxiKYV5aqtHC2/uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7XogBKcOl28rCBoj5eBhnCjmXH5hva/MVY1Q1e3WbQ=;
 b=IChjGPoH1lmvGBZI7I1U+y6JfoD8ZjwYwA1oY7ItJp0whtCTHOq0grKOL41+f2iHUCX/O8XUd3/rrmPBM9hALcRGyorROspRVE800iszoGGmUAauvUcyPleASHouIO8w1ColfyMKcxnlm6sqyWEo0mXWbIclBfGK4Q0Hu54T37062Im1EbrrxDXo779/PEwJ1fPB9K9tOPWjeFQyw9vjhIC7xxCQqNW1O3Iq/WNcKzlpJpAmskH7MV6WHlgTdmSA73USngtZ4+DgCjX7q/RcP9ob5b17ujwPfvDjP1QfN4Px4fOz4cwFQSYlrwVBkIbWedWOS8etAlCu99LsCcZxpg==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jean-Philippe Brucker <jean-philippe@linaro.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Eric Auger
	<eric.auger@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>, Will Deacon
	<will@kernel.org>, Joerg Roedel <jroedel@suse.de>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v3 01/23] xen/arm: smmuv3: Maintain a SID->device structure
Thread-Topic: [PATCH v3 01/23] xen/arm: smmuv3: Maintain a SID->device
 structure
Thread-Index: AQHcwLD18+tJxs/wLkCVu096Urnyqw==
Date: Tue, 31 Mar 2026 01:51:57 +0000
Message-ID:
 <4fd154cc1d76972d85df6c426320555d6894adfb.1774918270.git.milan_djokic@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|PAWPR03MB9202:EE_
x-ms-office365-filtering-correlation-id: 0714b654-b0ac-4ce8-74e6-08de8ec817b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 jA0aNxz4HmFGU7UtjwDsvNgC2o7NDFIjt84YXhMSFDAgqjS2XG9Q4DKx4yuYejY2GEsxGRgSD1Lt+8sP0KYvPm8DXB/SPphoi02W9i9QGS5DBg5Crb3ewNU9BeLfqm998TnNnAZtmoid4+qiwrPAbQ6Rlv9wynMCJz/5wz3D+bPZV/LZFQAVtTnc/4Z78aB+QJ9iUMsV7w9P3kuBczvN6NvIIYCTiCC8F5ewS03wO4hup02mWC+E6YHv+wf7f7apws/bvlk1sCpPMeUBiNHMwmaY6/BVnA/ymS6WKPoAzYELzPZWU4GalbG7olZj/L6XevvXjEYXqIzq1sZbjji27Lq+HsywuatqId79bV2YlvdqTDCGHC3vvewQhstI45EeV0IlJF0jd4G3J9Z1HINg4yEVSIOe9S0Ph7rDvSiXnc4GwDVfT2FOktYHiXo/LESNMuUkLCyIFLZ6O/zqYlNZCdhzaraJ3SAgHJvITSsmCDaBCwySSjnR6QmYP3sJlSQqnqrIYaML9DEXtTMqlHjVvNUBBIzMpD0iSIEvH6fPqA9r1FOc4hN6Mc4NwuefmLuGQeBeutf9Ie/fhSHOhts2IV8bUqcpQMRRBnvnzpopxK/PqJzhDlIQmqdlkiC5ka2zSoMvdBgAFyIxwAsfxMguvEA/CIUbJ2v6hdRdHgQBhaunZeLctHoIC2RA6gTth/TOzeL1VVp9PDyHb0Sx5N0x83AxccUkvSN19yfgVwZ0Ty5u0wLQ/THRhtTVXLCdwiLHZx1CyircdnEgVu8jm0e67iIfJzM7zhJlXdHTBVd+sUM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CEKAWH7+wm8/RziOadqM0nnI03J2DkKNed5CBHenfuEx79kLIkysR50EbJ?=
 =?iso-8859-1?Q?7paz69KARFzp2l6nxEVSDvTWbLEy5lGDhbAROR07wVl/HHiiRiIPbn4FWc?=
 =?iso-8859-1?Q?w4Coj3HE1DrrmeQyPgj21dTgk+EBBfKMWDSB//ETRNOc3fruhDPr914U+Q?=
 =?iso-8859-1?Q?PeAr6B0iS2vdYDd0THJZes08yEevgaJ4A0+cLILdb7Z1pstcwzSSwG7VOC?=
 =?iso-8859-1?Q?/0D6zbX7mSLq2FaCpFGPdLLDosKFbYFqnmqH8tbCzYmPmVfv1CVvtGnICK?=
 =?iso-8859-1?Q?ubQKZ6dZ6MfPrBYlQNrLe0vfP6+JUE5KMePNC3uedW74NZiTVKG4bxd9CJ?=
 =?iso-8859-1?Q?VgpWiyn5LmqocQgxEa0c4L9YvozuDeci9J5fMPTqMWSw1GxX07HJNim2M0?=
 =?iso-8859-1?Q?V5kxJNMNVA6dHSjekZgUWJLItGc5QV457o8dhOs3YPtkJxdt0wr6E7nfWF?=
 =?iso-8859-1?Q?1cyqhZVjlFNf1kESJ0Vius9QT9EwDsKpPKuqn/moSRuogjKXECxNrPet2t?=
 =?iso-8859-1?Q?rbG4If/DxSQPzAw8PTWtcXvxiasz8Aiud0jHI3/CfvBd7yGkGdz22Z1qAj?=
 =?iso-8859-1?Q?E0R3IIDyTf1KyapM5YU4E9T6e9vgWeMSendVdhifSFCefXxxIR1JDcyHwk?=
 =?iso-8859-1?Q?dNhDLTH5RuKPBvuhGFw8H4YRpc52jGvYKefOIsf39cP44IascfgVHdElC1?=
 =?iso-8859-1?Q?yLhEJJZeiLFtfjO6kfaa+SYQoPDqYEo8IUO0I8FSjbpy7zDQ8634L5/Ypz?=
 =?iso-8859-1?Q?grkv5Lg9PpLaP/Nwexrgj0lZwZ3tZGGTbf/TFtdzZ9rH72J4sbYDbaollp?=
 =?iso-8859-1?Q?Die92kvrXbTWJO4gu+zrWS+mNqhpLHdWzNh2kFScKyMHI/Syirxo5USmJa?=
 =?iso-8859-1?Q?Ilw2kNsMhrcUN5o91s8HYfulNcSg40IkXpDNQbkg0uZntD5d47vBmxvIP/?=
 =?iso-8859-1?Q?B2qCPs+f/mjOiJj4W/og0tGGDrem4SjCY7kXCM1joxN2Pc6bk5fGKj6Bls?=
 =?iso-8859-1?Q?vSGgagBUgMlGk4htMf9Oqr/pNtupsYWpR8LXgyCWx/XAIbjl+F7pjIThAl?=
 =?iso-8859-1?Q?hvq/SRSb6fXZuINgpIbUreuXQ6ng0byDdobSomiC1tLEKxg9U2MZqMpww3?=
 =?iso-8859-1?Q?g4YHu9XBdwaMyhi5gMAvXhPgvc+JzHmo6uZiTMU4BV4sBWViEvi46xARbH?=
 =?iso-8859-1?Q?U6iZLzDbWcreYwj3O1P9HXRg0K16tRv3JQut6aL6g6VAUnDsWf9AwU5Qps?=
 =?iso-8859-1?Q?n4lNPmt2gKmDyKPzHD5+Jwz0q7vLS0vUL2Xlz2PYnvcRlSZg7Yd0goDJc1?=
 =?iso-8859-1?Q?uW17vbw4TyQAOZkYrG6+7Nzz/YZnzrGC3AL/xuVreXeNklATrkKFmka6ah?=
 =?iso-8859-1?Q?tjKEptFyGbtXA3Mz4E0oj8dl8Nu3vUDcoSX/7se9Ghgn0oc/Tpayo6hS9U?=
 =?iso-8859-1?Q?m+Fv+Romt8d4hhFuzr1MqU2LI+VBTExqBbu16Q6/QA6JR28jlb6WO4WMe5?=
 =?iso-8859-1?Q?NU7T2n55QbqzI/zlD5utpUgE3kJsqkrx2S0lzLybiPlESiVso4ggLIh3l2?=
 =?iso-8859-1?Q?O3eDoaMJ5194B6wwLPYfZRLvDjmAUoflz9CJmQX8M6Bx9N7fOTAEqfe8mK?=
 =?iso-8859-1?Q?TD/VyDNHrxRa4rri0aCB04HJX1aaM0bc743yACHSZVf+G+u4b02dfE1sbn?=
 =?iso-8859-1?Q?PC2SVQhym/NmN1zkhbCOpjRYZB0i5lx5wpt37h5upBE9ZfkLh5y6eN2R2s?=
 =?iso-8859-1?Q?cptY3csVcMbvCXQCBwAT7Bqd5l505g+DxJmGEE6YYsXxkFQ+4UR5LLy9Vo?=
 =?iso-8859-1?Q?m/4XjPSua5t9ovY8QcVeBz9pGgtJVrw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0714b654-b0ac-4ce8-74e6-08de8ec817b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:51:57.5217
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wMveqthMxWLgpoLyXjr+uYLzhppsykMt+thyJxLNBkEMHcPBahCcWxTpxVAOmNrjQz1yeApjbO5f7H2u5LB/zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9202
X-purgate-ID: tlsNG-d25034/1774921919-F78A4734-78CB666D/0/0
X-purgate-type: clean
X-purgate-size: 7633
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jean-philippe@linaro.org,m:bertrand.marquis@arm.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Jonathan.Cameron@huawei.com,m:eric.auger@redhat.com,m:zhukeqian1@huawei.com,m:will@kernel.org,m:jroedel@suse.de,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2E3873632F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Backport Linux commit cdf315f907d4. This is the clean backport without
any changes.

When handling faults from the event or PRI queue, we need to find the
struct device associated with a SID. Add a rb_tree to keep track of
SIDs.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Acked-by: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/r/20210401154718.307519-8-jean-philippe@linar=
o.org
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git cd=
f315f907d4
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 131 +++++++++++++++++++++-----
 xen/drivers/passthrough/arm/smmu-v3.h |  13 ++-
 2 files changed, 118 insertions(+), 26 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index bf153227db..73cc4ef08f 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -809,6 +809,27 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_dev=
ice *smmu, u32 sid)
 	return 0;
 }
=20
+__maybe_unused
+static struct arm_smmu_master *
+arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
+{
+	struct rb_node *node;
+	struct arm_smmu_stream *stream;
+
+	node =3D smmu->streams.rb_node;
+	while (node) {
+		stream =3D rb_entry(node, struct arm_smmu_stream, node);
+		if (stream->id < sid)
+			node =3D node->rb_right;
+		else if (stream->id > sid)
+			node =3D node->rb_left;
+		else
+			return stream->master;
+	}
+
+	return NULL;
+}
+
 /* IRQ and event handlers */
 static void arm_smmu_evtq_tasklet(void *dev)
 {
@@ -1042,8 +1063,8 @@ static int arm_smmu_atc_inv_master(struct arm_smmu_ma=
ster *master,
 	if (!master->ats_enabled)
 		return 0;
=20
-	for (i =3D 0; i < master->num_sids; i++) {
-		cmd->atc.sid =3D master->sids[i];
+	for (i =3D 0; i < master->num_streams; i++) {
+		cmd->atc.sid =3D master->streams[i].id;
 		arm_smmu_cmdq_issue_cmd(master->smmu, cmd);
 	}
=20
@@ -1271,13 +1292,13 @@ static void arm_smmu_install_ste_for_dev(struct arm=
_smmu_master *master)
 	int i, j;
 	struct arm_smmu_device *smmu =3D master->smmu;
=20
-	for (i =3D 0; i < master->num_sids; ++i) {
-		u32 sid =3D master->sids[i];
+    for (i =3D 0; i < master->num_streams; ++i) {
+		u32 sid =3D master->streams[i].id;
 		__le64 *step =3D arm_smmu_get_step_for_sid(smmu, sid);
=20
 		/* Bridged PCI devices may end up with duplicated IDs */
 		for (j =3D 0; j < i; j++)
-			if (master->sids[j] =3D=3D sid)
+			if (master->streams[j].id =3D=3D sid)
 				break;
 		if (j < i)
 			continue;
@@ -1486,6 +1507,80 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_de=
vice *smmu, u32 sid)
=20
 	return sid < limit;
 }
+
+static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
+				  struct arm_smmu_master *master)
+{
+	int i;
+	int ret =3D 0;
+	struct arm_smmu_stream *new_stream, *cur_stream;
+	struct rb_node **new_node, *parent_node =3D NULL;
+	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(master->dev);
+
+	master->streams =3D _xzalloc_array(sizeof(*master->streams), sizeof(void =
*),
+					fwspec->num_ids);
+	if (!master->streams)
+		return -ENOMEM;
+	master->num_streams =3D fwspec->num_ids;
+
+	mutex_lock(&smmu->streams_mutex);
+	for (i =3D 0; i < fwspec->num_ids; i++) {
+		u32 sid =3D fwspec->ids[i];
+
+		new_stream =3D &master->streams[i];
+		new_stream->id =3D sid;
+		new_stream->master =3D master;
+
+		/*
+		 * Check the SIDs are in range of the SMMU and our stream table
+		 */
+		if (!arm_smmu_sid_in_range(smmu, sid)) {
+			ret =3D -ERANGE;
+			break;
+		}
+
+		/* Ensure l2 strtab is initialised */
+		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+			ret =3D arm_smmu_init_l2_strtab(smmu, sid);
+			if (ret)
+				break;
+		}
+
+		/* Insert into SID tree */
+		new_node =3D &(smmu->streams.rb_node);
+		while (*new_node) {
+			cur_stream =3D rb_entry(*new_node, struct arm_smmu_stream,
+					      node);
+			parent_node =3D *new_node;
+			if (cur_stream->id > new_stream->id) {
+				new_node =3D &((*new_node)->rb_left);
+			} else if (cur_stream->id < new_stream->id) {
+				new_node =3D &((*new_node)->rb_right);
+			} else {
+				dev_warn(master->dev,
+					 "stream %u already in tree\n",
+					 cur_stream->id);
+				ret =3D -EINVAL;
+				break;
+			}
+		}
+		if (ret)
+			break;
+
+		rb_link_node(&new_stream->node, parent_node, new_node);
+		rb_insert_color(&new_stream->node, &smmu->streams);
+	}
+
+	if (ret) {
+		for (i--; i >=3D 0; i--)
+			rb_erase(&master->streams[i].node, &smmu->streams);
+		xfree(master->streams);
+	}
+	mutex_unlock(&smmu->streams_mutex);
+
+	return ret;
+}
+
 /* Forward declaration */
 static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *de=
v);
 static int arm_smmu_assign_dev(struct domain *d, u8 devfn, struct device *=
dev,
@@ -1495,7 +1590,7 @@ static int arm_smmu_deassign_dev(struct domain *d, ui=
nt8_t devfn,
=20
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
-	int i, ret;
+	int ret;
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master *master;
 	struct iommu_fwspec *fwspec;
@@ -1532,26 +1627,11 @@ static int arm_smmu_add_device(u8 devfn, struct dev=
ice *dev)
=20
 	master->dev =3D dev;
 	master->smmu =3D smmu;
-	master->sids =3D fwspec->ids;
-	master->num_sids =3D fwspec->num_ids;
 	dev_iommu_priv_set(dev, master);
=20
-	/* Check the SIDs are in range of the SMMU and our stream table */
-	for (i =3D 0; i < master->num_sids; i++) {
-		u32 sid =3D master->sids[i];
-
-		if (!arm_smmu_sid_in_range(smmu, sid)) {
-			ret =3D -ERANGE;
-			goto err_free_master;
-		}
-
-		/* Ensure l2 strtab is initialised */
-		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
-			ret =3D arm_smmu_init_l2_strtab(smmu, sid);
-			if (ret)
-				goto err_free_master;
-		}
-	}
+	ret =3D arm_smmu_insert_master(smmu, master);
+	if (ret)
+		goto err_free_master;
=20
 	/*
 	 * Note that PASID must be enabled before, and disabled after ATS:
@@ -1796,6 +1876,9 @@ static int __init arm_smmu_init_structures(struct arm=
_smmu_device *smmu)
 {
 	int ret;
=20
+	mutex_init(&smmu->streams_mutex);
+	smmu->streams =3D RB_ROOT;
+
 	ret =3D arm_smmu_init_queues(smmu);
 	if (ret)
 		return ret;
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index ab07366294..ab1f29f6c7 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -639,6 +639,15 @@ struct arm_smmu_device {
 	struct tasklet		evtq_irq_tasklet;
 	struct tasklet		priq_irq_tasklet;
 	struct tasklet		combined_irq_tasklet;
+
+	struct rb_root		streams;
+	struct mutex		streams_mutex;
+};
+
+struct arm_smmu_stream {
+	u32							id;
+	struct arm_smmu_master		*master;
+	struct rb_node				node;
 };
=20
 /* SMMU private data for each master */
@@ -647,8 +656,8 @@ struct arm_smmu_master {
 	struct device			*dev;
 	struct arm_smmu_domain		*domain;
 	struct list_head		domain_head;
-	u32				*sids;
-	unsigned int			num_sids;
+	struct arm_smmu_stream		*streams;
+	unsigned int				num_streams;
 	bool				ats_enabled;
 };
=20
--=20
2.43.0

