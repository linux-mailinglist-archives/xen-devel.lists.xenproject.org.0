Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E355A0D11
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 11:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393208.632012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR9Tg-0008KT-R9; Thu, 25 Aug 2022 09:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393208.632012; Thu, 25 Aug 2022 09:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR9Tg-0008I2-O1; Thu, 25 Aug 2022 09:48:44 +0000
Received: by outflank-mailman (input) for mailman id 393208;
 Thu, 25 Aug 2022 09:48:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9hs=Y5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oR9Tf-0008Hg-8T
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 09:48:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a5a51e5-245b-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 11:48:42 +0200 (CEST)
Received: from DBBPR09CA0032.eurprd09.prod.outlook.com (2603:10a6:10:d4::20)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Thu, 25 Aug
 2022 09:48:34 +0000
Received: from DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::ba) by DBBPR09CA0032.outlook.office365.com
 (2603:10a6:10:d4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Thu, 25 Aug 2022 09:48:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT053.mail.protection.outlook.com (100.127.142.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Thu, 25 Aug 2022 09:48:33 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Thu, 25 Aug 2022 09:48:33 +0000
Received: from 4fccc3fc328b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B026A8B8-1B82-4997-AF7F-3F4AAA0406BF.1; 
 Thu, 25 Aug 2022 09:48:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4fccc3fc328b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 Aug 2022 09:48:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PR2PR08MB4841.eurprd08.prod.outlook.com (2603:10a6:101:27::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Thu, 25 Aug
 2022 09:48:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Thu, 25 Aug 2022
 09:48:19 +0000
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
X-Inumbo-ID: 1a5a51e5-245b-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KDoB7M4BqeEMfybHr1e0O2Oh7OibLaKmwlIHH13G3u6ncY9AYleoWv7F9SCMGbzKFcCxwglnU/PZ7SgnZ42u/cnYDNVAFGR/EemYw487+5lgrFvLDUsI8J2e2olX0zHPWO/nL5+wLPwW5PizO0n77XM9F+eXk0onoJiACcm8tbaMKfUrPSnBU6LKZxqGU37XP3MPZAaFQA79Fg/FXyR5NVE50PCOUkDkP99gcS9swR/o6JEJR6UPbsrpsqoGBu7vvEHzfO2BW2P5owGYu1LWHIWBA0rWZMQ+NrQHalC0qPya/f7MZdT2ggVAq4Hu4M836OOq6aHKGeOqoiu1Cjs8EQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLCXELMOwsk2k7Sk5WrT4UcdkjlSSCOUF7vBXp8cMwA=;
 b=iORxbl1YSW9wEIU7ZlXBF4o1o64PGlNolponZHIL6GSDa+cnQvralcc8QNPVYcSLfv8y6hOmZpXsPsqvsH9GNzkadoEtlDF7MB7zMB5pFaWL0it1Jw7TCZ6I5YW4nPAHqXpfTNYGIpN8+2QA88xQJvEAcFAR4kn3e6Go541h8JUTutj6pKnV/mDRWgcQDcFtv5Oh8Zd5iloXQZlue7SVdkJJfLV12I24bLfFag2VG5D5abADlHFOqZzyYkMLNooDpQ9k3KcPT53VEtpnFmu+p2u3zfKKbmb1/JwvP6NpO+v1uTGi+Y59vUYoqDvUVusqnF6ZjINTmETqUc4ouuvYOg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLCXELMOwsk2k7Sk5WrT4UcdkjlSSCOUF7vBXp8cMwA=;
 b=56Hq6O5yaytAilkV0D8gKdRj276kRhdSJMq2gIKUcSDPiUx0l0edSh03bp3y0cAnLDnSZZNhKcQW4WQOFhgtEbVbm75rtfmhT9igcEGtkCZXMmWoVfqfaXg2foVGjWGMOZBkUMQSi/WqqBu41zgiDJdQcriJeW0ZLmgr66y6KNM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a72839cd45d07110
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRAhPLxSNTyB5IFhjRs1Y+ubtQr7rs652BeJ+lFx2bjDn31B9p9wiaTCkL9GY6N8SQgNxsq2yYZBxPKS6J7SAOkP0xaIeuQ5PF80AVZ4/DgQO+QcNRlxdd+1LGHzFlK1d4dsXVS3ujAbhkk1KZd6SfgQTsMZ/r1rTkb9VDYZ/OSFjL/grvPSXB7Anx3rwQHkUFIixzKKuzzsRjqYrpP8h0Tau1ALts3K64G7kpBB1+VN0qFnwFkOZJg8g+MoA0R7COaKdRGbAb+ZbZ5s0kLktk88SS1SkJyAeoTaojslQxtlKS683nzI3XtxCl5dDFoMlSQFmyeOZMgdzOUJeocSMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLCXELMOwsk2k7Sk5WrT4UcdkjlSSCOUF7vBXp8cMwA=;
 b=fPQw6xOuBuOZiFrBqTZEOr96siquRRl9KbyjEMy6LJyg8AVqiduRrmZBAQ28ptNft2u7Aig+bBokrB5AuTOXvwW2K4zMI7jrvx/uutwFuCggF7u4eI8ah/ctIyaozGOpAnQpSGFyYWDkXOqG5FP8kk8tnW+nxbJHDnH+qf4UqoDKsx9mD0RIwiELH1PG3D+UqB/fZwxcrN67yMOJZJvaxpMOeky97hCYi9BGlj5F/tohZYCT8osvGFCldtgClBLV0X0fpaoOMHhDnkEnZ+r/T1r6WukmWSGOQO2f12RLmE4WQf+Tj3wAHrvIfODMlnRnSqBcxeZILqjNVJl4QFmLWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLCXELMOwsk2k7Sk5WrT4UcdkjlSSCOUF7vBXp8cMwA=;
 b=56Hq6O5yaytAilkV0D8gKdRj276kRhdSJMq2gIKUcSDPiUx0l0edSh03bp3y0cAnLDnSZZNhKcQW4WQOFhgtEbVbm75rtfmhT9igcEGtkCZXMmWoVfqfaXg2foVGjWGMOZBkUMQSi/WqqBu41zgiDJdQcriJeW0ZLmgr66y6KNM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Rahul Singh
	<Rahul.Singh@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index:
 AQHYs7NVsywB9ZS1YkG+gj2FUNdLeq28SEyAgAG2wYCAAAw/gIAAHKuAgAAPTYCAABB2AIAAWmwAgAAL9QCAACl/gIAAbLmAgAAg9QCAAALsAA==
Date: Thu, 25 Aug 2022 09:48:19 +0000
Message-ID: <35C21FDE-5648-425A-9399-1C5E2B9A37FB@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <2fb69ff7cf9a36dd1294da4f9f4b968ff7076d42.1660902588.git.rahul.singh@arm.com>
 <d5ed6097-8a08-eb4d-35a0-ab28f82b881f@xen.org>
 <1E823DBF-8576-4E26-B12D-B69CE581F36F@arm.com>
 <c9330b72-193c-5478-9bad-9593ac7398a9@xen.org>
 <3D33311C-5FBA-4C46-A18F-105DE814C306@arm.com>
 <685e53cc-1b83-8d66-7086-dad4135c0587@xen.org>
 <474E0887-7EFC-4A0C-9815-DFBDAE9A93A9@arm.com>
 <alpine.DEB.2.22.394.2208241439220.15247@ubuntu-linux-20-04-desktop>
 <da07bb5d-98c3-9c94-a1f0-6021e398f898@xen.org>
 <alpine.DEB.2.22.394.2208241810390.15247@ubuntu-linux-20-04-desktop>
 <646CFFC2-9259-45C8-89AB-D59AA5B0DBC1@arm.com>
 <32a74a0a-9f4f-7b3a-622b-6fb5e9a097b0@xen.org>
In-Reply-To: <32a74a0a-9f4f-7b3a-622b-6fb5e9a097b0@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: dc9e1e28-30ef-46b6-1ee3-08da867ef995
x-ms-traffictypediagnostic:
	PR2PR08MB4841:EE_|DBAEUR03FT053:EE_|AM5PR0801MB2033:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jloCpGqy7LUbw1EBuXyuX85bkA/V9wNOmlyOKgXodIW0ZzrDDSbdictt0h8c8nmCPYxnBS9NhNlbbDAi8D2O+KEq8jkr88ZVP3taMlRSDkLAsD/yH/WyP9p4oEy+rtRLxZ5cS0Bkvlef55LmUgfj7lAbH7JKGGGGnAG9ROAOYXXKsKrPZlCCZm7M+r3YaVE+AEKtnOfQ2YCm+tuTB/6mdMTgiFaxcDG1u/u42tW2e3KawOX4fLJh0YekfaX5/Tx4eI/wz9xAqwDYPB8bfcUJc6cUiFd7kUzP5DBgHEP8DsYXrJF8mbicG6D+1KVFSw/z2/aLlcMveLTPxXkXkFDDhOJU2mfWjcIkur1Yh3kUE4eLdfinpj8YkjszxmwPVg8VY7oY3xRVhfp23ZiR+5Pzm5p5YG8tRMgcSTZXI7bsfu299z1Q6rSmdY3TNUbM2IGlt7uc9joU7b/tE2eKNpX5RsroGFq2xQWpRGZ/rvA+Gdbt0IC5CXMGKYOxkDOL40xM4q5cHunP3TXk479pW+TiES2S5lavAcR6H+5JP/fcX4WDPmYfnDP8RX+NLm2c7XD/cDkjUFmuZ4KZzb8H06smqItm46apWUVRUxT1nEQLcoG7zJ5zzdMsZZssnhjKzqqcLsgcMssXYtRlZgh13HtLAkr4ICCmt2yP7V4jDvZw43qgU3VV67qyo6kUmvCjg9zy0w3fP9mLHxncyTTgNjCyJn89+JnoWfoydRkOatejZzX3Bwi6aoEaS5hjGWmKOZAIhIGD9g7S6vD4ehN1UJY86QwVE17lNzn6Bxx0wc6jrqU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(6486002)(41300700001)(71200400001)(6506007)(186003)(478600001)(6512007)(83380400001)(5660300002)(26005)(2906002)(53546011)(2616005)(316002)(91956017)(6916009)(54906003)(36756003)(66476007)(66946007)(66446008)(86362001)(76116006)(8676002)(4326008)(122000001)(64756008)(8936002)(38070700005)(33656002)(66556008)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCB81E4DA274B74EB15100F1E54DDB2A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4841
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9699e267-ccdf-45d9-7bb3-08da867ef0f3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pfpGgiGdpm1wlYZYELRLBQ7FpvJuMyAya5dglJbHyIxvB0B7xbiaX+bGXnF7Q6yUOVrSorymtH9ga05vQ/45ovaOWRyPz373j3xYG5AJ8s9bZ0sDTh1cmnkstZmH82RAxir9tg/TzQiiSSWFRd8+vyAqbW4wxgoR22cvOmArxWsFHHYSsx2bIHb6kFNDb1UuHJ7M1TVDALiyQmHiEly459npw5ULc1ltrKvXOjNpDV2smckAcsKJzHmht/wp40ITLwWBMnDhqqpiIv0FI9B6NxxrpSuikoqZI4kVuT3AB8OM8DqtTu05ayDJ6cI/Fzslw73wst/+jyXDCPmFxbI5/piiD9pzSbQrIMBp4tiEj8Lw3MYtDOsCXXngUgfm/pNWuqAFUSbSosoL+Q54ZwJDQWnkZ57TicyPfnBD38O4iaKQsiP8TkfN8NuOYs48DKxZ1fsOlxHlzzGhFXpfAvAcvbJ7DwOLG8ezOuSwGZkqpMMtEoKmJHq8BTXX2QIT3Au4xh7kz7DX3vudDIm4hSnv8CtCjUkq0qubCZF3d9Oy0LqeH1d1upZgDLYdUyAu+tps3CZbgvnZpA/wQAUTyvIJuGwdr4sl/iXj37Vpppm/t6Pp1B6DBRp+9YVrC1op41V/slnmcubtcraA5t9NHIduAXqRoQmW1y6Us5EWY+XyvYeYh4UxHmUFOB00bv2wWcKGrmjeWPwpvgK55OIsv2dMmT9slT8JjQoE5tzB+qHoWOQJ/ARsbnARFNkleQLZdFe4JkLuGB5sJALQEfXKOTZ0jg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(36840700001)(40470700004)(8936002)(6512007)(41300700001)(6862004)(40460700003)(316002)(5660300002)(70206006)(6486002)(70586007)(40480700001)(478600001)(2616005)(336012)(107886003)(86362001)(26005)(4326008)(186003)(36860700001)(8676002)(47076005)(33656002)(81166007)(83380400001)(356005)(6506007)(82310400005)(53546011)(2906002)(82740400003)(54906003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 09:48:33.7647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9e1e28-30ef-46b6-1ee3-08da867ef995
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033

SGkgSnVsaWVuLA0KDQo+IE9uIDI1IEF1ZyAyMDIyLCBhdCAxMDozNywgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDI1LzA4LzIwMjIgMDg6Mzks
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSwNCj4+PiBPbiAyNSBBdWcgMjAyMiwgYXQg
MDI6MTAsIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
DQo+Pj4gDQo+Pj4gT24gV2VkLCAyNCBBdWcgMjAyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+
PiBPbiAyNC8wOC8yMDIyIDIyOjU5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+PiBP
biBXZWQsIDI0IEF1ZyAyMDIyLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4gT24gMjQgQXVn
IDIwMjIsIGF0IDQ6MzYgcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0K
Pj4+Pj4+PiBPbiAyNC8wOC8yMDIyIDE1OjQyLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4+
PiBPbiAyNCBBdWcgMjAyMiwgYXQgMTo1OSBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz4gd3JvdGU6DQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4g
T24gMjQvMDgvMjAyMiAxMzoxNSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+Pj4+Pj4+IEhpIEp1
bGllbiwNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBIaSBSYWh1bCwNCj4+Pj4+Pj4+PiANCj4+Pj4+
Pj4+Pj4gUGxlYXNlIGxldCBtZSBrbm93IHlvdXIgdmlldyBvbiB0aGlzLg0KPj4+Pj4+Pj4+PiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+Pj4+Pj4+Pj4+IGIveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+Pj4+Pj4+Pj4+IGluZGV4IGJmZTdiYzZiMzYuLmEx
ZTIzZWVlNTkgMTAwNjQ0DQo+Pj4+Pj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYw0KPj4+Pj4+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+Pj4+
Pj4+Pj4gQEAgLTM1NjIsMTIgKzM1NjIsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBjb25zdHJ1Y3Rf
ZG9tVShzdHJ1Y3QNCj4+Pj4+Pj4+Pj4gZG9tYWluICpkLA0KPj4+Pj4+Pj4+PiAgICBpZiAoIHJj
ID09IC1FSUxTRVEgfHwNCj4+Pj4+Pj4+Pj4gICAgICByYyA9PSAtRU5PREFUQSB8fA0KPj4+Pj4+
Pj4+PiAgICAgIChyYyA9PSAwICYmICFzdHJjbXAoZG9tMGxlc3NfZW5oYW5jZWQsIOKAnGVuYWJs
ZWTigJ0pKSApDQo+Pj4+Pj4+Pj4+IC0gIHsNCj4+Pj4+Pj4+Pj4gLSAgICBpZiAoIGhhcmR3YXJl
X2RvbWFpbiApDQo+Pj4+Pj4+Pj4+ICAgICAgICBraW5mby5kb20wbGVzc19lbmhhbmNlZCA9IHRy
dWU7DQo+Pj4+Pj4+Pj4+IC0gICAgZWxzZQ0KPj4+Pj4+Pj4+PiAtICAgICAgcGFuaWMo4oCcVHJp
ZWQgdG8gdXNlIHhlbixlbmhhbmNlZCB3aXRob3V0IGRvbTBcbuKAnSk7DQo+Pj4+Pj4+Pj4+IC0g
IH0NCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBZb3UgY2FuJ3QgdXNlICJ4ZW4sZW5oYW5jZWQiIHdp
dGhvdXQgZG9tMC4gSW4gZmFjdCwgeW91IHdpbGwgZW5kIHVwDQo+Pj4+Pj4+Pj4gdG8gZGVyZWZl
cmVuY2UgTlVMTCBpbiBhbGxvY194ZW5zdG9yZV9ldnRjaG4oKS4gVGhhdCdzIGJlY2F1c2UNCj4+
Pj4+Pj4+PiAieGVuLGVuaGFuY2VkIiBtZWFucyB0aGUgZG9tYWluIHdpbGwgYmUgYWJsZSB0byB1
c2UgWGVuc3RvcmVkLg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IE5vdyBpZiB5b3Ugd2FudCB0byBz
dXBwb3J0IHlvdXIgZmVhdHVyZSB3aXRob3V0IGEgZG9tMC4gVGhlbiBJIHRoaW5rDQo+Pj4+Pj4+
Pj4gd2Ugd2FudCB0byBpbnRyb2R1Y2UgYW4gb3B0aW9uIHdoaWNoIHdvdWxkIGJlIHRoZSBzYW1l
IGFzDQo+Pj4+Pj4+Pj4gInhlbixlbmhhbmNlZCIgYnV0IGRvZXNuJ3QgZXhwb3NlIFhlbnN0b3Jl
ZC4NCj4+Pj4+Pj4+IElmIHdlIG1vZGlmeSB0aGUgcGF0Y2ggYXMgYmVsb3cgd2UgY2FuIHVzZSB0
aGUgInhlbixlbmhhbmNlZCIgZm9yDQo+Pj4+Pj4+PiBkb21VcyB3aXRob3V0IGRvbTAuDQo+Pj4+
Pj4+PiBJIHRlc3RlZCB0aGUgcGF0Y2ggYW5kIGl0cyB3b3JrcyBmaW5lLiBEbyB5b3Ugc2VlIGFu
eSBpc3N1ZSB3aXRoIHRoaXMNCj4+Pj4+Pj4+IGFwcHJvYWNoPw0KPj4+Pj4+PiANCj4+Pj4+Pj4g
WWVzLiBGb3IgdHdvIHJlYXNvbnM6DQo+Pj4+Pj4+IDEpIEl0IGlzIG11ZGR5aW5nIHRoZSBtZWFu
aW5nIG9mICJ4ZW4sZW5oYW5jZWQiLiBJbiBwYXJ0aWN1bGFyIGEgdXNlcg0KPj4+Pj4+PiBtYXkg
bm90IHJlYWxpemUgdGhhdCBYZW5zdG9yZSBpcyBub3QgYXZhaWxhYmxlIGlmIGRvbTAgaXMgbm90
IHByZXNlbnQuDQo+Pj4+Pj4+IDIpIEl0IHdvdWxkIGJlIG1vcmUgY29tcGxpY2F0ZWQgdG8gaGFu
ZGxlIHRoZSBjYXNlIHdoZXJlIFhlbnN0b3JlZCBsaXZlcw0KPj4+Pj4+PiBpbiBhIG5vbi1kb20w
IGRvbWFpbi4gSSBhbSBub3QgYXdhcmUgb2YgYW55b25lIHdhbnRpbmcgdGhpcyBvbiBBcm0geWV0
LA0KPj4+Pj4+PiBidXQgSSBkb24ndCB3YW50IHRvIGNsb3NlIHRoZSBkb29yLg0KPj4+Pj4+PiAN
Cj4+Pj4+Pj4gU28gaWYgeW91IHdhbnQgdG8gc3VwcG9ydCBjcmVhdGUgInhlbix4ZW4iIHdpdGhv
dXQgYWxsIHRoZSByZXN0LiBUaGVuIEkNCj4+Pj4+Pj4gdGhpbmsgd2UgbmVlZCBhIGRpZmZlcmVu
dCBwcm9wZXJ0eSB2YWx1ZS4gSSBkb24ndCBoYXZlIGEgZ29vZCBzdWdnZXN0aW9uDQo+Pj4+Pj4+
IGZvciB0aGUgbmFtZS4NCj4+Pj4+PiANCj4+Pj4+PiBJcyB0aGF0IG9rYXkgaWYgd2UgdXNlIHRo
ZSBlYXJsaWVyIGFwcHJvYWNoLCB3aGVuIHVzZXIgc2V0ICAieGVuLGVuaGFuY2VkDQo+Pj4+Pj4g
PSBldnRjaG7igJ0gd2Ugd2lsbCBub3QgY2FsbCBhbGxvY194ZW5zdG9yZV9ldnRjaG4oKQ0KPj4+
Pj4+IGJ1dCB3ZSBjcmVhdGUgaHlwZXJ2aXNvciBub2RlIHdpdGggYWxsIGZpZWxkcy4NCj4+Pj4+
IA0KPj4+Pj4gVGhpbmtpbmcgbW9yZSBhYm91dCB0aGlzLCB0b2RheSB4ZW4sZW5oYW5jZWQgaGFz
IHRoZSBpbXBsaWNhdGlvbiB0aGF0Og0KPj4+Pj4gDQo+Pj4+PiAtIHRoZSBndWVzdCB3aWxsIGdl
dCBhIHJlZ3VsYXIgYW5kIGNvbXBsZXRlICJ4ZW4seGVuIiBub2RlIGluIGRldmljZSB0cmVlDQo+
Pj4+PiAtIHhlbnN0b3JlIGFuZCBQViBkcml2ZXJzIHdpbGwgYmUgYXZhaWxhYmxlIChmdWxsIFhl
biBpbnRlcmZhY2VzIHN1cHBvcnQpDQo+Pj4+PiANCj4+Pj4+IFdlIGRvbid0IG5lY2Vzc2FyZWx5
IGltcGx5IHRoYXQgZG9tMCBpcyByZXF1aXJlZCAoZnJvbSBhIGRvbVUgcG9pbnQgb2YNCj4+Pj4+
IHZpZXcpIGJ1dCB3ZSBkbyBpbXBseSB0aGF0IHhlbnN0b3JlK2V2dGNobitnbnR0YWIgd2lsbCBi
ZSBhdmFpbGFibGUgdG8NCj4+Pj4+IHRoZSBkb21VLg0KPj4+Pj4gDQo+Pj4+PiBOb3csIHN0YXRp
YyBldmVudCBjaGFubmVscyBhcmUgZGlmZmVyZW50LiBUaGV5IGRvbid0IHJlcXVpcmUgeGVuc3Rv
cmUNCj4+Pj4+IGFuZCB0aGV5IGRvbid0IHJlcXVpcmUgZ250dGFiLg0KPj4+Pj4gDQo+Pj4+PiBJ
dCBpcyBhcyBpZiB0aGUgY3VycmVudCB4ZW4sZW5oYW5jZWQgbm9kZSBhY3R1YWxseSBtZWFudDoN
Cj4+Pj4+IA0KPj4+Pj4gICB4ZW4sZW5oYW5jZWQgPSAieGVuc3RvcmUsZ250dGFiLGV2dGNobiI7
DQo+Pj4+IA0KPj4+PiBDb3JyZWN0Lg0KPj4+PiANCj4+Pj4+IA0KPj4+Pj4gYW5kIG5vdyB3ZSBh
cmUgb25seSBlbmFibGluZyBhIHN1YnNldDoNCj4+Pj4+IA0KPj4+Pj4gICB4ZW4sZW5oYW5jZWQg
PSAiZXZ0Y2huIjsNCj4+Pj4+IA0KPj4+Pj4gSXMgdGhhdCBhIGNvcnJlY3QgdW5kZXJzdGFuZGlu
Zz8NCj4+Pj4gDQo+Pj4+IFllcyB3aXRoIHNvbWUgY2F2ZWFycyAoc2VlIGJlbG93KS4NCj4+Pj4g
DQo+Pj4+PiANCj4+Pj4+IA0KPj4+Pj4gSWYgc28sIHdlIGNhbiBjbGFyaWZ5IHRoYXQ6DQo+Pj4+
PiANCj4+Pj4+ICAgeGVuLGVuaGFuY2VkOw0KPj4+Pj4gDQo+Pj4+PiBpdCBpcyBhIGNvbnZlbmll
bnQgc2hvcnRlbmQgZm9yOg0KPj4+Pj4gDQo+Pj4+PiAgIHhlbixlbmhhbmNlZCA9ICJ4ZW5zdG9y
ZSxnbnR0YWIsZXZ0Y2huIjsNCj4+Pj4+IA0KPj4+Pj4gYW5kIHRoYXQgb3RoZXIgY29tYmluYXRp
b25zIGFyZSBhbHNvIGFjY2VwdGFibGUsIGUuZy46DQo+Pj4+PiANCj4+Pj4+ICAgeGVuLGVuaGFu
Y2VkID0gImdudHRhYiI7DQo+Pj4+PiAgIHhlbixlbmhhbmNlZCA9ICJldnRjaG4iOw0KPj4+Pj4g
ICB4ZW4sZW5oYW5jZWQgPSAiZXZ0Y2huLGdudHRhYiI7DQo+Pj4+PiANCj4+Pj4+IEl0IGlzIE9L
IHRvIHBhbmljIGlmIHRoZSB1c2VyIHNwZWNpZmllcyBhbiBvcHRpb24gdGhhdCBpcyBjdXJyZW50
bHkNCj4+Pj4+IHVuc3VwcG9ydGVkIChlLmcuICJnbnR0YWIiKS4NCj4+Pj4gDQo+Pj4+IFNvIHRv
ZGF5LCBpZiB5b3UgY3JlYXRlIHRoZSBub2RlICJ4ZW4seGVuIiwgdGhlIGd1ZXN0IHdpbGwgZXhw
ZWN0IHRvIGJlIGFibGUNCj4+Pj4gdG8gdXNlIGJvdGggZ3JhbnQtdGFibGUgYW5kIGV2ZW50IGNo
YW5uZWwuDQo+Pj4+IA0KPj4+PiBUaGVyZWZvcmUsIGluIHRoZSBsaXN0IGFib3ZlLCB0aGUgb25s
eSBjb25maWd1cmF0aW9uIHdlIGNhbiBzZW5zaWJseSBzdXBwb3J0DQo+Pj4+IHdpdGhvdXQgYW55
IG1ham9yIHJld29yayBpcyAiZXZ0Y2huLGdudHRhYiIuDQo+Pj4+IA0KPj4+PiBJZiB3ZSB3YW50
IHRvIHN1cHBvcnQgImV2dGNobiIgb3IgImdudHRhYiIgb25seS4gVGhlbiB3ZSBsaWtlbHkgbmVl
ZCB0byBkZWZpbmUNCj4+Pj4gYSBuZXcgYmluZGluZyAob3IgbmV3IHZlcnNpb24pIGJlY2F1c2Ug
bmVpdGhlciAicmVncyIgbm9yICJpbnRlcnJ1cHRzIiBhcmUNCj4+Pj4gb3B0aW9uYWwgKGFsdGhv
dWdoIGEgZ3Vlc3QgT1MgaXMgZnJlZSB0byBpZ25vcmUgdGhlbSkuDQo+Pj4gDQo+Pj4gWWVzIEkg
dGhpbmsgeW91IGFyZSByaWdodC4gSSBhbHNvIGJyb2FkbHkgYWdyZWUgd2l0aCB0aGUgcmVzdCBv
ZiB5b3VyDQo+Pj4gcmVwbHkuDQo+Pj4gDQo+Pj4gVGhpbmtpbmcgYWJvdXQgaXQgYW5kIGdpdmVu
IHRoZSBhYm92ZSwgd2Ugb25seSBuZWVkIDIgImxldmVscyIgb2YNCj4+PiBlbmhhbmNlbWVudDoN
Cj4+PiANCj4+PiAxKSBldmVyeXRoaW5nOiB4ZW5zdG9yZSwgZ250dGFiLCBldnRjaG4NCj4+PiAy
KSBnbnR0YWIsIGV2dGNobiwgYnV0IG5vdCB4ZW5zdG9yZQ0KPj4+IA0KPj4+IE5vdGhpbmcgZWxz
ZSBpcyByZWFsbHkgcG9zc2libGUgYmVjYXVzZSwgYXMgSnVsaWVuIHBvaW50ZWQgb3V0LA0KPj4+
ICJ4ZW4sZW5oYW5jZWQiIGltcGxpZXMgdGhlIHhlbix4ZW4gbm9kZSBpbiB0aGUgZG9tVSBkZXZp
Y2UgdHJlZSBhbmQgaW4NCj4+PiB0dXJuIHRoYXQgbm9kZSBpbXBsaWVzIGJvdGggZXZ0Y2huIGFu
ZCBnbnR0YWIuDQo+PiBTbyB3ZSBjb3VsZCBzYXkgdGhhdCB4ZW4sZW5oYW5jZWQgYWx3YXlzIGlu
Y2x1ZGVzIGdudHRhYiBhbmQgWGVuc3RvcmUgaXMgb3B0aW9uYWwuDQo+IA0KPiBOb3QgcmVhbGx5
LCBYZW5zdG9yZSBoYXMgYWx3YXlzIGJlZW4gcGFydCBvZiB0aGUgc3RvcnkgaW4gWGVuLiBTbyBJ
IHRoaW5rIG1ha2luZyBpdCBvcHRpb25hbCBmb3IgInhlbixlbmhhbmNlZCIgaXMgZ29pbmcgdG8g
bWFrZSBtb3JlIGRpZmZpY3VsdCBmb3IgdXNlciB0byB1bmRlcnN0YW5kIHdoYXQgdGhlIG1lYW5p
bmcgb2YgdGhlIG9wdGlvbiAoaW4gcGFydGljdWxhciB0aGF0IGluIHRoZSBmdXR1cmUgd2UgbWF5
IHdhbnQgdG8gc3VwcG9ydCBYZW5zdG9yZWQgaW4gYSBzZXBhcmF0ZSBkb21haW4pLg0KDQpTb3Jy
eSB3cm9uZyBmb3JtdWxhdGlvbiwgaGVyZSBJIHdhcyBtZWFuaW5nIHRoYXQgd2UganVzdCBuZWVk
IGEgc29sdXRpb24gdG8gZGlzYWJsZSBYZW5zdG9yZSAoc2hvdWxkIHN0aWxsIGJlIGhlcmUgYnkg
ZGVmYXVsdCB3aGVuIHN1cHBvcnRlZCkuDQoNCj4gDQo+Pj4gU28gSSB0aGluayB3ZSBqdXN0IG5l
ZWQgdG8gYWRkIGEgd2F5IHRvIGV4cHJlc3MgMikuIFdlIGNvdWxkIGRvDQo+Pj4gc29tZXRoaW5n
IGxpa2U6DQo+Pj4gDQo+Pj4gIHhlbixlbmhhbmNlZCA9ICJldnRjaG4sZ250dGFiIjsNCj4+IEkg
YW0gYSBiaXQgcHV6emxlZCBoZXJlIGFzIGdudHRhYiBpcyBhbHdheXMgdGhlcmUuDQo+IA0KPiBX
aGF0IGRvIHlvdSBtZWFuPw0KDQpBc2tpbmcgdGhlIHVzZXIgdG8gc3BlY2lmeSBnbnR0YWIgaW4g
dGhlIGxpc3QgZXZlbiB0aG91Z2ggaXQgaXMgbm90IHN1cHBvcnRlZCB0byBub3QgaGF2ZSBpdCBp
biB0aGUgbGlzdC4NCg0KPiANCj4+PiANCj4+PiBPciB3ZSBjb3VsZCB1c2UgYSBuZXcgc2VwYXJh
dGUgb3B0aW9uIGxpa2UgSnVsaWVuIGluaXRpYWxseSBzdWdnZXN0ZWQsDQo+Pj4gZS5nLjoNCj4+
PiANCj4+PiAgeGVuLGVuaGFuY2VkLW5vLXhlbnN0b3JlOw0KPj4+IA0KPj4+ICJ4ZW4sZW5oYW5j
ZWQtbm8teGVuc3RvcmUiIGlzIGEgdGVycmlibGUgbmFtZSBhY3R1YWxseSwgYnV0IGp1c3QgdG8N
Cj4+PiBleHBsYWluIHdoYXQgSSBhbSB0aGlua2luZyA6LSkNCj4+IEkgdGhpbmsgbW9zdCBjb21t
b24gdXNlIGNhc2Ugd2lsbCBiZSB0byBoYXZlIGFsbCwgc28gbWFrZSBzZW5zZSB0byBhbGxvdyB0
byBkaXNhYmxlIFhlbnN0b3JlLg0KPj4gSG93IGFib3V0Og0KPj4geGVuLGVuaGFuY2VkID0g4oCc
bm8teGVuc3RvcmXigJ0gPw0KPiANCj4gSSB3b3VsZCBiZSBmaW5lIHdpdGggaXQuDQo+IA0KPj4g
QW4gb3RoZXIgc29sdXRpb24gaXMgdG8ga2VlcCB4ZW4sZW5oYW5jZWQgYXMgaXQgaXMgYW5kIGlu
dHJvZHVjZSBhIG5ldyBvcHRpb246DQo+PiBYZW4sbm8teGVuc3RvcmUNCj4gDQo+IEkgZG9uJ3Qg
bGlrZSB0aGUgaWRlYSBvZiBpbnRyb2R1Y2luZyB5ZXQgYW5vdGhlciBvcHRpb24uDQo+IA0KPj4g
QXQgdGhlIGVuZCBYZW5zdG9yZSBjYW5ub3QgYmUgdXNlZCBpZiB0aGVyZSBpcyBubyBEb20wIGFu
ZCB0aGF0IHdlIGNhbiBkZXRlY3QgZWFzaWx5Lg0KPj4gQWxzbyB0aGVyZSBpcyBubyBzb2x1dGlv
biBhdCB0aGlzIHN0YWdlIHRvIGhhdmUgYW4gb3RoZXIgZG9tYWluIHRoZW4gRG9tMCBwcm92aWRp
bmcNCj4+IFhlbnN0b3JlIChtYXliZSBpbiB0aGUgbG9uZyB0ZXJtIHNvbWVvbmUgd2lsbCB3YW50
IHRvIGludHJvZHVjZSB0aGF0IGFuZCB3ZSB3aWxsIG5lZWQNCj4+IGEgd2F5IHRvIHNwZWNpZnkg
d2hpY2ggZG9tYWluIGlzIGhhbmRsaW5nIGl0KS4NCj4+IFNvIEkgc3RpbGwgdGhpbmsgdGhhdCB3
ZSBjb3VsZCBqdXN0IHNheSB0aGF0IFhlbnN0b3JlIGNhbiBvbmx5IGJlIGFjdGl2ZSBpZiB0aGVy
ZSBpcyBhIERvbTANCj4+IGFuZCBqdXN0IGRpc2FibGUgWGVuc3RvcmUgYXV0b21hdGljYWxseSBp
ZiBpdCBpcyBub3QgdGhlIGNhc2UuDQo+IA0KPiBTZWUgYWJvdmUgYWJvdXQgZGlzYWJsaW5nIFhl
bnN0b3JlIGF1dG9tYXRpY2FsbHkuDQoNClJpZ2h0IG5vdyBYZW5zdG9yZSBjYW4gb25seSB3b3Jr
IHdpdGggYSBkb20wIGFuZCBpZiBzb21lb25lIHdhbnRzIHRvIGhhdmUgYW4gb3RoZXIgZG9tYWlu
IHRvIHByb3ZpZGUgaXQgd2Ugd291bGQgbmVlZCBhIHdheSB0byBzcGVjaWZ5IHdoaWNoIG9uZSBp
biB0aGUgY29uZmlndXJhdGlvbi4NClNvIGluIGEgY29uZmlndXJhdGlvbiB3aXRob3V0IGRvbTAs
IEkgc3RpbGwgdGhpbmsgdGhhdCBub3QgZW5hYmxpbmcgWGVuc3RvcmUgYXV0b21hdGljYWxseSBp
cyBvay4NCg0KPiANCj4+IElmIHRoZXJlIGlzIGEgZG9tMCBhbmQgc29tZW9uZSB3YW50cyBhIGd1
ZXN0IHdpdGhvdXQgWGVuc3RvcmUsIHRoZW4gd2Ugd291bGQgbmVlZCB0bw0KPj4gaGF2ZSB0aGUg
bm8teGVuc3RvcmUgc3VwcG9ydC4NCj4+IEJ1dCBpcyBpdCBhIHVzZSBjYXNlID8NCj4gDQo+IERv
IHlvdSBtZWFuIHdoZW4gInhlbixlbmhhbmNlZCIgaXMgc3BlY2lmaWVkPyBJZiB5ZXMsIHRoaXMg
Y291bGQgYmUgdXNlZnVsIGlmIG9uZSB3YW50IHRvIGxpbWl0IHRoZSBpbnRlcmZhY2UgZXhwb3Nl
ZCB0byB0aGUgZ3Vlc3QuDQoNCkhvdyBhYm91dCB0aGUgZm9sbG93aW5nOg0KWGVuLGVuaGFuY2Vk
OiBnbnR0YWIsIGV2ZW50cyBhbmQgWGVuc3RvcmUgaWYgdGhlcmUgaXMgYSBkb20wDQpYZW4sZW5o
YW5jZWQgPSDigJxbbm8tXXhlbnN0b3JlLFtuby1dZXZ0Y2huLFtuby1dZ250dGFi4oCdIGZvciB3
aGVuIHRoZSB1c2VyIHdhbnRzIHRvIGV4cGxpY2l0bHkgc3BlY2lmeSB3aGF0IGhlIHdhbnRzIChh
bmQgWGVuIHN0b3BwaW5nIG9uIHVuc3VwcG9ydGVkIGNvbmZpZ3VyYXRpb24pLg0KICAgSW4gdGhp
cyBJIHdvdWxkIGFsbG93IHRvIHByb3ZpZGUgYW55IGNvbWJpbmF0aW9ucyBvZiB0aGUgMw0KDQpC
ZXJ0cmFuZA0KDQo+IA0KPj4gQWxsIGluIGFsbCwgZW5oYW5jZSBkb20wbGVzcyB3YXMgbm90IHN1
cHBvcnRlZCBiZWZvcmUgNC4xNyBzbyB3ZSB3aWxsIG5vdCBjcmVhdGUgYW55DQo+PiBiYWNrd2Fy
ZCBjb21wYXRpYmlsaXR5IGlzc3VlLg0KPiANCj4gSSBhZ3JlZSB3ZSBzdGlsbCBoYXZlIHRoZSBm
bGV4aWJpbGl0eSB0byBjaGFuZ2UuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVu
IEdyYWxsDQoNCg==

