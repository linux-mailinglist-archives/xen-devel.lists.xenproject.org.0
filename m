Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C80574A97
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 12:27:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367305.598408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBw3W-0004Nq-27; Thu, 14 Jul 2022 10:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367305.598408; Thu, 14 Jul 2022 10:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBw3V-0004LI-Vb; Thu, 14 Jul 2022 10:26:49 +0000
Received: by outflank-mailman (input) for mailman id 367305;
 Thu, 14 Jul 2022 10:26:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZjPX=XT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oBw3U-0004Eo-1K
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 10:26:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76b022ba-035f-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 12:26:46 +0200 (CEST)
Received: from FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::10)
 by DBBPR08MB6009.eurprd08.prod.outlook.com (2603:10a6:10:1f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Thu, 14 Jul
 2022 10:26:44 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::59) by FR3P281CA0077.outlook.office365.com
 (2603:10a6:d10:1f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.6 via Frontend
 Transport; Thu, 14 Jul 2022 10:26:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16 via Frontend Transport; Thu, 14 Jul 2022 10:26:43 +0000
Received: ("Tessian outbound 0ba541f03a2a:v122");
 Thu, 14 Jul 2022 10:26:43 +0000
Received: from 29e173dc9270.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E7288B6A-2FFF-4F5A-BBB4-30F04256BBBB.1; 
 Thu, 14 Jul 2022 10:26:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 29e173dc9270.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Jul 2022 10:26:37 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM6PR08MB4567.eurprd08.prod.outlook.com (2603:10a6:20b:b0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Thu, 14 Jul
 2022 10:26:36 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 10:26:36 +0000
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
X-Inumbo-ID: 76b022ba-035f-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fgtqguuO4W7xna52fzYUaqe+QscS5zO3jn2b94miYB4+YrXy7mhOr+8P1HxUzG8XgPSunC12Qrk3RTnrAlTphj0G9TuNeUwv8aaMzEdem8TAk9CBeWaqzJO6WzyYL6vf2JJ6RGzR2yTlPfQDA2Kg6VTmmFlosI5o9JwHtUj/piq8wqNJUbebpiyqg2xjyQPFzn9uQg9mH7th9MDSCGvN6kiv5hQfZKlswCat84KtFVSNapvLBN6sgiRaY7tzPX0cngK+c4OiMOjUIJWH6QCM2OadUxClfrsA93wCq+/Q0+/yPjax2oxJG0k8IyB/u0De2P0C46nujYy9FnS0wDCDsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oTIMlQg8UVVIUd34TiOjZI3QtD4f96r6dKnDq6w/PY=;
 b=DbZ/fMs8gEBZ0m8g0obepSOnXTdvkyItIqPttM1MF7rylSdS3r8xYki9/HcpLNsTTe6vGwcdcwW3JhFl3Alt2g3oupo9yXExrCVrDvpfo34a8LqutMKIA7FVG+lqJGwOCLrWqdQ6dLG+Mddh3mnwLYotKZQMDoH7EXIC0tm0zwTPRugl5oDFt/TOdSor9T2Gfgt+DFGDGX24dBHUt8Bn0BS6x/l2npM5nj9RcXkHpIddC+3Hr9HjEeqp4izGg+DApLWD3X5UXKckf8+GPHu8wPK9DbpeGyaHyGd3sNzIAyWnGSVW3v5c5otC49SOUfK7Lx3O35Vaw1LpftHNwMIyaw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4oTIMlQg8UVVIUd34TiOjZI3QtD4f96r6dKnDq6w/PY=;
 b=qUI/w5bfO9Anynx2J1pZmU43awGVJlXz3XV8WVzDmsc8HCJWivqKE2m0lsupIbY/yIjASOVBHUObpQUTtOvemlKLKuHyNEw42FDgO54OQl6Nvos+xbaHLp+uVHQCYO8kPkNeZrCN2zrYpKFnfvyjSJ689moSpq/6ppZ+x9r6YYk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2v7w5OH8jpkRNwORYM6BMyDtAuWHALlDsDFJafZxNjEDZnmmQGWYboSoLVIvsPZnC7jzywfLYmptKIQMen1lsqAOVsqHt4TpIc331P8WFYeFQBlZmSOwfmuvbseWbbfRfbwZzmfI5+CCDfPTSHpXbbn8Svsz3L/bim5luMG0ZCF1PhI5uY8I+D49zpJ8JcpxJYDP7gzTqwTyj1CHPOooFKphWSrv5em7bDlUlECTo1tH011Hu3WodPnXmlTjoHPIkxCeNcpQpi4VRv7lnYLJWWIoOA+MHwxEgsAATtk1MevD6dw95g/pyi4HSf/P+AcHfSiD0xUlMUlHtTK9+oo7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oTIMlQg8UVVIUd34TiOjZI3QtD4f96r6dKnDq6w/PY=;
 b=obKeHm0rEY/9oeZeUFrjEadyLrCP/6Q+2Bou5Ztey8Vusw7/YIdHCyXeOKcIQXA4FRPBr25JU5A0HQCKdEBlTcvR912vBm2eMxACg8qQGDBoOUXMRaKbj5jfwOiseSWFHtKbEKCZuT8+ZDs6uiLJa1o1T6PdyjKBnI1i5yORNCbwPJl1HaEn+vg2zLYH0SjiI8TlovScuC7y+ZUWFCLuGICqsV7wtcdqGXv7YlVC0fKUX7j20TScCh223gsfZ1QZC6c9Hq8+N4+ZyM+XImhfrrmTFiSsRhMiAf/c+/i1FraI8fZwwdNfabaHLccWaSXe8KSo9GJocLw+ieD+7bY0+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4oTIMlQg8UVVIUd34TiOjZI3QtD4f96r6dKnDq6w/PY=;
 b=qUI/w5bfO9Anynx2J1pZmU43awGVJlXz3XV8WVzDmsc8HCJWivqKE2m0lsupIbY/yIjASOVBHUObpQUTtOvemlKLKuHyNEw42FDgO54OQl6Nvos+xbaHLp+uVHQCYO8kPkNeZrCN2zrYpKFnfvyjSJ689moSpq/6ppZ+x9r6YYk=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Thread-Topic: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Thread-Index:
 AQHYktrASbKlS5xyGUK27wSgSLVuo616tdwAgALfc0CAAA5jAIAABItggAACa4CAAAWRQA==
Date: Thu, 14 Jul 2022 10:26:35 +0000
Message-ID:
 <PAXPR08MB7420ACF437B10A32BF09689E9E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-3-wei.chen@arm.com>
 <aff4a02b-6700-8b5e-5c2e-bf419a9e1b82@suse.com>
 <PAXPR08MB742028368F9F42899E876F759E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <a0ffb1e5-1052-1f8c-355c-5a3acf7f9da8@suse.com>
 <PAXPR08MB7420F531ECCE4106BE8227D49E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <f263956a-aa5b-e71a-ed96-c8f50ebe0d1b@suse.com>
In-Reply-To: <f263956a-aa5b-e71a-ed96-c8f50ebe0d1b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4B2395EE90CBF440BCBB3B82F5320B29.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6588c896-8bcc-4335-b487-08da6583590d
x-ms-traffictypediagnostic:
	AM6PR08MB4567:EE_|VE1EUR03FT039:EE_|DBBPR08MB6009:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bFqoWYt3FM/o/zLX8twL8KaPbpmJxgVKnlC1IN+O4WftvfvArFEu5XCtBnlgTUKUY26+zc2gPbSINf3cH5OU8AjceT2xSGgGJIqwltDRu07NI2tGTcO010gB25+n4+CKEMtj5B0a+i62aXxw7RNo+3UpmuFlKXvZGejgVLkv3y6DqAlWFJOcE0stLGArn3fSkGTnqRJpPWuOOM8BQRATs1ZYBHr5sDU2wUvfDXCH8ehzkCpsPqapfHbcE4OTxVNVugU1QFAOy9NbDWTWYawNvnTeQVQBuFkUKgqD8usLA0VwOfL2R19JHUIhfGVRlxVT2IOlW+pnENTdMrZfQWv9rrJdWMdfzJZqb8LvOBCzxIJQjeobtI/79GSOd3gqUxi8ODleUyYkfef2R7iySwnoqFgRWY0PA0dSj36774DxO//o+5keR4WSXLN7jgrApJk75/IBaPAU+WkzKDYJLzFmlyNkUCcpFzGO+P7yD1m79LE7vHD5aAIR03Pi22JYUsyCZEEjQysz5NXgVn0LWK5fd4P39l8c4p2Rp6AfrI/s7we10zcfklAfH37ZgGrtcPDkLS62hL6lDDj1nvfpNU7pzgvIZDOtHP0PNVQfXa+T5DwYUgh2tAZ1+EVp0bhz6bdeqGcD+mNb3pRDRNmukI2r9jXidw0scwT2sTHk6+QRo5S4OAzCXhF0Nu/frMgsRzHGPFpejhduwUiLboCv9GJB8DbOzUukzJCsSw/nYbwCQSFTTZHrXjI9b8YtgAl3Xvr5JPu74D+EhoIq/Rh3KchX52nOUQLGN23bS/G8r6VLpYQEplnniuNVrF+ZP4WaSyTM
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(478600001)(9686003)(66446008)(6506007)(26005)(38100700002)(54906003)(2906002)(52536014)(53546011)(8936002)(86362001)(5660300002)(33656002)(41300700001)(55016003)(66556008)(66476007)(8676002)(83380400001)(71200400001)(66946007)(122000001)(4326008)(316002)(7696005)(186003)(6916009)(38070700005)(76116006)(64756008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4567
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	828b1e3b-8b73-4d0c-3bf9-08da6583548e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H6VrKVXFahnQ7TeB78PK/o5i4vmYkhqByw/OndPf36ni2rbtIGr7TKbCPpNFWurkQqye+bJR7WUgE0jDlWzTy6Lp+ErXXOkV/qoSPcbP4y5zlm3Wx6K9kWQsmlnixXniroUiwnoFpyjSMvgLiZDY7iaCBY0UrVve8sfSATdv7k0s/5OkP95h/+aGxG4T0ymRmbu/chGpbPIpjFPxSa4OPr78/E6xWBokP8dPaDrHR/Eb7bPcV9vxlTGczSwde6+O7eb85T3badxD+mgogkpLL3JW8ZTzFoEeaFffGJa2bxkemph1SqoSt2lDMPJsuS6G41AispPCu7xLS7z3C+iiJa3KpVjkhAfB6Dgv4i5Y+TqDwqjkQj3jUHKJH8alZydlUliym+eLPaQ5fAxzHNPGZOOaP7QS2QooU+l3jbAZohe4HndEL/uxNPU3qbpeVeeyq8B0IS/idqLEJ69NruhiRDEXw/yq1LyozbO5jLTMjxdhMgLWlFH2qerAAczT/JhXFgqe6LmJDMz5NejB+nkTFd7O6YI3kKC9rqnc0L9DHkEnLGGfIK9XzHBd2f36DPLMPDIXzE41mUZc7RnxdeHVzTQu7gBCrumQkg7YAjdD3v0ItKxVbe+95I9hb1VOSMfiN2bTiqtA3yojwqJt0S802S1qEjkvLFCFcGmQSxVWArodlo7/RH5Gt5nRb36UgfYiNDPQVY6yvOqBj3x2ii16Xd01EdSw9W+OwfGssqxLqZ8Bam/MsqQhw8IPwcbsPLg3himlLqBPAiVoPW9uS//dwKuaQUu73PupiEea/pOh7ibJLON1GFMGEqphZ6/uiAyA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(36840700001)(40470700004)(26005)(9686003)(47076005)(336012)(40480700001)(53546011)(52536014)(356005)(186003)(86362001)(40460700003)(7696005)(81166007)(33656002)(2906002)(36860700001)(82310400005)(83380400001)(316002)(6862004)(8676002)(54906003)(82740400003)(8936002)(5660300002)(70586007)(55016003)(478600001)(4326008)(41300700001)(70206006)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 10:26:43.4444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6588c896-8bcc-4335-b487-08da6583590d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6009

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDfmnIgxNOaXpSAxNzo1OA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4t
DQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
Mi85XSB4ZW4veDg2OiBVc2UgZW51bWVyYXRpb25zIHRvIGluZGljYXRlIE5VTUENCj4gc3RhdHVz
DQo+IA0KPiA+DQo+ID4gSG93IGFib3V0IHVwZGF0ZSB0aGUgdGFibGUgbGlrZSB0aGlzOg0KPiA+
ICstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tKw0KPiA+IHwgIG9yaWdpbmFsICB8ICAgICAgICAgIHwgICAgICAgICAg
ICAgICAgfCAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgfA0KPiA+ICstLS0tLS0tLS0tLS0r
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0t
Kw0KPiA+IHwgbnVtYV9vZmYgICB8IHRydWUgICAgIHwgdHJ1ZSAgICAgICAgICAgfCB0cnVlICAg
ICAgICAgICB8IHRydWUgICAgICAgfA0KPiA+IHwgYWNwaV9udW1hICB8IDAgICAgICAgIHwgMSAg
ICAgICAgICAgICAgfCAtMSAgICAgICAgICAgICB8IHggICAgICAgICAgfA0KPiA+IHwgbnVtYV9m
YWtlICB8IHggICAgICAgIHwgeCAgICAgICAgICAgICAgfCB4ICAgICAgICAgICAgICB8IGZha2Vf
bm9kZXMgfA0KPiA+IHwgZW51bSBzdGF0ZSB8IG51bWFfb2ZmIHwgbnVtYV9vZmYgICAgICAgfCBu
dW1hX29mZiAgICAgICB8IG51bWFfb2ZmICAgfA0KPiA+ICstLS0tLS0tLS0tLS0rLS0tLS0tLS0t
LSstLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKw0KPiA+DQo+
ID4gKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0t
LS0tKy0tLS0tLS0tLS0tLSsNCj4gPiB8ICBvcmlnaW5hbCAgfCAgICAgICAgICAgICAgICB8ICAg
ICAgICAgICAgfCAgICAgICAgICAgICB8ICAgICAgICAgICAgfA0KPiA+ICstLS0tLS0tLS0tLS0r
LS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0r
DQo+ID4gfCBudW1hX29mZiAgIHwgZmFsc2UgICAgICAgICAgfCBmYWxzZSAgICAgIHwgZmFsc2Ug
ICAgICAgfCBmYWxzZSAgICAgIHwNCj4gPiB8IGFjcGlfbnVtYSAgfCAwICAgICAgICAgICAgICB8
IDEgICAgICAgICAgfCAtMSAgICAgICAgICB8IHggICAgICAgICAgfA0KPiA+IHwgbnVtYV9mYWtl
ICB8IHggICAgICAgICAgICAgIHwgeCAgICAgICAgICB8IHggICAgICAgICAgIHwgZmFrZV9ub2Rl
cyB8DQo+ID4gfCBlbnVtIHN0YXRlIHwgbnVtYV9md19ub2RhdGEgfCBudW1hX2Z3X29rIHwgbnVt
YV9md19iYWQgfCBudW1hX2VtdSAgIHwNCj4gPiArLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKw0KPiANCj4gV2VsbCwg
dGhpcyBtYWtlcyB0aGUgdGFibGUgY29tcGxldGUsIGJ1dCBpdCBkb2Vzbid0IGV4cGxhaW4gaG93
IHlvdSBtZWFuDQo+IHRvIGZvbGQgdGhlIHNldHRpbmdzIG9mIHRoZSB0d28gY29tbWFuZCBsaW5l
IG9wdGlvbnMgaW50byBvbmUgdmFyaWFibGUuDQo+IA0KDQpObyBtYXR0ZXIgaG93IG1hbnkgc2Vw
YXJhdGUgIm51bWE9IiBwYXJhbWV0ZXJzIGhhdmUgYmVlbiBwYXJzZWQgZnJvbQ0KQ29tbWFuZCBs
aW5lLCB0aGUgdmFsdWVzIG9mIHRoZXNlIG9yaWdpbmFsIHZhcmlhYmxlcyBhcmUgZGV0ZXJtaW5l
ZA0KYWZ0ZXIgcGFyc2luZyB0aGUgY29tbWFuZCBsaW5lLiBTbyB0aGUgZGV0ZXJtaW5lZCBzdGF0
dXMgY2FuIGJlIG1hcHBlZA0KdG8gdGhlIG5ldyBvbmUgdmFyaWFibGUgZnJvbSBhYm92ZSB0YWJs
ZS4NCg0KVGhhbmtzLA0KV2VpIENoZW4NCg0KPiBKYW4NCg==

