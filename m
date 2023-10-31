Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5622D7DD00D
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 16:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625886.975638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxqRg-0005AD-Vy; Tue, 31 Oct 2023 15:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625886.975638; Tue, 31 Oct 2023 15:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxqRg-00057j-TB; Tue, 31 Oct 2023 15:14:20 +0000
Received: by outflank-mailman (input) for mailman id 625886;
 Tue, 31 Oct 2023 15:14:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1/u=GN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qxqRe-00056T-UG
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 15:14:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28e324fc-7800-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 16:14:18 +0100 (CET)
Received: from AM0PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:208:3e::22)
 by DU0PR08MB8067.eurprd08.prod.outlook.com (2603:10a6:10:3ea::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 15:14:04 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::c5) by AM0PR02CA0009.outlook.office365.com
 (2603:10a6:208:3e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28 via Frontend
 Transport; Tue, 31 Oct 2023 15:14:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Tue, 31 Oct 2023 15:14:04 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Tue, 31 Oct 2023 15:14:03 +0000
Received: from 3b219594fa67.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3D1EF215-83D2-4D46-BAB0-DF9F895DEDEA.1; 
 Tue, 31 Oct 2023 15:12:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3b219594fa67.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Oct 2023 15:12:52 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAVPR08MB9458.eurprd08.prod.outlook.com (2603:10a6:102:318::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 15:12:50 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866%3]) with mapi id 15.20.6933.022; Tue, 31 Oct 2023
 15:12:49 +0000
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
X-Inumbo-ID: 28e324fc-7800-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iBz+jZNLh+EkchED5TRmd40FBrTxCXKQTfAO33T82RuQZVGX/viTHkkviFCQpDqvExp/tA7KPsxjg0EqcbW1qj4q7Qt2XimFw8+s/1CNu5R/f5VgEurCrbZRm7+o2jsolnUjPXM0K72hkqAyZCp4oucEbwrOOs9ydntLsCKrBITPEmZJGGdO1LaGLdPLP8n0MXEzs9Q/EItyUAOiyEdWhPUo7EpI9KwpQFTZ/kkI9wDJmxNDoJnuWWBK/taYs9tmdIWgnHnJkTeUdUFjDt8poxPjreVqqCaaYbj/7V1eTgcA2ciDa1fGHaGuyn/q/u/VM3peFHLVvW8OqrI/FyxxXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1T7yeauCTR7omGi+XgRXjd0oVPLCF1kXscxWhae86wg=;
 b=SLPZkVVfvu/h0uzg74mNUOTYvJ4fxS5IXo/uEXIqpw7F1bsFZBdWoMeQUOBo4eFYw5RbGKm6C8Ymb+YWxI65j92T0fBTG15D/aweLgdZc1mZOUYDZcmIu5xfr4kS75vzW8yjABpRU6YYZAGpb3CK/JPEJZ2thQ6qxUkxTDqgjiupljdIjKmtccfuDCUTX4lCAGb6qIYZ47orwCNCiO82DE98JpPHO7Px2+t8PvkSrsuLTuVl+XSk/utcF9FAD8w3Q+wAL7iycKP7x5pvKnSjpSNmN+UutAR/Khe5HV7QhLriYgPDzbLg29ia9pXMazIPh0STrpQfGEzZ1FAysThXbg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1T7yeauCTR7omGi+XgRXjd0oVPLCF1kXscxWhae86wg=;
 b=24NOpMy+s5KUT0/dt2M+Ezt4y6/MyJ0Z/jqS5x63390QS8RsqYPNJkeUm2R0C76C6sIM9cLeNf+v9H3DjjgD+yWLtYok63MKmDgsDrAdQterIZN4mSaLbHavcYe6vz9NZLFLfOOlAh2XUKmFJDEmpk1r6y25f4Qcsf3QCju38Rw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0103d7e31d853c78
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRLDCkXy3wgQ3W1JAW5yONX9sO3JW/Qzs+hQb8VmbyAjYM28HCuKrtBIJyf7u3ZHhkkSKL4u2mkBm4DNe2s284bQZ13IW4mdIXIFE+8nH0QEtbIZuh8E+DjZwfjIXm9e+WrQK20vksF+SGUWbAlI9JaWfTtuwVGcEWAaJvQVP5czFd5jHRz+5X0XYHsgLZL4QVLIn9850DOJqhfR0tkk3vlk13cB7IkeHkMAqEMn7CkrmXM3Fz79zEbALeXLp7V2XFP9lVzmb2BmwYR75hOgxnRClTpNeeG2z2+N32ORuQGz7alpDbwlFXfcuAvDj0673lxVyxrP6GFR8bKrK6B3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1T7yeauCTR7omGi+XgRXjd0oVPLCF1kXscxWhae86wg=;
 b=T2/yZio/UG+LDCI78Lpky/skOAkZ5TGlOjt3LUz+J9eqnrfX3vPs+NWjUehnpSCcg0it2azjgqp4cVw1KdUMcHf4x3LzAG3wZM/XY5QkFKB1QNk2M00V0kSmrOeDHhNWNab3L0/7HjEmBdrz0A2LJYHIB0q5jgcJOI4z6bHCJlLt609RQNIbaOpz7kvdeUQMAU4AZUDEVaFkoBBcFLTrP9Fv6AaMcqU0rE206w4XG1OJOxgcEzDRjIt2tTPhBpgfzJbAqKnt9FHmEqjnXPryYUBatuc6T7F6io7b69RZmQgwFukNoC+11/Sx4THpNwH0tc7JrPXSqZBzECaDTdnz1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1T7yeauCTR7omGi+XgRXjd0oVPLCF1kXscxWhae86wg=;
 b=24NOpMy+s5KUT0/dt2M+Ezt4y6/MyJ0Z/jqS5x63390QS8RsqYPNJkeUm2R0C76C6sIM9cLeNf+v9H3DjjgD+yWLtYok63MKmDgsDrAdQterIZN4mSaLbHavcYe6vz9NZLFLfOOlAh2XUKmFJDEmpk1r6y25f4Qcsf3QCju38Rw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, "xenia.ragiadakou@amd.com"
	<xenia.ragiadakou@amd.com>, "ayan.kumar.halder@amd.com"
	<ayan.kumar.halder@amd.com>, "consulting@bugseng.com"
	<consulting@bugseng.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v5] xen: Add deviations for MISRA C:2012
 Rule 7.1
