Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMIkAI30w2lZvAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:43:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 559D6326F57
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:43:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262462.1554945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5PRd-00083W-6v; Wed, 25 Mar 2026 14:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262462.1554945; Wed, 25 Mar 2026 14:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5PRd-00081J-4I; Wed, 25 Mar 2026 14:42:53 +0000
Received: by outflank-mailman (input) for mailman id 1262462;
 Wed, 25 Mar 2026 14:42:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1w5PRc-00081D-1C
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:42:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5PRb-00Em3w-D3
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:42:51 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69c3f464-5cb7-0a2a0a5109dd-0a2a4506d07e-32
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:42:51 +0100
Received: from [52.101.84.105]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69c3f469-3034-0a2a45060019-34655469758c-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:42:51 +0100
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS2PR03MB9612.eurprd03.prod.outlook.com
 (2603:10a6:20b:594::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Wed, 25 Mar
 2026 14:42:47 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3%7]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 14:42:46 +0000
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
 b=Buk8yj2+M4PR+VYU0yXfb+SllGjOE46QY3y1CvXa+xSJOhamGWLggwYPvEbkCDGY6D1JCgv6PDS3evLHAMQ6PKpQopkzkkMkzm0U6fkC0VfPodGxjJyFVUbEzK+/bZ64OFD3Wso0TX2WPyjf5rHji1xBf+Q8T08gbdKMdX78XUdYtY2uNlNE/OqV+g6S8IetVR3fPxv9c86/0GqB4LuMDdRjAia1zgF15cmUVGTrnrhEKFaxK0Yf3VTDqmIzIp7lYHzvNMIFc+XAfNEWb3P19rT+mE1Rr/sTWpo2Axwo+flvVHxsj17ko2jRwj150iCdOhQqghNCHzFJgskZN1oIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPRBuAwM2nPbK0bQVX6iSNMTZygQqDxA7T5CIWvTl7w=;
 b=RZZeWWaepm0QibieD6F+HY6k1XPz+lt21YQ9gNcpEneO89zt8yAiVhrDtXdVu1Kmx0AogZG0QiIHCIhihUm5d0w8eLXpMgeZhlmxS1woPTFgQLzqbMc/qGJqk5GZouFf631XpvG/P/cB2XUjiJe9XM2FM9i1V+pOBfQRA84MpblK9Ie5ZLD0QOlzwEz95fEhCcjHEc7Mc6rkOTWSV2MZjO4GJidQSh4mm1VVKxJKPUYrH0+42EHL3RzOonLTL4/JRGVaTsl8Ct7Hy/T4sJ0i+ojH1FPIppwRU3pRADWsx9j9XJlhW4gw8aS5YoVNqVAKN6kXbf7jkDllcUEjolgY5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPRBuAwM2nPbK0bQVX6iSNMTZygQqDxA7T5CIWvTl7w=;
 b=vpOkJPbWqWDywynNZ2w1Z6X4eGjKPY8Ihazq0nV3RFGgb9AE+jf5Zy4rqiY9ZAECirWevoQt26RhPuTyIqbYjKffW4/j2HTUtb9u4ZUU1YWC/J28XBMMXRswQEQRf9FSchB1/jQoFIAB42j0Kf1lxawTHR3AML/thfwTSEzFQa8E4WDyYCtoNRm9395fyuwsjscQe61RDkB67NL/ANtyMY5qs6MH5rYVnFCVk2VsBA0tVvy3JSwpOJOe1f4oV31D/ymWMPUc6vYmNBXHCU9JBbokfl/Ap5RJpguVQueRtlMLR//RbOhgF1DseQ6RweJhHtkYIEVWv6QGrre21/s8fQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 1/4] xen/arm: its: collect quirk flags and honor
 dma-noncoherent
Thread-Topic: [PATCH 1/4] xen/arm: its: collect quirk flags and honor
 dma-noncoherent
Thread-Index: AQHcvEPlse85KJ7ml0OZmvGoi7I/KA==
Date: Wed, 25 Mar 2026 14:42:46 +0000
Message-ID: <87bjgcvul6.fsf@epam.com>
References: <cover.1774431310.git.mykola_kvach@epam.com>
	<5b68fa0a8403ea60db3047f6505876bc03a41f3f.1774431310.git.mykola_kvach@epam.com>
In-Reply-To:
 <5b68fa0a8403ea60db3047f6505876bc03a41f3f.1774431310.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Wed, 25 Mar 2026 12:38:30 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS2PR03MB9612:EE_
