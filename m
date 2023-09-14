Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C728E7A0806
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602347.938866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnkZ-0001L3-Is; Thu, 14 Sep 2023 14:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602347.938866; Thu, 14 Sep 2023 14:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnkZ-0001Hh-Ft; Thu, 14 Sep 2023 14:55:23 +0000
Received: by outflank-mailman (input) for mailman id 602347;
 Thu, 14 Sep 2023 14:55:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J3lF=E6=citrix.com=prvs=61487cf85=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qgnkX-0001HZ-PP
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:55:21 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6fbd2cf-530e-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:55:18 +0200 (CEST)
Received: from mail-dm6nam04lp2045.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Sep 2023 10:55:14 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BLAPR03MB5538.namprd03.prod.outlook.com (2603:10b6:208:285::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.38; Thu, 14 Sep
 2023 14:55:11 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 14:55:11 +0000
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
X-Inumbo-ID: b6fbd2cf-530e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694703318;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Mt9aN54ejQbFoFkr2FFPbDS86iMPLHoIot1wdQVbO0Y=;
  b=bvVZ7qJA6W0HcamHmj8QC+nu2aoDnKzm+wqGB45FhxKoVLYNlvyKDBkf
   0hQ+Km+O2RIG0Kx/sK5QJQMLUl4L0MV6m5JANhbVVPB15he3NYjyjkmRU
   BMasRuX4lgxz1cddE9MpzcuhZZhR/Q5KN04uydsXBBjdGOtYZBj84/wZn
   Q=;
X-CSE-ConnectionGUID: VdC5uRMKSXqRrfKVTOo+zQ==
X-CSE-MsgGUID: AnbRG7/ZSpiIpepV670SVQ==
X-IronPort-RemoteIP: 104.47.73.45
X-IronPort-MID: 122663832
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:jOyt/qo9g8lmzFFv6S96dnR6XNteBmIrZBIvgKrLsJaIsI4StFCzt
 garIBmEaayMZmHzctgjbti//BgP7MCDnIcyTwc6+y1mRX8WpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GlwUmAWP6gR5wePziVNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAA4BRU2evceV+4KicPNipfofC86oLrpK7xmMzRmBZRonabbqZv2WoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+OrbIe9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAthMSuboraQCbFu772oZMjJJEmmAufiYkkOmZYwAc
 3cqw397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRUcZYisJSwYt5MHuposoglTIVNkLLUKuptj8GDW1z
 zXUqiE73+kXlZRTi/j9+k3biTWxoJSPVhQy+gjcQmOi6EV+eZKhYIurr1Pc6J6sMbqkc7VIh
 1Bc8+D20QzEJcjlePClKAnVIIyU2g==
IronPort-HdrOrdr: A9a23:WdARgai80O4bhLr08jWTsr26anBQXgwji2hC6mlwRA09TyXBrb
 HWoBwavSWUtN9jYgBZpTngAtj+fZqyz+8R3WB8B9iftUzdyQ2VxeJZnPXfKl/baknDH4dmvM
 8KGcUTNDSzNykcsS+T2njILz9K+rm6GdWT9IXjJgBWPGJXgs9bgTuRQTzraXGeDDM2f6bQX/
 Knl7p6TyzJQwVrUi2UPAh4Y9T+
X-Talos-CUID: 9a23:b+aFcG/zaWsyTuxmde2Vv3AYMZ04SFj+90fJGVW2KlhVb7rWW2bFrQ==
X-Talos-MUID: 9a23:wkXkjwbVooucOeBTnjnmvh49c/VT+6WPEE0Vr8tZ4/K6DHkl
X-IronPort-AV: E=Sophos;i="6.02,146,1688443200"; 
   d="scan'208";a="122663832"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4eDCsVwIREddypJRWeR8HO+qk9A3sh5bDmpGS/m9UPh0gDNrvUrNI1W3jNTgFA3ZIWPcSdKGaWvc+i9kZk51yIAPYu1qgTYiHYmKqdrUI2TQXPbb+x1nBaA9HjIixO3CE5j/a0US8hoim+GWlAVbCA2Nea6RGwSpcOBIHo02/8U1RuTxSuNHZYPXTiQknlayu7SA5O7AqFYDQoJYtuP1f0dBfsYo4nEf8S76REn+8TYGi/Shfdb7USHpH+2KEUjRCPbqVOTcmFOy1GhRTsMftlEgtkLXReaakD2hw7nzClzCzZL2U2Nxmwv+TT7ItPNHXh0dWeeyorp09LiiPvw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knDgYklc6VT0ex6NEBjcbufcJ5EGGOD3BbMq/Zww6nw=;
 b=Ip8+f/rvyJdf7LPm33hIW4CVMoT2t2tmzojNFDQ/jesQzs9yYTbYZWCr7RU6WaNgb1EeeH6hGH49kkkybmqtWcXbyrlQLrtFPc+DWILvI+U5bvymMC3lPc6RwwyH1HskJKaZ+ajdlpvsV89arJVwBfbMLw1TcA+QBck46dnJfbAaN2eZdirvFLobT17wU3wiTIdZeLRCy86TtbycxEUHZxAKV8f4X5DXgjBQ+MI6EqGnDTJ6Gf/sfO6up92EHVapNh/kouQG7jHeoEcdpwe7XU6IwewRTorRlV5+41T3qz2uy5g6AH35WszFkTMM1Gx+lI7thNgBJCNF2uYonl4LeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knDgYklc6VT0ex6NEBjcbufcJ5EGGOD3BbMq/Zww6nw=;
 b=vEtVqk922lS+z3z7yJaacQrr5JZsYMDLf3JiL8wmJta/UL+EVWZIkRoJUecsq1WkZLhHH81fuRJkFgNqESZHMc8J8M9S/cQRiughz1suksgz+J+LvlWsEPAWv/J/2g8yLm372/S79Ga1a7WgLWx+4WGWvQM3ISRnBklEroHbCKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Sol=C3=A8ne=20Rapenne?= <solene@openbsd.org>
Subject: [PATCH v3] x86/amd: do not expose HWCR.TscFreqSel to guests
Date: Thu, 14 Sep 2023 16:54:36 +0200
Message-ID: <20230914145436.92358-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0264.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BLAPR03MB5538:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d5303c-bee6-4ee7-7737-08dbb5329873
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5kvCp/ZTIV8EGwyNT5zseK+rRk2BOuc1exj5I1VhKj6ACjz4DYTVz3ALAHkoOadqPq7zYUt5XSABu1LB74ZYuqa8rqWR4I2YGFJsDIcP/WHbbneQsmA8Geq3rcohI0P1BFkovtTYpZ+A263P+514wPuaezp95sCZzXJ20WUv82IMFYdGZbs1c++DkgoyiECdyWJwIeaMKlDkJJsY+VEmACwSs0UPNp/+pLPRJaeFFU1iLh0LN4JMi6bbCl9VvnyqkGf6NGbtQvlNTdQm54J4aAKZrqQpJ2GS/m6O5B9vD8h+dAGq4jfcS1JJtVQ4c2K2VIqpDIGMd3LjFEaNlXrO1Djhc6BWp8ZX2zS0j+ZR5TVfVe0f/n0hqg95ZhFuJCYAmv/MQoba+2XkU68DxBGR0DvUUc2+nXmj6UGOjYkwMIsg18iM6VE/zxx5YDPuXMZxqWYbZnhpJFN85TxNQ/qLg+2SCM+xsJV7NDkXV5kxSrQCmRZBsVzlo8lCdCthxs3X3HBngiAHryhEKAVanI8YN0RsXXkI/mOpXDE50SlOD5o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(366004)(376002)(396003)(1800799009)(186009)(451199024)(6666004)(6512007)(6506007)(6486002)(83380400001)(82960400001)(38100700002)(41300700001)(66574015)(478600001)(66946007)(36756003)(316002)(2616005)(26005)(6916009)(54906003)(966005)(66476007)(66556008)(1076003)(5660300002)(8676002)(86362001)(8936002)(4326008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qml6VFhMUDh1UEZGZnlUWlg5ZEZwN2Q0cTFQd25EWXJqQjFhRTV6bmNvRUlo?=
 =?utf-8?B?V1lwUlR3UTI3SWFwRW81UEZFajBSdERWTE05VWpXMkZWcVZIY1BNZHFGWHNU?=
 =?utf-8?B?VTJrclVoLzJ5Ymp3c3BvNUFzUmlTVE5ud0JER2h1M05Hd2Y4MWdlbVlTSTFP?=
 =?utf-8?B?ZGJMOHptTzlQZHRIemVvV08renJVK04xYU1qN3VnamZNd1dtLzV3dUlMMy9p?=
 =?utf-8?B?YlZXQ0F2OEFJdGk4ZkhjQnFJZDhrUkdOZXA3bnduYTJ0bDdXRlpLMUtIcGdD?=
 =?utf-8?B?SloxWXV0Y1FmSmprUXBRWjdUYTBNZ1krQ1JlRDBNbFZBR3d1cWtPSncyckxU?=
 =?utf-8?B?TUViUjNzWXlodm9VSGNtcURHSVR2MXVLYjNjU0lJUW1YV2d1aE05U21HWEdO?=
 =?utf-8?B?MGJXZEg1bTJkZC9IcWdjYi9aSmZCQll3OU8vblJudzMrei9OcGJ3Sk5EV3d4?=
 =?utf-8?B?R2RRU3d6SnN5bE5WSjlweGkvd0ZVZ25jSTVpVGRua1YxUUVWSFFyWmVYSjZB?=
 =?utf-8?B?czRYV1RRNmJFd2tiTWl0ZFk2SUZySWRDNmtuZkRPY2JwV3NhYlR3MjhnUnNi?=
 =?utf-8?B?Nys1TnY0Z2pqQ0RSdXB1TXJmVjErUXdJaGdQeWdndzlZZU11eEdoZURiWDFm?=
 =?utf-8?B?K2V1UlZGeU1QbS9XRlZqTmNuOUtRQkI5dHFua2NkUk0xS2NNTGNlR0RESWNn?=
 =?utf-8?B?T0hnSElFSjRCVnF6TTZzbnplQUM5eitIR2xIZjY4T2hBemNUbUpYUlFSRW1R?=
 =?utf-8?B?OW80bUpaSWVpcGt3b1hXYlpwN3VYK1hlWDJ6ZGFPbFdWMERCT2JLSmJ3VkU1?=
 =?utf-8?B?WWpMNUR2cnB1TElDVHpHNE9FL0Z4QlFQSFhCaTFmQU9aY1p6UnNRdU1lcEdT?=
 =?utf-8?B?cndkOUIyOTVLTGFJUTJmVUpoRGJxVkNXZUZqR1Y3bENncmlVMlk2ZkgxWm56?=
 =?utf-8?B?VnF3M1g1QWNWczc0czRsNnZKLytwSlFCSlhMWXJGRnlSTVJmQUczRDBxU2VG?=
 =?utf-8?B?UENSME9rem5YK3F6NUlZVlRjbVphQXd5YlkxM0ZuWUx4b0dONGlDbGE5N0FO?=
 =?utf-8?B?bjdEYVg4V3U3V3pRdkFrRnJGU2hoZkVENTRaSHlNOGxoRXg0OWRPcEtEeUxP?=
 =?utf-8?B?MnZTbm90RW9LenRzQ0dFV3cvM1A2Zk44UFRXdy93ZDNOZVp0UC9KYVJad3U5?=
 =?utf-8?B?akorVW5XbWQ1cDAvRUlwS2NFcmpQZHRhUW83eS9ISU5lS295WVNvRDE4TzRL?=
 =?utf-8?B?cU96QVp6dEFwQ1hibWRXSG9qcFIwUEJpeWNjbFNXOEdIZjRDb1hTcEVjbWRi?=
 =?utf-8?B?dGNidkpjVDRWT3lNNXpJYmFyMVlzRTl2eXFteFE1ZUZ1Zllpd3MrU0kyKzIr?=
 =?utf-8?B?Z0xBMUYrMDRZbkdIVlF6Q1pORWU4Z0ZlaXJ6UEZyOWd5SEFYd0ZiL2tkZFFC?=
 =?utf-8?B?WGU2ZWIzd0VkNUZtckk5V3hyN2NTNUR1aElsOTA3ejlET0gxR2x3TDE2aWNR?=
 =?utf-8?B?WFhsb1R6SXZmTmppWUozRmtNMmZVZFNLeVpsbDhsbHAzc1M2WXNxVzNpVW9X?=
 =?utf-8?B?NW1NTVlydWJ3WW5FYVNqd2d3WHFDTmtVdS9aZmY3eHNwVzAyWDRPNlNBWExG?=
 =?utf-8?B?cm54NWlJYVdrY1pmMDVRSUFlTTAvbkVXelpUdi8yd2xFRW52dW55aVZOMnAr?=
 =?utf-8?B?TURkRTkxUDc1M293ZndXRDBWelJoK2FnWmNhcTY5WDBZTzdXS1hXZ1NKSDNI?=
 =?utf-8?B?RzVoNHVId0RjaGt2TFlyRC9DeTEvYzZxd1lvMG9Gc3RSOCt2dWZhdnRZVUVQ?=
 =?utf-8?B?QXdON1FDcEVGaWFndzliaEo2K3VvZHBqRU5xYlBuQmNWU0l5QWFBdEpkenFB?=
 =?utf-8?B?VTVGYzFLeVdwdUFSVXFtR0M2Y2FQYS9HTlVUV0ZHS2E5TWFDaHhpUld4b3JH?=
 =?utf-8?B?bTVxbFkxL0JDUWRyZ1grQ0lLNHpuMUlNUzRjZEp2dFhnVksrSEdhMkp5ZjJi?=
 =?utf-8?B?eC83L0d5ejBWaENFT2haQTJEYkFaY1FnYWZWd2ZvY1VKeStVd00vb3ZhZ2JU?=
 =?utf-8?B?enlHSGtYaDZOa3VKU2RoK0hPWDBFc2VrOUkxcThUaGV3MFArLzZEa2RJSEF4?=
 =?utf-8?B?TFgvTlk3d21kZkR3M3F5NXk4eThZcUY5amRxQkt4V3UrZ21iV2VMcHlkVVBB?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AX/IOL8Zrt7WnrFbU118qgbtYMN39UpJwVjyk94riyFetrzQEL8eGiAbHDo3rzvUKDLLuqEqjX7n0/akJjoCGDGWtdDA9meod+8cFS8ejyFY9rWlwe0WLdq+ksf1C+LQDDKn5pZz6lRcvHyvrDcB1cieCSeqZS9qsvMk5vgGbb/7XyZk27VzETKLyWvD+EaC37mXgBKfn0Yes0blpHGY/avrDmf+LZb49j9ZjbSTbWpWmM8/UZvTZafBrulXm5LGUxKIGQ2oY45dr5clr3OCGTAgehSM2/JQvA3d7WX6KXgF+FR6Ry36eL7vAo+AxTvi7MrApdiPiS/qeII/cAqfav3KNKcMx8V5gy+fHZQUxJ29hZk1IgBW8CbVJKMQPIbE/S0a7hV9euevnwl6WeUS/Ikm/xVDgxNzGBw5rZ0pUjJ1a4am6QxgLmhUkhWrQQwanFKiZAwJhU4Y5MoNVOmfxnbDVzW5S5F5vHK+JTSMMVHlwAvFuaRkIa7DhGKjw70aAm8hkj27ezjergJc42Jz4E3wShHgDR1tL52OxfI/NiolkvPtdtf9mHRlS7DQotQgmiRLhjOaWp3p+xjn8wFh2l64KwNFhCDxOKboS7Vwre+zU++f0aX9dQe6LtjSjow9ZKeqQ9njqwqWfyh7LFL8GRy1Ejo093/g4aNMvJYaoF64C/N2WQn/FhEEQr/T1Cj4AtnZ4Ki/ah+TzWyypeLjgnrj1gzCm9lBBIFsVMqqWSVgwHN5BDZBiRUfdl/sujswRDnVbS3SA9rESDHxTr6uf+UIZ0Nmgup5+v6puNKpt90IAA9vFMzjZ5eryAjM/AiEyaPdRrhDQBPxk0p8VjHBxlUV0FgnRiAUCn7mcnwelS0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d5303c-bee6-4ee7-7737-08dbb5329873
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 14:55:11.6350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1KBxoN2EkUGrVXe5XbdIobshCzijzYgdmodtWc+Q7w5p6J79Y51sY0Xj8F3Ich9pktV0G+zje/gWVyza1ZQ2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5538

OpenBSD 7.3 will unconditionally access HWCR if the TSC is reported as
Invariant, and it will then attempt to also unconditionally access PSTATE0 if
HWCR.TscFreqSel is set (currently the case on Xen).

The motivation for exposing HWCR.TscFreqSel was to avoid warning messages from
Linux.  It has been agreed that Linux should be changed instead to not
complaint about missing HWCR.TscFreqSel when running virtualized.

The relation between HWCR.TscFreqSel and PSTATE0 is not clearly written down in
the PPR, but it's natural for OSes to attempt to fetch the P0 frequency if the
TSC is stated to increment at the P0 frequency.

Exposing PSTATEn (PSTATE0 at least) with all zeroes is not a suitable solution
because the PstateEn bit is read-write, and OSes could legitimately attempt to
set PstateEn=1 which Xen couldn't handle.

Furthermore, the TscFreqSel bit is model specific and was never safe to expose
like this in the first place.  At a minimum it should have had a toolstack
adjustment to know not to migrate such a VM.

Therefore, simply remove the bit.  Note the HWCR itself is an architectural
register, and does need to be accessible by the guest.  Since HWCR contains
both architectural and non-architectural bits, going forward care must be taken
to assert the exposed value is correct on newer CPU families.

Reported-by: Solène Rapenne <solene@openbsd.org>
Link: https://github.com/QubesOS/qubes-issues/issues/8502
Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v2:
 - Adjust commit message.
---
 xen/arch/x86/msr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 3f0450259cdf..c33dc78cd8f6 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -240,8 +240,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     case MSR_K8_HWCR:
         if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
-        *val = get_cpu_family(cp->basic.raw_fms, NULL, NULL) >= 0x10
-               ? K8_HWCR_TSC_FREQ_SEL : 0;
+        *val = 0;
         break;
 
     case MSR_VIRT_SPEC_CTRL:
-- 
2.42.0


