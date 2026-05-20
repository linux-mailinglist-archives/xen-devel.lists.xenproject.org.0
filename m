Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALRYFuC9DWrH2wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 15:57:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37D058F2BE
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 15:57:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313992.1584012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPhQP-0002Xd-9W; Wed, 20 May 2026 13:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313992.1584012; Wed, 20 May 2026 13:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPhQP-0002V5-6S; Wed, 20 May 2026 13:57:29 +0000
Received: by outflank-mailman (input) for mailman id 1313992;
 Wed, 20 May 2026 13:57:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wPhQN-0002Un-IP
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 13:57:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPhQM-007rgd-QC
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 15:57:26 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a0dbdc5-2eae-0a2a0a5409dd-0a2a4508a792-8
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 15:57:26 +0200
Received: from [52.101.84.96]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a0dbdc6-63b5-0a2a45080019-346554603c04-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 15:57:26 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB7980.eurprd03.prod.outlook.com (2603:10a6:20b:43d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 13:57:24 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 13:57:24 +0000
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
 b=CnWy2AlINieyRIvaTSk0vAYSVPM+EWlldiwqlwwGIEDWJbbXHPnUROykagRXzqPTm4iMjMHlHqLt9QzXkTF4qK9/i46wftwaHoo6WvNmXUZsIadIy/OslSmK9RFhhymo8SF9UXa/0bAA6W+6FtIFRLD8aiYvH+Fo8EUrj150CdwtbSVWChONhN3m+UsX8QobDvrcH2z+XLtOt9Jh/WMoRu2vCokrdb1FchkJgWSRmSDnj+y/URt/gHRr7HBx63TK0SouCrGplPnj2zbGdy1Q5jsXxoTkuqVJ/r/1VxVSpKvfRBLGX1wwjvXB6Dols4HZ7Uby94+oEZllPyt+30h4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wAYJZ8KZZHEoBPSeN2CfVB1LKAgTCQag44BgT2Zj60=;
 b=FvBFAvl9T5W1e3o5JyAHjNOYhSmTtPaCHdCX0IAiuIzlmU1YGXkHNL650xa09d2FK5ab71tfA+aihNBUobcctvPEcnaNd55xeVDwtXstw8Vr4x/cs+gk1ANkPeHH/FKE/VR6ZDrXvoTd4rzO8oyi4XXhvbVBREKSmz13bx1DKwU9VvCqekliM0Xls1n6pCYTf+tZEFSUfZekzXShPhvlZvpmKM80CHKOIcAk39P1hXOJa537VJvgzRpnF3fEUH1FVjfUe7/hZ9yoJFUTtZ9872+0n51yU5U0sZlzB5oTTQZH7JKeRGRv7izg65sdw9JvsAClTuOhSQQqKJROl0biEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wAYJZ8KZZHEoBPSeN2CfVB1LKAgTCQag44BgT2Zj60=;
 b=soo2TGMz9ayCj2VBOVRL1QDkpMUXjDz3dKDyylcF5bsfmevARxuScRk/1vdGUVna1UnxW8jYth55T5zpm7+5dnIcOQ6US1GGeV9Tp1C0XlSq7Tf+B0Cb3RhhKKBYqPs/BnzI8y0MNf4YvySSJov7ltZ7EOZFKavT18GStpB39JaEve/Q0bZVOrlWYK7NpBU1tDbTRCsxBqlDhGp5X/A5lCSuxpn1fBtatGJRUJSoav0UbVUEEGVMgW6JHZOLX1NNTAdKSnbTi7W6oqYUBZNUFTk/fRJ68SLrTUKzdWe2to154UzzbJOvcBVGB0O8p4Wfonm1ZAwJY2mpnAOheieALw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Oleksii
 Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH] sched/rtds: refill cur_budget when extratime is toggled on a
 depleted vCPU
Thread-Topic: [PATCH] sched/rtds: refill cur_budget when extratime is toggled
 on a depleted vCPU
Thread-Index: AQHc6GCVPGH3eIVQNU2ACk9r0dRkTQ==
Date: Wed, 20 May 2026 13:57:24 +0000
Message-ID:
 <9f20b6ac8176da6c67e1084e862158a2e47abc40.1779285422.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM9PR03MB7980:EE_