x-ms-office365-filtering-correlation-id: 3390f4b3-0c03-456b-7bb6-08de8a7cc7ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 YKKHS47vpe9qKfnLPniY0+/lCLCC/ZikSbsTnGiPZGGVT6Sp19Smp1pTctkkNwsURJ9/SQrQXiue20EdApj6PtG55I4lXDe4rsdlpcWTyoVkSpyIyIyDzlRvDrpqIR0WB8RoaXpZ3enoIaOuxVD+4wu85wv4OLeXYPJJhOLTiaA75v/T9EqQSO0wzWXQo2KETIIjgjuzNbO0Cv/sMDNUjNOmi+B2sQm3FR3B4Fu7cGV4wgRvbxdObD29XjhXPuJNcCCZUtiIRRLle/0Yek6LpuBLjy6sEMsaNWCS6Yh+qKp+AJCZ+I8KoPzEWbPlm/FgZK5ApADOaZqFBzHrGOO3PsUEPoopikn1oRZ5uVKhwtQQlU5h8cq9XEepW/K4IaresPBOGSTKj2qXlS0xctP9VRGCQvWoK/ncnjifNNTCxDhZhiQg4mvvyv+1rezE0v4/utzdBFRZC+manBWpp7E965+SVLGspr5zD+RKmRmhC00kq4pC1iEMsY58q1mjUYpJh0rZhGs1jAkPsfAuBgHrvslB5Xz8lVIgaHESjJ09MaViLUXkEAQBQhF5WonkJuyWzZbBVE//BOiNRd2SbtTOG1+bcz0Y3ZmzKvSXXkUlQmQjCn68Oa+LoKDZrG3dHLLZiEZwz5CFJ89V1OE5y2vInG5iXoInPju69V1uSb+ex0ZrxxQPs6QE2WNakx5s5dN+Rnk6J3VfVdTIelKQq46IRARZ13iRLg1vYEja2WXmGS39lNvJYxYga7RQ+0qu4fM8nQwEb7EH8wKkhnsk1sYM4lGzSAmuxi2ZU0YyJkBAs/8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KfUXqXZZPDr7q25IrR/w+R1gaT5dGenU6asfyBFuKAaHsj1O3DC7KTG2GY?=
 =?iso-8859-1?Q?5lZVSIP88tfx0gbuiV6gWxrBaieMpQZAjmt4zMiyu+c0SQ8eE5lrO8VHn9?=
 =?iso-8859-1?Q?6BM8cPNpy0/1uM2E84/1Q4GkN3+ZAsF2bw71S9USzRFSN7YfRRKcByCPyF?=
 =?iso-8859-1?Q?Tj9yqzllUQfcfZB+pHt5fuCRZrVg2g1xU7Q8ZjiA7MHKcGTJLjuIpih4Wb?=
 =?iso-8859-1?Q?ksGmDdN/F5R3UhTVK831k+L/9195zUpowuAEnj5wXwyEERH8kkynYSVcUP?=
 =?iso-8859-1?Q?3kDJpAL+qtXfkbZpKDJNW6ZZ226s+4gyyZM2Ggv7mBSXdhJlZw6GYay67Z?=
 =?iso-8859-1?Q?++xzryXiQOMG6ZF9ZnHDbsARUj/Aq5Oh6caC/1lBNBnWs3Z8S+x2Dj6gtX?=
 =?iso-8859-1?Q?T+MPpkjir5/eIieSf/GpNp1a7MkjC6EJBLGC8A2t4HniY8qOj2UzbLOc+Z?=
 =?iso-8859-1?Q?mWAyzseuAXhHuIzsy3dl7pjZXc2Wmsm5+EiWByJ128bmwllorOhIGwfStU?=
 =?iso-8859-1?Q?IEsOjH4SsloN3CcQpnBmHCq4tvOwm6mRKYVcJsW2uqQCPfF7no3Xr32brx?=
 =?iso-8859-1?Q?XPIrzOyXKDx0C9LG0mAh8RAbc5dxVQGMEig+2sokQbaP01NAqVyYsk0FHS?=
 =?iso-8859-1?Q?4WBby7iMQVDa6DNgBkfoSR1pre9KgpMj9PEhKyT8me5RzdskQ4xHHYh0u2?=
 =?iso-8859-1?Q?87VmIboUrESHZXcau1eSLWQ8+yKmTuPvf8RV43pBhAtQESCfqT6nM0vuoa?=
 =?iso-8859-1?Q?Mj6iNUJf7bDDZaCrUFXGajbixKYqoqO7yKcTXNF0d0RseWl/j+tUp5l22w?=
 =?iso-8859-1?Q?ov/QrLB+JdmEtGjZW61BwM25hgOG/QEn2GYgm57TToWbH+vRW3oPw+uQbZ?=
 =?iso-8859-1?Q?pKLM2BQyG8uPyVHDdgGdUITyLSxCvzY0wTVwrv4TedHtFKVLoKVPRt6plC?=
 =?iso-8859-1?Q?DGR/rJKm0pPKkFIQ557aPMv7QqyY8MNhDSSQA0zrWhKar9+Ay5n9bX/AXa?=
 =?iso-8859-1?Q?WWtmSvQRJjLwJQnSsrmrvK5qiqezFGigXqTbXqOpegEhw8dTjHxLls41jQ?=
 =?iso-8859-1?Q?JbleF21NxTBq3xBVzGtAhmbUTcoJ9RMt4BL7Aqv8mqEHYIHq1Abyda5sU0?=
 =?iso-8859-1?Q?3xSbx1kL3/DgGmRYG1Rlf2U/Eskqw1v6QSKlNMo0+JFvNYcsBofGFOjk4c?=
 =?iso-8859-1?Q?Bfm6YrpARFGyrhAKA6liShmdpmlhlxYpoFnE1vW4KgAEikwk4xtGnTMVtG?=
 =?iso-8859-1?Q?CZZz6yZh2+t6z5nK+PwEwvBfVjIcbJYDLQQPhhPlO8v2fAXekiWSlDFQpC?=
 =?iso-8859-1?Q?rOR13RP5+xOBUTM958uyjJj9a5BIY+tXYCGk5xV4y2xPP6qKrxtQNMfD8r?=
 =?iso-8859-1?Q?sV3/HTAytS9bv6LjaCBn2SnIC+JDBBBJMN6Hv3WQoA/HxikIiWFwskYdzw?=
 =?iso-8859-1?Q?77J0XObBbq99oZGr+lBqtOlD7D0KCpF7W+5OblGffLSGpZoxZZnyp/WdNr?=
 =?iso-8859-1?Q?6DQsGMIvc2vhYaQNtk/YBJeyclVEc5PNE4JGJ0HNfITweTdyu+sUBdIZNR?=
 =?iso-8859-1?Q?qgGWsr7xiRX3AfCpIgpmuyisTZM3Hh/y7q0dC/0YGlfxcdhveIcseiBLks?=
 =?iso-8859-1?Q?Wr3hleJMviLRVfTjs2FnAwpWc9TCGEAPypDYJtr9A/lECMVzo3vjdi751i?=
 =?iso-8859-1?Q?fGttEznKFQ2MazMQahPWbByTwtYXMuY5oIRE0Oj8MJfYX9jXkvznSmvAiZ?=
 =?iso-8859-1?Q?tJewTUpLUuEeAb/jsDIsVXdxScRYT7sGq65tK9hBnjkEVk3VaC8WtPpIGz?=
 =?iso-8859-1?Q?LSU1yehDrQLCjQvK/wuJCEN+HM+YdQU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3390f4b3-0c03-456b-7bb6-08de8a7cc7ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 14:42:46.7824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZqLa9sfvAmOn1JdIxIa2HXifXvoQMxl2CefeaXES8VUY58X2I5gbcFLvF+q3ahDwMNWNWu3CcrEE2urJL1/CCWuQwdPvtPobGONWdDOTCE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9612