Thread-Topic: [XEN PATCH][for-4.19 v5] xen: Add deviations for MISRA C:2012
 Rule 7.1
Thread-Index: AQHaC/4b2xNoaiIkmUiyfHAuabY8yrBj8OgAgAAP5gCAAACVgA==
Date: Tue, 31 Oct 2023 15:12:49 +0000
Message-ID: <E0FA2717-D06B-4C51-9E9A-DBD72CE35963@arm.com>
References:
 <0c86b50a796ba2aaab01e30935ed559ab719d33a.1698418578.git.nicola.vetrini@bugseng.com>
 <98da41d4-f818-44c7-bd3c-b3e3b224ff0d@xen.org>
 <alpine.DEB.2.22.394.2310301544460.1625118@ubuntu-linux-20-04-desktop>
 <ee3c415d-bedd-432e-bf31-6e806b9cf976@xen.org>
 <DFC25ACE-FFBE-43CF-9CE2-90671D122CEC@arm.com>
 <2201cad3353f5deb567f929e91e90fd2@bugseng.com>
In-Reply-To: <2201cad3353f5deb567f929e91e90fd2@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAVPR08MB9458:EE_|AMS1EPF00000042:EE_|DU0PR08MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 548d0b84-7c0a-4e8f-5c00-08dbda240526
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sF2NGbybo87/G3A/Ef9fGpjfUbNOqGeGKYRUChCsvg8tac8aDxE6hMMP7aU4WYPwkZuG1WtnCnBgFA01SwtSsbXadgY0nKTgp+xPbO6kSI2gae39j0angt8/3cORaffd6vGvc4fib0hIOqmitWBu/gv8ye+RgIMd1f5LjWRf0J6t9I1Mi0fKjW9VTg0f8mebHs0HRHJWsdZMzeurxBlUiaNcbtArOiQC1ljfGschY6LWP5U18ySzqBSHmYfWowmFSE3Yvdjo1kZygt+iUQ2iFx7wuq6q11+IzdmkXAQuxGPtoy7VuEAWohWJE2eAdGi0jmb/GUh0FHUaoc19fjQ52DrVtp7JHLHDdC7iMwWieBERrHyFqE6a0l0ekhZZP683evMQyuWw1G7i94Qivxak0f5mSj7HV2IGY0ai04PWMPNxmAthsravwtyJ3P4mAl4pkOQdCLMT5+rGN0D22V3VpC3yUzNjcl4owdk9LqgYCf0mKQqItqAlLdAp/SMrBPMrLzTLxRByHqbmWD+YOaXZu1hdTxZTgZ/8bHf1UHv14YSA18wqEY64s7qjcilgKvrPceq7iQ8cuJwY9S7LySmDhP+xZbiYZiPrM2g6eaHNlVlkjtCBCWxxCHrTaROrLFF/AxHcRE7HTjr7Aiuh/zms1A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6506007)(2906002)(4001150100001)(7416002)(6486002)(71200400001)(6512007)(478600001)(86362001)(33656002)(38070700009)(36756003)(122000001)(2616005)(66556008)(66946007)(26005)(38100700002)(76116006)(53546011)(5660300002)(91956017)(316002)(6916009)(64756008)(66446008)(54906003)(66476007)(41300700001)(8676002)(8936002)(83380400001)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DC9EC522683EB4A88CA3DC4A6B8558C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9458
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	459d0eb7-6387-4c7c-b487-08dbda23d8c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qqioSQTv9gCy8ofkHZMfdKPWv3bfRyukJ+EgxAh4dlI2/9ovz5Omjsq7fOIajZA43eN9nJFXYPip43/Q7jf9CjvOWmFILnTC6Idwg/y7nvpZuyF6QofMvbv/iuRV8fpsf2FQdV2r0mUMbBe3PnyWS/eE5TcMphMDzZcoBdhUPyWkYb+imS4FDgZnENp55o0je4JSJEL4CfG9/E8nNLBCBthYVMCDoWIqSXuHeIlygMGbG7miZtD6Qm1KOKyoTD5isYenm/FIeRLmseIkLJbjyKAzFRiZDgAR04XPsV5pR1rZ6KSRz/sb+hqOqFJQ7eTixKgqQqOYlBpmocxuPTj0unwXcu3m3+RXG7tyi0hJuLo8xjsn3VyOQv/SqmH5R5KK743euTT59TWVWk2IAW60xH3JPyjZUAhVMNcudApGeeC6hEhXSa0oMH2CQnLhRP3j6yStWRq3tYzfRbIY7XJKG9BTVUNrPkHEclAWffebQPU0WwEzi42QutsHCz2Gdl1quDd9OxNMtD8nEfU6bEYFF3CP3FmIBJFSQZuiTCUSHU+P58PBfm6zxet3csZKHGMbtNODfM4WiIOiJp82rw6STKQz9jZy1p2ZKC4kJn0K1362Y3y70kMMo1zXKdTrb9Zg0STTU46M+fS1Buvbf/pgNXVyjyRDxRoc5TPCSTN7u+ZZ68U1PQL2BQ9c01GxDcI4sFtUQC7lNv+VOLZUFEtffK7XohjRYUsoqzY3IwE33eI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(82310400011)(36840700001)(46966006)(40470700004)(40460700003)(40480700001)(53546011)(33656002)(336012)(6506007)(36756003)(86362001)(2616005)(26005)(6512007)(4001150100001)(36860700001)(83380400001)(47076005)(81166007)(356005)(82740400003)(6486002)(2906002)(478600001)(54906003)(41300700001)(316002)(70586007)(70206006)(4326008)(5660300002)(6862004)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 15:14:04.2353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 548d0b84-7c0a-4e8f-5c00-08dbda240526
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8067