x-ms-office365-filtering-correlation-id: 07aeb2bf-fc01-4498-b681-08deb677b83a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|11063799006|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 wg/pcuYOTA4ACk/1PNnm+8oICnpGe0bytQKN3IlVjfqmmeskOsKndIA2HQWxvWwsRLojKxp64GJWWmrSdtEFYp1qT+Cf5Od4n+T6GVZrycj3XXYFMVI2kpU01iST1KwGdmH+BLs85chpdiRIgU9TaDQsmWkcqbiW3UV9k4ttRd4XSD6qftlevu496nz3R+/LCAizPFqxXu/kAZgijYH9THcLFzdwsoRZ8Vjrj5NpbXoxNGHREmGsa1sxJR7iTE4/ULnNHv6FjURHeWZ9KDAGqj5nTJNV9Al5VaOCCYGWCSun7NHe9wqf9/L/3HtF+3JZKFrYZR0Qjnfr3kFzAcyV7bbhGxefZsmQpP7PLjLmYdaJ47VBPKC8cFS23WQtoB52zC/Qo10lMdkASj8VtJM30pbp2TeUqtREj6ITO3lPOQJIY6LUZZbMaEF31dckYYuGFu6k3oSQRrewIet4qMGiH3dTMtMWtxVNrrBbpppQqs7liF760c9KAVM/4O1jJwhJtuASWV7NfQlS170WT+14gUfBTdPkWVcAj4DcIY8MC4EZ1htcxYeCWHDZ7VepI4BBEr4u/rX8xxpUzpCp8gHV7s7ohxQRY/MPK1RS+3vBUQS18b2KJcT/QMeIzJVht+Hr9x7jozIBBlxV/ed246WLoBfEsvI5GgvQLa8HXI0BfSgQBUA+2Pd4e5DsrU4JnmBHqdiRCDpWaDJOqd5Ihw1t8w12TMXWwfQNyf6n/K8LLr4lJ9zq37cqg5aCglW98Szz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?10IZSuiMG2tLUmKR0BckgmOIdXT4vixo2noWMEz1L/LTAYn0T+YMvAzava?=
 =?iso-8859-1?Q?flpYIttJ/UUvPJ2PJYFn0AOE5O3mr0IQ1rvEUiGtlXnMtWJi9PKnfa+dFH?=
 =?iso-8859-1?Q?6OF8poVpK/iGBTBlPM5D/H3TMQDBEzr23frhbh9PbQninqfOyG99MpKGcK?=
 =?iso-8859-1?Q?hx1tRdwRN7t/aPpz9CUR3+w5Mwn2YUWdfYdMncNcGZeroVKNh3ktUj07cW?=
 =?iso-8859-1?Q?3ThyU3Xz17FBABySE9K+UqJd66OW2ZMovxGAQdugr86nXwp8sDpeg0xci9?=
 =?iso-8859-1?Q?xwXL/CsZaRXLMdVA53EthnKYHii5/8DLIDtTcVMH5ucZLOm3Lu/ATej1th?=
 =?iso-8859-1?Q?tkaHcs7E6hmVs6K4Xzs2e1nTdEiSrrsX+QOsVHlvOKzYr8O3Hi4YShQ6tr?=
 =?iso-8859-1?Q?X71HalUh6vzNWqldOmidPRaUmfeHcGLYhtscek+M+ebp4ofyC9TXKI4P+r?=
 =?iso-8859-1?Q?qWkGPEK3Plyxrni+nRACx8MzrBZh5tJ5tEPYUhgtjobFY2w95QtsMqwSt8?=
 =?iso-8859-1?Q?3DqVdJv5Djfb9WOuFeYZY4Dc67gHgynM6l2POtXVnQPGwThGxIvtu6DydZ?=
 =?iso-8859-1?Q?FX6xL7/TsTBt0RoLZ0Sh3yEGJCUaiG/KVaBpAwLFAw6noSCls+FB49EmF5?=
 =?iso-8859-1?Q?O2bg9dGxZ209VJ/vkd37dn8az0QvrfFfd6l4lU1As3njvQloWWD9PYgApX?=
 =?iso-8859-1?Q?v7nSDKcL+7aWF7hFxoVkNbztd6591zmosFie9VkOBn02mt7XWID9twxsrV?=
 =?iso-8859-1?Q?O8UQS68E9tiWIcdE4Z4vPnbYiA2WqD6Lbgxxinu9GCfj4q9Gouct3w4Rj+?=
 =?iso-8859-1?Q?U/gVP98C3mdOrdog9RYMaKR2LPBCeAOQnwieF2PCAkHNYGvL7Oiqo7vfU3?=
 =?iso-8859-1?Q?H8dL/+doGZjHnaP2OCGSQsaO+WHanqdb421fT9OER3QcNEIAWLFrK4VwD1?=
 =?iso-8859-1?Q?HBqNw2Y+aXM5/DFu0jjBU/bWbPgu1GheMHNbykUejTPMx6z9ivo2afhmyZ?=
 =?iso-8859-1?Q?hlDhtm02OKpO7QhCpIAm35otSlRsxzQevoLyQ6ljweG4WiM8tkESxZp3jn?=
 =?iso-8859-1?Q?W0QXsv4qhPA1ScsDmcevp3UpQJ+UzQpdiHqLi4ZoSYPLjIi0tzc2vaKmKl?=
 =?iso-8859-1?Q?Qa+c+jhNCyamZrExNPJL2geJ5agzZRbkC6AGf+2It2k2VZ6x7/IZ+17QwY?=
 =?iso-8859-1?Q?qK9b8cCCrZH2zl43F64Tm3pP5FFvjio7MpUXsCwnAHScj1c66sUXYwzTs8?=
 =?iso-8859-1?Q?8lI6w56wfvVKtIefetv8yTmnxr0VHlS9yp2merjPnp8xFzpozJQnab7sUh?=
 =?iso-8859-1?Q?Tbr2rZmtzb/Vj7Z/tqB6L3gvNuE/cGfQ8C7JDaRjDD9Gqj9nDfE3WxbgAK?=
 =?iso-8859-1?Q?7vjDqfDTVAcGmpoSXyhK+0aObilFyVQFc598JUyKqGmcCuKum6xdqL1VnY?=
 =?iso-8859-1?Q?WXb5w02cckQEdVj2DtXgAfytKwDNcXw6YNfhEJ+QnR0kRc3d7IuL66ljyj?=
 =?iso-8859-1?Q?50Cgpyv5f+zm8z3cDnDpIGJFlvA4RNtLzuuhJ0wCqxe6nNVunIX7IDD4Hq?=
 =?iso-8859-1?Q?buClgnI8emwmbIin+aOvJ3gXMUqnz1y9XEhIA7OLdxED4q3/hFZ7aXXMio?=
 =?iso-8859-1?Q?+v5Nn/Dsy0S+uasLA4N+WpUFtWYfdF6mduZrg0+1Lhvt5gtYXGPLGGS+jX?=
 =?iso-8859-1?Q?h8GvnzmHMziLq55fyCZ9+O4hjtjW9e0D0qbtLS5x+gAQUsJDJGby2RtwcS?=
 =?iso-8859-1?Q?CwDa5u2crBdQ7EdVi4cUTBwIJ1I7BdAoMJ6GlM6XjbasdaK5kXgNRqeUT/?=
 =?iso-8859-1?Q?WOYF7xx9FcIincr3+TqFjZzXUSKDhV8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07aeb2bf-fc01-4498-b681-08deb677b83a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 13:57:24.1293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qhs3/gSDtOcYdav48K/PgTMSth9noYd6O/qGknGNrFzNYh4sdCr5L4G49STEJUvYf5s+deD8XMcFZKNc3wSfdNkcLZ5OEYBGQX84lfDfHcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7980