X-purgate-ID: tlsNG-16d1c6/1774449771-825911C2-823C2391/0/0
X-purgate-type: clean
X-purgate-size: 5214
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 559D6326F57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mykola Kvach <mykola_kvach@epam.com>
>
> Replace the per-quirk init callback with declarative flags in
> struct its_quirk, and introduce gicv3_its_collect_quirks() to gather
> the effective workaround flags from both the IIDR-matched quirk entry
> and the "dma-noncoherent" device-tree property.
>
> This lets non-coherent platforms force non-cacheable ITS table
> attributes even when no IIDR quirk entry matches.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  xen/arch/arm/gic-v3-its.c | 70 ++++++++++++++++++++++++---------------
>  1 file changed, 43 insertions(+), 27 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 9ba068c46f..00524b43a3 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -57,71 +57,87 @@ struct its_device {
>   */
>  struct its_quirk {
>      const char *desc;
> -    bool (*init)(struct host_its *hw_its);
>      uint32_t iidr;
>      uint32_t mask;
> +    uint32_t flags;
>  };
> =20
>  static uint32_t __ro_after_init its_quirk_flags;
> =20
> -static bool gicv3_its_enable_quirk_gen4(struct host_its *hw_its)
> -{
> -    its_quirk_flags |=3D HOST_ITS_WORKAROUND_NC_NS |
> -        HOST_ITS_WORKAROUND_32BIT_ADDR;
> -
> -    return true;
> -}
> -
>  static const struct its_quirk its_quirks[] =3D {
>      {
> -        .desc	=3D "R-Car Gen4",
> -        .iidr	=3D 0x0201743b,
> -        .mask	=3D 0xffffffffU,
> -        .init	=3D gicv3_its_enable_quirk_gen4,
> +        .desc  =3D "R-Car Gen4",
> +        .iidr  =3D 0x0201743b,
> +        .mask  =3D 0xffffffffU,
> +        .flags =3D HOST_ITS_WORKAROUND_NC_NS |
> +                 HOST_ITS_WORKAROUND_32BIT_ADDR,
>      },
>      {
>          /* Sentinel. */
>      }
>  };
> =20
> -static struct its_quirk* gicv3_its_find_quirk(uint32_t iidr)
> +static const struct its_quirk *gicv3_its_find_quirk(uint32_t iidr)
>  {
> -    const struct its_quirk *quirks =3D its_quirks;
> +    const struct its_quirk *quirk =3D its_quirks;
> =20
> -    for ( ; quirks->desc; quirks++ )
> +    for ( ; quirk->desc; quirk++ )
>      {
> -        if ( quirks->iidr =3D=3D (quirks->mask & iidr) )
> -            return (struct its_quirk *)quirks;
> +        if ( quirk->iidr !=3D (quirk->mask & iidr) )
> +            continue;
> +
> +        return quirk;
>      }
> =20
>      return NULL;
>  }
> =20
> -static void gicv3_its_enable_quirks(struct host_its *hw_its)
> +static uint32_t gicv3_its_collect_quirks(const struct host_its *hw_its,
> +                                         const struct its_quirk **matche=
d_quirk)
>  {
> +    const struct its_quirk *quirk;
> +    uint32_t flags =3D 0;
>      uint32_t iidr =3D readl_relaxed(hw_its->its_base + GITS_IIDR);
> -    const struct its_quirk *quirk =3D gicv3_its_find_quirk(iidr);
> =20
> -    if ( quirk && quirk->init(hw_its) )
> +    quirk =3D gicv3_its_find_quirk(iidr);
> +    if ( quirk )
> +        flags |=3D quirk->flags;
> +
> +    if ( hw_its->dt_node &&
> +         dt_property_read_bool(hw_its->dt_node, "dma-noncoherent") )
> +        flags |=3D HOST_ITS_WORKAROUND_NC_NS;
> +
> +    if ( matched_quirk )
> +        *matched_quirk =3D quirk;
> +
> +    return flags;
> +}
> +
> +static void gicv3_its_enable_quirks(struct host_its *hw_its)
> +{
> +    const struct its_quirk *quirk;
> +
> +    its_quirk_flags =3D gicv3_its_collect_quirks(hw_its, &quirk);
> +
> +    if ( quirk )
>          printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
>  }
> =20
>  static void gicv3_its_validate_quirks(void)
>  {
> -    const struct its_quirk *quirk =3D NULL, *prev =3D NULL;
> +    uint32_t quirks, prev_quirks;
>      const struct host_its *hw_its;
> =20
>      if ( list_empty(&host_its_list) )
>          return;
> =20
>      hw_its =3D list_first_entry(&host_its_list, struct host_its, entry);
> -    prev =3D gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GITS_=
IIDR));
> +    prev_quirks =3D gicv3_its_collect_quirks(hw_its, NULL);
> =20
> -    list_for_each_entry(hw_its, &host_its_list, entry)
> +    list_for_each_entry_continue(hw_its, &host_its_list, entry)
>      {
> -        quirk =3D gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + =
GITS_IIDR));
> -        BUG_ON(quirk !=3D prev);
> -        prev =3D quirk;
> +        quirks =3D gicv3_its_collect_quirks(hw_its, NULL);
> +        BUG_ON(quirks !=3D prev_quirks);

I know it was in the previous version, but as you are already touching
this... This is not Xen BUG(). This is a platform problem. So you need
to panic here. Something like

 if (quirks !=3D prev_quirks)=20
        panic("Different ITS instances has different quirks")


Also, I want to point out that you are not validating "dma-noncoherent"
quirk here. I mean, some ITS entries can have this property, some other
- don't. This makes me think that you need to promote this
"dma-noncoherent" quirk from open coded check to a `struct
its_quirk` entry, so it will be handled in generic way.


--=20
WBR, Volodymyr=

