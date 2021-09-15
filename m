Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627AE40C77C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 16:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187744.336721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVwv-0006s5-4f; Wed, 15 Sep 2021 14:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187744.336721; Wed, 15 Sep 2021 14:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVwv-0006oz-0r; Wed, 15 Sep 2021 14:31:45 +0000
Received: by outflank-mailman (input) for mailman id 187744;
 Wed, 15 Sep 2021 14:31:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Uy1=OF=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mQVwu-0006or-61
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 14:31:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::61c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53d206ba-56fa-43f0-917c-b3305290dd78;
 Wed, 15 Sep 2021 14:31:42 +0000 (UTC)
Received: from DU2PR04CA0343.eurprd04.prod.outlook.com (2603:10a6:10:2b4::29)
 by DB7PR08MB3914.eurprd08.prod.outlook.com (2603:10a6:10:32::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 14:31:40 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::ef) by DU2PR04CA0343.outlook.office365.com
 (2603:10a6:10:2b4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 15 Sep 2021 14:31:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 15 Sep 2021 14:31:40 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Wed, 15 Sep 2021 14:31:40 +0000
Received: from 7768f521282e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EF1A9EB9-5CAD-41B1-A47E-9E76909AF479.1; 
 Wed, 15 Sep 2021 14:31:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7768f521282e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Sep 2021 14:31:33 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6653.eurprd08.prod.outlook.com (2603:10a6:102:15f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 14:31:32 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 14:31:32 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0404.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:189::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 14:31:31 +0000
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
X-Inumbo-ID: 53d206ba-56fa-43f0-917c-b3305290dd78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STGeZRz/sCVV+bj9yj0TBAhlmYRFaf/42Eo1Ncekw+o=;
 b=YOxcF+I4ObfBDmu6h68efHSgdoXJpWthEi59nuZZhJYTN5FC5L8eto8k9AJvX0M93+AH76LGraQYt9UJOemBlFgzHjlBtkYSDRvCJVJynATXBgoDs9SusHtpPIow8hQ5kyaE8R7dJXEJk9q70Mu+BPRCXVszHjVfuGkHvFTzox8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a6c22f69f37b4570
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gelrlvjbyX4Ad6oIp/bQehT+SzmgMqpUxbz+Ro4QWdwHZXRS5Voq/LDEpV7WO+h8ibD6UAmO/cbJFQ4qGTYNE19KlZAyi6DDjkz8y7paa9lc2+xAkFLE1wA8Yy6X8FIwVJ5G1TR7wcQWG2VOtMCAXPP682DR+nMkk8lB4obQQEWNcAbIu5JK54tcwxeIhTKmQDCFjAyoT9pgusJwZVLj2djZQATTCZpHuQWrWn9/y05kcfQ1LVuBX81TVlcRO20L1/LNi0Z/vVheJhrWElARA0bTEu5qoabf+YB//4bqx/fDttf3XtHjcpCsQYf3OO2HNL5BqiZ929xhvRkRcB+udQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=STGeZRz/sCVV+bj9yj0TBAhlmYRFaf/42Eo1Ncekw+o=;
 b=gyDHXRm5BPeyDM3Idi5RflS1NkRQE/4qBkqqXHRnd6LyGZw4YWcPA4GU6eh5uHvz57MLXelWKTbgT1TArHGUZCvA07xvnWUoloUoLTC+6Qe1dIngVtRHfu15h7Ziq9iif6n0e9QJSz9fVZu72M7OeOONI9kBNKad0KZ9C/QNH5mdx37PG9kBWuE/ss17RjXIaRv7RrBZZBkAS2Zh1At6z54dEhJN+wk98TZ6nkN8VSOGE5VtXndyREch+SFJ+LvaLJvc15TOrhsjUU5WGJlUPgD+DpHXuXt/19sU+axv8tj/rUPoOjzbvreCWDPtFFwDEd3jSuaCCnslrsEHp9f/4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STGeZRz/sCVV+bj9yj0TBAhlmYRFaf/42Eo1Ncekw+o=;
 b=YOxcF+I4ObfBDmu6h68efHSgdoXJpWthEi59nuZZhJYTN5FC5L8eto8k9AJvX0M93+AH76LGraQYt9UJOemBlFgzHjlBtkYSDRvCJVJynATXBgoDs9SusHtpPIow8hQ5kyaE8R7dJXEJk9q70Mu+BPRCXVszHjVfuGkHvFTzox8=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v2] xen/sched: fix sched_move_domain() for domain without
 vcpus
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210908130440.24605-1-jgross@suse.com>
Date: Wed, 15 Sep 2021 15:31:25 +0100
Cc: xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A0542AFE-A372-4AC7-A0D0-5F997422DA4B@arm.com>
References: <20210908130440.24605-1-jgross@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0404.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::13) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43b2f1f0-d62f-4939-8d4d-08d978558840
X-MS-TrafficTypeDiagnostic: PAXPR08MB6653:|DB7PR08MB3914:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB391462FE091AF62425A57DD5E4DB9@DB7PR08MB3914.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 63dZx1mVpX1OthpuRugVb0S9d/ErTQEM5Iwd+kidR63B5MkFKagDtLOf8kyL7ofEb7ku7j8As/q5DllkTNg/W2uiRzG2BRiKkOul03+chFbuI41dRTE/h6qVUkRFcoFs400snCL8oAmv6RnvTEmTARGg/mn9rin1hhX9C2rtEuggrEIneLRyC3awG3SXFrbT6y2ViGTTAXgjqbVkohFv/y3Q4FebhZb6a15XzTQEXXIIYsA84EEUdwVG33dWEPxtYWclUiUd1SPtJ7dUWojRcNi2zcbNyVsJ2PMEyfdTFvihiQ18q4+Oj4pcHt5sHDFgvvDGQVOrWiK3hYEPoOSW7ZOQpsK51xP10my4X0vyLorJIhNmTSYDn5VwnAs4mTci7KdkhuB73TBdey+tT+ceM56DpsIyBODE1L0lvUcMdfOPQ5rCPo/7aBAQHbbY82jo3DWxaOPh8YP8Vt2JTHW1jk+6m63QkTCYi4AZJ9fIB+P0M4ioTm87qZPu7p1bAgAFRzMj8pjpoYRQLdAATkLkA9erhd1Qp3NSCZdkV97wIRCPweV5Et4faJ5Lyj4tgI3RtMRnqZHGO7b8wYimuV+eS+BFE3NyjTAgXUXBrLJkxwR5FJB2Ue8a+U+uVVjSyaThD1TCgiD0XrWq68S/CtfHHhDgqzAatvz91r/jhIjOliEYhmPfTgBTtxdlrZJHllwGXd2UoJEAHpQp9jsqw4taRGprsyjlwuMJ3ESyL3B1hM4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(186003)(8936002)(6666004)(26005)(66476007)(83380400001)(33656002)(52116002)(478600001)(44832011)(36756003)(2906002)(6506007)(38100700002)(54906003)(956004)(6512007)(6916009)(4326008)(66946007)(86362001)(316002)(66556008)(53546011)(6486002)(5660300002)(8676002)(2616005)(38350700002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6653
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25561919-406b-4175-8232-08d978558326
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z30PJ1yP+kFt+irtv3unDErQzKjYHXdUMw7YXoxjrnBn56Aia/fVHoIBnXMTELYWrL2VhwUIu+gsDsh8trqq7AyJSWbdFh4EWNwcIJDcSQxekpLq72spnU177zp8M6h9eYC4DnnmPgx/AUusLiKrFZNrFzyERZ+d4qtXikIPdDlfvLL7r3rdsOkyCpCTvjSPia8SkoJWAnC1tvygVKDPt8DqQ7/NXsL4W5bg2ydDrikhjfYuaFvv55VCmJngeW7rtvyx08KO8efaAx1H6Neb5+bcW9V8Xc/ZMdeq0coxikINUm6M/iifDMYBS9pl9nohuak5ScTzeXOt4MKdHYo4duPP/z0QEyr5W4ay2HQlGN/mw4gwwpBiZt0K02p86NO8bX4gzipOjVIegpqCQfgoWJUw/WgWeCLfZfZi73e85n0N/z7oA34E3NaFna18BQxGTx5J4APe/fCIfAr6z4plkndzUF1jPGjrfOyrz/gkNgOFeprhlj0ZedQRG4+dgpcCuJkf2MJTVyXnw/Un+YR+kyOfnSwJQivS0xopSpNNvIXdeHR2Tr2PimE2cfptLyYxtxYqo3jHuRG++fRxr61x7WQPGCqsgxHe0IRuaN5ov2nmPYSTJ8xTP2H8uL82C3zrxKniri21hFwFtp3VdRRw4wKwijVFU+a3eH5KvqW3wJDjYnIigBPqR/7f58l9qM7GwibZlXbghptpkMXqNLa3aA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(36840700001)(46966006)(478600001)(86362001)(316002)(4326008)(36860700001)(47076005)(36756003)(82310400003)(54906003)(6862004)(44832011)(5660300002)(2616005)(956004)(336012)(8676002)(6486002)(53546011)(6512007)(83380400001)(8936002)(2906002)(6666004)(70586007)(70206006)(186003)(26005)(82740400003)(81166007)(356005)(33656002)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 14:31:40.3051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b2f1f0-d62f-4939-8d4d-08d978558840
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3914



> On 8 Sep 2021, at 14:04, Juergen Gross <jgross@suse.com> wrote:
>=20
> In case a domain is created with a cpupool other than Pool-0 specified
> it will be moved to that cpupool before any vcpus are allocated.
>=20
> This will lead to a NULL pointer dereference in sched_move_domain().
>=20
> Fix that by tolerating vcpus not being allocated yet.
>=20
> Fixes: 70fadc41635b9b6 ("xen/cpupool: support moving domain between cpupo=
ols with different granularity")
> Reported-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Luca Fancellu <Luca.fancellu@arm.com>

> ---
> V2:
> - Only test for vcpu[0] not being present (Jan Beulich)
> ---
> xen/common/sched/core.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 8d178baf3d..8f4b1ca10d 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -651,7 +651,7 @@ int sched_move_domain(struct domain *d, struct cpupoo=
l *c)
>     struct scheduler *old_ops =3D dom_scheduler(d);
>     void *old_domdata;
>     unsigned int gran =3D cpupool_get_granularity(c);
> -    unsigned int n_units =3D DIV_ROUND_UP(d->max_vcpus, gran);
> +    unsigned int n_units =3D d->vcpu[0] ? DIV_ROUND_UP(d->max_vcpus, gra=
n) : 0;
>     int ret =3D 0;
>=20
>     for_each_vcpu ( d, v )
> --=20
> 2.26.2
>=20
>=20