X-purgate-ID: tlsNG-c1860d/1779285446-BE368DB1-790FE86E/0/0
X-purgate-type: clean
X-purgate-size: 5912
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:Oleksii_Moisieiev@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A37D058F2BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

XEN_DOMCTL_SCHEDOP_putvcpuinfo can flip the RTDS_extratime bit on a vCPU
that is currently depleted (cur_budget =3D=3D 0, possibly sitting on the
depleted queue). rt_dom_cntl() touches only svc->flags; cur_budget is
left unchanged. As a result the next code path that calls runq_insert()
on this vCPU - rt_unit_wake() after a domain_unpause(),
rt_context_saved() following a delayed runq add, or repl_timer_handler()
after a replenishment - places the vCPU on the run queue, because
has_extratime(svc) is now true and runq_insert() admits extratime units
regardless of cur_budget:

    /* add svc to runq if svc still has budget or its extratime is set */
    if ( svc->cur_budget > 0 ||
         has_extratime(svc) )
        deadline_runq_insert(svc, &svc->q_elem, runq);
    else
        list_add(&svc->q_elem, &prv->depletedq);

The very next rt_schedule() iterates the run queue from runq_pick()
and trips the ASSERT(iter_svc->cur_budget > 0) at the bottom of the
loop, panicking the host. Observed trace:

    Assertion 'iter_svc->cur_budget > 0' failed at common/sched/rt.c:1035
    ----[ Xen-4.22-unstable  arm64  debug=3Dy ubsan=3Dy  Not tainted ]----
    [<...>] rt.c#rt_schedule+0x1558/0x33e0 (PC)
    [<...>] core.c#do_schedule+0x2e4/0x15b4
    [<...>] core.c#schedule+0xb14/0xe50
    [<...>] softirq.c#__do_softirq+0x20c/0x3d4
    [<...>] do_softirq+0x14/0x1c
    [<...>] domain.c#idle_loop+0x194/0x558

