Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2552617A70
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 11:00:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436189.690298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqX0M-0000v4-C7; Thu, 03 Nov 2022 09:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436189.690298; Thu, 03 Nov 2022 09:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqX0M-0000s1-8E; Thu, 03 Nov 2022 09:59:22 +0000
Received: by outflank-mailman (input) for mailman id 436189;
 Thu, 03 Nov 2022 09:59:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JfRY=3D=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oqX0L-0000rq-3j
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 09:59:21 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130073.outbound.protection.outlook.com [40.107.13.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cb64a2e-5b5e-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 10:59:18 +0100 (CET)
Received: from AM6PR10CA0094.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::35)
 by AS8PR08MB6645.eurprd08.prod.outlook.com (2603:10a6:20b:38f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 09:59:14 +0000
Received: from AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::27) by AM6PR10CA0094.outlook.office365.com
 (2603:10a6:209:8c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 09:59:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT041.mail.protection.outlook.com (100.127.140.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 09:59:13 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Thu, 03 Nov 2022 09:59:13 +0000
Received: from 1b20ef9a2768.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4027BB65-1B8D-45C1-85D3-362CC7E0588F.1; 
 Thu, 03 Nov 2022 09:59:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1b20ef9a2768.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Nov 2022 09:59:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5709.eurprd08.prod.outlook.com (2603:10a6:800:1a7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 09:59:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Thu, 3 Nov 2022
 09:59:05 +0000
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
X-Inumbo-ID: 2cb64a2e-5b5e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=d6doMZEylbqprZPDUNwYjLTZf8zpngl+6OhBNKH2Pw3upJvgPMBvIKrpQ5QSg9N+A3qJ/IDWeMqG2m4raTu+/fPBrQvfobc1wlj1Uh1uEHvl/35wIEBnqgMWyCnHhJCBUcn3fC+eHpSkST8kAuTYDcQl+SXGY9sojCyMv9KT/yLr2O5tP/hNAxyA7VDQfeZHkxdpir3X+lLRKfwHkg794rduHSIIbhzH61k+dDD+tXFovC9R1RbdV/M+rWxel3SGv3G1FROpthKNe3f1gao1MNNgYss9JoB6ouxzTMFyl02UeGtJ1TrV6D39tYYAUb3ewrfn4Oefw9Q35gBcMbR0rA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0uC2b2s3F4TvY3GnAjxpg39NUmcfSnu2oJyIz8MvhU=;
 b=JD+eigbUzvYmaUo7gHP+NGd6IfpTpe7CSqGxgrz1gasiDij/R0mQ+GXwZ6MkmVBcLdjDO9CAOJGPjw91xqa93E5G87xOqgVBszs8YVt/Pra03XeUkPlvmzvXbT9GcS9l/2ka1QI9fGwBM+4k1hEPq6Amc1CDIkZI038HJr0sz5uTBhU0ci6PK1ANlukP7/o+1Otu/UTXv/DX0RDLNWAUkolI25qRNIksiaK1RSPeXJxGNhIUVVzCadeZ+pUBsnd9Cs+03mE55OzstUeWYN7hG93cJAiOubeb8HsSVPwqhv1BmngDxuBqy4KpwG4s0pYAMU74XQHaCGLcSJOUm50YJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0uC2b2s3F4TvY3GnAjxpg39NUmcfSnu2oJyIz8MvhU=;
 b=JX13WiOOpmH6I2J05JG5qmL4RoIiO/Vp7LcfysTiqgokawdzllsbMaDoGnS7f2Nd/NM+UcMyRhATvPVFqxUS1VAxTJQ6srQpyfzqZLJ94QUBwIgLfDW+QN4zuRpxYZEs2hmqR8ryCXZfYsb+46yyfWMajNB6lED9SOHuEfjRqMU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InfAgC48BeqT4hVM5Q1MqdS41VJC2JJqtFIkayL4yADcw3l5VJIyrUiUG5UlXvqv4/6GhSulbbmB1QphvjLl83yXXPIkUZ9KuTOGZhJjX5NEVz8TntaZwjfpD874DU9lTexoYhqgwerjgipsKk2+liYD6wjmrpKzHayZ9S2wCy4Mq8u94ha2AJfgMumohd/+qyfMlGwcp26SYi+8Y6cr3Ks1QNct3sy6G4uPLLxuXrpzt7z9D/yHbbwZV/XeZFWsz5eDZ0hCW8144vHGGcc95W3YEdt2LP46/XpAvoRMk6/tKjrjHiBqTzPOFk5iXkzf7amXnwWWdnFZya5Ujir9Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0uC2b2s3F4TvY3GnAjxpg39NUmcfSnu2oJyIz8MvhU=;
 b=jo1XpLSc2FKkr3TzQCHCBf5itaI0AYke43541BGoX4zqqmYB19AZXqKoNNHk25jHpGtVFoN7JM7td+Pjv67bEjwzGK/CkK/OpV5X8vS0eX41wHnx3lQaMXaTXHooacKXb32cvg5FJL/KN0doRB7YcgIBGezFKTtLlqAjaA7UMcPNJwWK8ah2lYZvBIqdtB/PrgQ5vYtSoxXARxipvbl4lp6W1QNPU+OL9ehZCZEwuNS7IA1E0tHdQKywLyEvg6IfNr1m/pUv1Mdg710wf03q7y04bXFWM3k0QfOwx7iHtbt5gbZEeDjCnR6/ySUynEBrgrHdA14G7ChEjhK5nFzSAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0uC2b2s3F4TvY3GnAjxpg39NUmcfSnu2oJyIz8MvhU=;
 b=JX13WiOOpmH6I2J05JG5qmL4RoIiO/Vp7LcfysTiqgokawdzllsbMaDoGnS7f2Nd/NM+UcMyRhATvPVFqxUS1VAxTJQ6srQpyfzqZLJ94QUBwIgLfDW+QN4zuRpxYZEs2hmqR8ryCXZfYsb+46yyfWMajNB6lED9SOHuEfjRqMU=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>,
	"xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>
Subject: Xen 4.17 rc3
Thread-Topic: Xen 4.17 rc3
Thread-Index: AdjvatWhp23HfwW2SpaZxhLMVRhDUA==
Date: Thu, 3 Nov 2022 09:59:04 +0000
Message-ID:
 <AS8PR08MB79912EDE980BC15D842A603792389@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 714023CD61CB2B4280587CE8B5747C3A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VE1PR08MB5709:EE_|AM7EUR03FT041:EE_|AS8PR08MB6645:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b792e93-9530-4ac8-702a-08dabd820fc3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9NBG0QrMBDK4+aKiAX4DPOb03jQubPaHRmFySaCzHlRrdFBmh58i3IixSt1f0uyXPcg27y6oZE1d7MWEjR/MwGA93JIN1sjaDrXgm6PbCtvAm8DZ4sZ9N0VoHmoBCyAPhnKfNvkOzADiMt9tNoMOmCIbdTZCKj2P+rFX4hQiMdS+O7KUtX7lhkIGHtMFE0HjJs0QoLk2EW1eYTH9aLVnS19H8RReVtfaTuAmI8St1MAtBdmM+eLsL1VHPH0SJM4wroqK5VJ/CupFH5QH3iaPjlj09VxFhpSJxdYMmQr0HQr3THST63DOWvNy8UZ+bXdEmhWBzAIEhHwMGeWDOphXmPtb00SAQpwKcKs79cuYHTo4mxgeKDavP17aYwNOnuYzbN4m1+vCG8YMg05irnyoshJ6yyOBJZpYb+BJCd3ocPSysqtzpZnMfaa7sVqAyt8A9nM08h4008TEXfHndT1C4UsrRu5uzrOCCk+UvHFZ5PCRet9jlpAQVbkRVKnvuRQ4geNYVybMurl8OdC0Wn9XIv3CHsZMKayYUsfOgAtuvx/ufdnaP6aZrckAqksowto0FZy4Z0Nk8mw2kcF+GjCb+9cMhlHeR4EmCw6ZuzOtJVdGBPqDFL8eaka6Zc/RXCON5DN9RfbiVWtozelzMGuA5z/HUYXcHGhVY0U7UXfA1IC7Oyho9ZLSfBrEFkVa8YeCf0PtTcTgoV9h/vgbW6Bndc4wEZkJQcIOk08VzxJBRmCKT6C6zGxj27h8izuglXT+H3FPY/jcG7VpzAGFibctI05pHl2DTI48qFHwMb8sjAuAz/JMr0l3+DMj4YxoWTVc79W078FeRRf70d8QklQs5A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199015)(38070700005)(110136005)(478600001)(186003)(76116006)(450100002)(7696005)(2906002)(8676002)(66946007)(66556008)(71200400001)(966005)(9686003)(41300700001)(7116003)(26005)(83380400001)(5660300002)(4744005)(8936002)(66476007)(66446008)(52536014)(55016003)(6506007)(316002)(64756008)(122000001)(38100700002)(33656002)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5709
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e9a6361-1c6c-49b4-0f14-08dabd820ad0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rDfXsi8xgvMmz8QYObVqr2Edf5rCRGyrcHNLoM45plQ4EHzN/1ZlOJdWJbQEArHhoPUxb7OPPKyK4v8bmDo/Wa1TbVr0Cy4f+ofFrjmPpbRM55f9buJV0e50uuZXDCG2Jjk4w5NgXVpLu3ki46OWaP+kqZoL4QQSF/HkQaEpklHG/xhlBGKvyWLhJok9BlQA5x2OAKf1swtaAV06tHMRZKHY93w2G5ey0bpbPXylNl1l7xqMjTx2UcMHALQkQf73FTBtrxaRmdyYlUg4kgVF6A9IsCmuXQ8EPwYt3NQZA2CEEEAUrDiOyWMLsx92fJOztOMYspU95uxXm+Y4EtbO2Qb6qvMH5DrGwBbDKuQB1aTLO38mHbC1HWZr3wo06DYvSM7ahgOk26mAON5JzfQK0cm7QwMhEgfEY8LaKpBykqYI8IlJT13mCAPVdTV7Y284tGx4IkI+dN5v5BLfAaODSDr8ZGntypEct/0/lXibFe71AeNWfmNEEg6pUdlkaVLulfy15XfeRlPYUP7nBPNjluCwKJkaaffqFj4vQvXnUC1hr1XTNKftutxQO6iQ+4aJUNiyVUbJqVBgxV5DDrLW+GinCvWQ6q+JpMfkyun+IYBHvxI2N1NbiKd0pFHSerEs/U+n33fanOmjivRasYaT+EVMYdnCMLe/wwgux509QujRkYtFa5jKjYIM9NtcJb+YVp8wFf6FxPZl10Li0DakLcfu5XEEEImvtFfi/iSNWZmsGU9CFu0hYikGFGNmsWizrFXF/XfzuKnGKbPBjKeO1kRtRwj8SrsnHZSZnrmlkw8o7Ulu/7lA972/+q7BvehEGBOokHxGkUtTIcRusfsX3A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199015)(36840700001)(46966006)(40470700004)(52536014)(41300700001)(8676002)(7116003)(5660300002)(478600001)(8936002)(70586007)(110136005)(966005)(33656002)(70206006)(450100002)(40480700001)(316002)(55016003)(83380400001)(81166007)(356005)(36860700001)(82740400003)(6506007)(7696005)(86362001)(336012)(186003)(40460700003)(47076005)(9686003)(26005)(82310400005)(4744005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 09:59:13.3273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b792e93-9530-4ac8-702a-08dabd820fc3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6645

Hi all,

Xen 4.17 rc3 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.17.0-rc3

For your convenience there is also a tarball at:
https://downloads.xenproject.org/release/xen/4.17.0-rc3/xen-4.17.0-rc3.tar.=
gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.17.0-rc3/xen-4.17.0-rc3.tar.=
gz.sig

Please send bug reports and test reports to xen-devel@lists.xenproject.org.
When sending bug reports, please CC relevant maintainers and me
(Henry.Wang@arm.com).

Kind regards,
Henry