DQoNCj4gT24gMzEgT2N0IDIwMjMsIGF0IDE1OjEwLCBOaWNvbGEgVmV0cmluaSA8bmljb2xhLnZl
dHJpbmlAYnVnc2VuZy5jb20+IHdyb3RlOg0KPiANCj4gT24gMjAyMy0xMC0zMSAxNToxMywgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+PiBPbiAzMSBPY3QgMjAyMywgYXQgMTM6MjcsIEp1bGllbiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IEhpIFN0ZWZhbm8sDQo+Pj4gT24gMzAv
MTAvMjAyMyAyMjo0OSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+PiBPbiBNb24sIDMw
IE9jdCAyMDIzLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+PiBIaSBOaWNvbGEsDQo+Pj4+PiBP
biAyNy8xMC8yMDIzIDE2OjExLCBOaWNvbGEgVmV0cmluaSB3cm90ZToNCj4+Pj4+PiBkaWZmIC0t
Z2l0IGEvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdCBiL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5y
c3QNCj4+Pj4+PiBpbmRleCA4NTExYTE4OTI1M2IuLjhhYWFhMTQ3M2ZiNCAxMDA2NDQNCj4+Pj4+
PiAtLS0gYS9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+Pj4+Pj4gKysrIGIvZG9jcy9taXNy
YS9kZXZpYXRpb25zLnJzdA0KPj4+Pj4+IEBAIC05MCw2ICs5MCwxMyBAQCBEZXZpYXRpb25zIHJl
bGF0ZWQgdG8gTUlTUkEgQzoyMDEyIFJ1bGVzOg0KPj4+Pj4+ICAgICAgICAgICAtIF9fZW11bGF0
ZV8yb3AgYW5kIF9fZW11bGF0ZV8yb3Bfbm9ieXRlDQo+Pj4+Pj4gICAgICAgICAgIC0gcmVhZF9k
ZWJ1Z3JlZyBhbmQgd3JpdGVfZGVidWdyZWcNCj4+Pj4+PiAgKyAgICogLSBSNy4xDQo+Pj4+Pj4g
KyAgICAgLSBJdCBpcyBzYWZlIHRvIHVzZSBjZXJ0YWluIG9jdGFsIGNvbnN0YW50cyB0aGUgd2F5
IHRoZXkgYXJlIGRlZmluZWQNCj4+Pj4+PiArICAgICAgIGluIHNwZWNpZmljYXRpb25zLCBtYW51
YWxzLCBhbmQgYWxnb3JpdGhtIGRlc2NyaXB0aW9ucy4gU3VjaCBwbGFjZXMNCj4+Pj4+PiArICAg
ICAgIGFyZSBtYXJrZWQgc2FmZSB3aXRoIGEgL1wqIG9jdGFsLW9rIFwqLyBpbi1jb2RlIGNvbW1l
bnQsIG9yIHdpdGggYQ0KPj4+Pj4+IFNBRg0KPj4+Pj4+ICsgICAgICAgY29tbWVudCAoc2VlIHNh
ZmUuanNvbikuDQo+Pj4+PiBSZWFkaW5nIHRoaXMsIGl0IGlzIHVuY2xlYXIgdG8gbWUgd2h5IHdl
IGhhdmUgdHdvIHdheXMgdG8gZGV2aWF0ZSB0aGUgcnVsZQ0KPj4+Pj4gcjcuMS4gQW5kIG1vcmUg
aW1wb3J0YW50ZWx5LCBob3cgd291bGQgdGhlIGRldmVsb3BwZXIgZGVjaWRlIHdoaWNoIG9uZSB0
byB1c2U/DQo+Pj4+IEkgYWdyZWUgd2l0aCB5b3Ugb24gdGhpcyBhbmQgd2Ugd2VyZSBkaXNjdXNz
aW5nIHRoaXMgdG9waWMganVzdCB0aGlzDQo+Pj4+IG1vcm5pbmcgaW4gdGhlIEZVU0EgY29tbXVu
aXR5IGNhbGwuIEkgdGhpbmsgd2UgbmVlZCBhIHdheSB0byBkbyB0aGlzDQo+Pj4+IHdpdGggdGhl
IFNBRiBmcmFtZXdvcms6DQo+Pj4+IGlmIChzb21lIGNvZGUgd2l0aCB2aW9sYXRpb24pIC8qIFNB
Ri14eC1zYWZlICovDQo+Pj4+IFRoaXMgZG9lc24ndCB3b3JrIHRvZGF5IHVuZm9ydHVuYXRlbHku
IEl0IGNhbiBvbmx5IGJlIGRvbmUgdGhpcyB3YXk6DQo+Pj4+IC8qIFNBRi14eC1zYWZlICovDQo+
Pj4+IGlmIChzb21lIGNvZGUgd2l0aCB2aW9sYXRpb24pDQo+Pj4+IFdoaWNoIGlzIG5vdCBhbHdh
eXMgZGVzaXJhYmxlLiBvY3RhbC1vayBpcyBqdXN0IGFuIGFkLWhvYyBzb2x1dGlvbiBmb3INCj4+
Pj4gb25lIHNwZWNpZmljIHZpb2xhdGlvbiBidXQgd2UgbmVlZCBhIGdlbmVyaWMgd2F5IHRvIGRv
IHRoaXMuIEx1Y2EgaXMNCj4+Pj4gaW52ZXN0aWdhdGluZyBwb3NzaWJsZSB3YXlzIHRvIHN1cHBv
cnQgdGhlIHByZXZpb3VzIGZvcm1hdCBpbiBTQUYuDQo+Pj4gV2h5IGNhbid0IHdlIHVzZSBvY3Rh
bC1vayBldmVyeXdoZXJlIGZvciBub3c/IE15IHBvaW50IGhlcmUgaXMgdG8gbWFrZSBzaW1wbGUg
Zm9yIHRoZSBkZXZlbG9wcGVyIHRvIGtub3cgd2hhdCB0byB1c2UuDQo+Pj4+IEkgdGhpbmsgd2Ug
c2hvdWxkIHRha2UgdGhpcyBwYXRjaCBmb3Igbm93IGFuZCBoYXJtb25pemUgaXQgb25jZSBTQUYg
aXMNCj4+Pj4gaW1wcm92ZWQuDQo+Pj4gVGhlIGRlc2NyaXB0aW9uIG9mIHRoZSBkZXZpYXRpb24g
bmVlZHMgc29tZSBpbXByb3ZlbWVudC4gVG8gZ2l2ZSBhbiBleGFtcGxlLCB3aXRoIHRoZSBjdXJy
ZW50IHdvcmRpbmcsIG9uZSBjb3VsZCB0aGV5IGNhbiB1c2Ugb2N0YWwtb2sgZXZlcnl3aGVyZS4g
QnV0IGFib3ZlLCB5b3UgYXJlIGltcGx5aW5nIHRoYXQgU0FGLXh4LXNhZmUgc2hvdWxkIGJlDQo+
Pj4gcHJlZmVycmVkLg0KPj4+IEkgd291bGQgc3RpbGwgc3Ryb25nbHkgcHJlZmVyIGlmIHdlIHVz
ZSBvY3RhbC1vayBldmVyeXdoZXJlIGJlY2F1c2UgdGhpcyBpcyBzaW1wbGUgdG8gcmVtZW1iZXIu
IEJ1dCBpZiB0aGUgb3RoZXIgYXJlIGhhcHB5IHRvIGhhdmUgYm90aCBTQUYtWFggYW5kIG9jdGFs
LW9rLCB0aGVuIHRoZSBkZXNjcmlwdGlvbiBuZWVkcyB0byBiZSBjb21wbGV0ZWx5IHVuYW1iaWd1
b3VzIGFuZCB0aGUgcGF0Y2ggc2hvdWxkIGNvbnRhaW4gc29tZSBleHBsYW5hdGlvbiB3aHkgd2Ug
aGF2ZSB0d28gZGlmZmVyZW50IHdheXMgdG8gZGV2aWF0ZS4NCj4+IFdvdWxkIGl0IGJlIG9rIHRv
IGhhdmUgYm90aCwgZm9yIGV4YW1wbGU6IC8qIFNBRi1YWC1zYWZlIG9jdGFsLW9rICovDQo+PiBT
byB0aGF0IHRoZSBzdXBwcmVzc2lvbiBlbmdpbmUgZG8gd2hhdCBpdCBzaG91bGQgKGN1cnJlbnRs
eSBpdCBkb2VzbuKAmXQgc3VwcHJlc3MgdGhlIHNhbWUgbGluZSwgYnV0IHdlIGNvdWxkIGRvIHNv
bWV0aGluZyBhYm91dCBpdCkgYW5kIHRoZSBkZXZlbG9wZXINCj4+IGhhcyBhIHdheSB0byB1bmRl
cnN0YW5kIHdoYXQgaXMgdGhlIHZpb2xhdGlvbiBoZXJlIHdpdGhvdXQgZ29pbmcgdG8gdGhlIGp1
c3RpZmljYXRpb24gZGF0YWJhc2UuDQo+IA0KPiBJIGd1ZXNzLiBJdCBjb3VsZCBvdmVyZmxvdyB0
aGUgODAtY2hhciBsaW1pdCBpbiB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uaCwgdGhvdWdoLg0K
DQpZZWFoLCBidXQgd2UgY291bGQgcnVsZSBvdXQgc29tZXRoaW5nIGluIGNvZGVfc3R5bGUgdG8g
YWxsb3cgb25seSB0aGlzIGtpbmQgb2YgdHJhaWxpbmcgY29tbWVudHMgdG8gZXhjZWVkIHRoZSA4
MCBjaGFycw0KDQo+IA0KPiAtLSANCj4gTmljb2xhIFZldHJpbmksIEJTYw0KPiBTb2Z0d2FyZSBF
bmdpbmVlciwgQlVHU0VORyBzcmwgKGh0dHBzOi8vYnVnc2VuZy5jb20pDQoNCg==