Minimal reproducer: pin a single-vCPU domU to a pCPU, program RTDS with
extratime off and a low utilisation (e.g. budget =3D 10ms / period =3D 100m=
s)
so the vCPU spends most of its time in the depleted queue, pause the
domain, issue a putvcpuinfo that sets XEN_DOMCTL_SCHEDRT_extra, then
unpause. As soon as the schedule softirq fires on the pCPU, the BUG
hits. The same sequence is reachable without an explicit pause: any
window in which rt_dom_cntl() runs between burn_budget()'s budget
exhaustion and rt_context_saved()'s runq_insert() also closes onto the
same broken state, because the per-scheduler lock is dropped between
those two points.

The semantics for "extratime gets exhausted budget refilled" already
live in burn_budget():

    if ( has_extratime(svc) )
    {
        svc->priority_level++;
        svc->cur_budget =3D svc->budget;
    }

Apply the same priority-demotion-and-refill in rt_dom_cntl() when the
flag transitions from off to on while the vCPU is depleted, clear
RTDS_depleted to match, and - if the vCPU is currently on the depleted
queue - move it to the run queue using the same q_remove() +
runq_insert() pattern already used by repl_timer_handler(). The vCPU
remains on the replenishment queue throughout, so its normal
replenishment cadence is preserved.

The complementary transition (on -> off) is already safe: clearing the
flag only narrows the runq_insert() admission condition, so subsequent
depleted insertions correctly route to the depleted queue.

No other call sites need changes: with cur_budget restored before the
flag is observable to runq_insert(), runq_pick()'s long-standing
invariant (every run-queue entry has cur_budget > 0) is preserved.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

 xen/common/sched/rt.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index b156f61afa..18e39977be 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1465,7 +1465,41 @@ rt_dom_cntl(
                 svc->period =3D period;
                 svc->budget =3D budget;
                 if ( local_sched.u.rtds.flags & XEN_DOMCTL_SCHEDRT_extra )
+                {
+                    /*
+                     * Turning extratime on while the vCPU is depleted
+                     * (cur_budget <=3D 0) leaves cur_budget unchanged. Th=
e
+                     * next runq_insert() on this vCPU - from
+                     * rt_unit_wake() after a domain unpause,
+                     * rt_context_saved() following a delayed runq add, or
+                     * repl_timer_handler() - then places it on the run
+                     * queue because has_extratime() is now true, even
+                     * though cur_budget is 0. The very next rt_schedule()
+                     * iterates the run queue from runq_pick() and trips
+                     * the ASSERT(iter_svc->cur_budget > 0).
+                     *
+                     * Apply the same priority-demotion-and-refill that
+                     * burn_budget() would have performed if the flag had
+                     * been set when the budget ran out, clear the
+                     * depleted state, and - if the vCPU is currently on
+                     * the depleted queue - move it to the run queue so
+                     * the new extratime allocation is picked up
+                     * immediately instead of waiting for the next
+                     * replenishment.
+                     */
+                    if ( !has_extratime(svc) && svc->cur_budget <=3D 0 )
+                    {
+                        svc->priority_level++;
+                        svc->cur_budget =3D svc->budget;
+                        __clear_bit(__RTDS_depleted, &svc->flags);
+                        if ( unit_on_q(svc) )
+                        {
+                            q_remove(svc);
+                            runq_insert(ops, svc);
+                        }
+                    }
                     __set_bit(__RTDS_extratime, &svc->flags);
+                }
                 else
                     __clear_bit(__RTDS_extratime, &svc->flags);
                 spin_unlock_irqrestore(&prv->lock, flags);
--=20
2.43.0

base-commit: d6fb54fa71926e2ab44ccd84f968ec9228319d65
branch: amoi_rtds_extra_budget_par=

