Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 379F36D6F53
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 23:55:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518174.804435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjoby-00049b-T8; Tue, 04 Apr 2023 21:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518174.804435; Tue, 04 Apr 2023 21:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjoby-00047a-Q6; Tue, 04 Apr 2023 21:54:42 +0000
Received: by outflank-mailman (input) for mailman id 518174;
 Tue, 04 Apr 2023 21:54:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjobx-00047T-0I
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 21:54:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4af19420-d333-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 23:54:38 +0200 (CEST)
Received: from mail-dm6nam04lp2040.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 17:54:13 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6387.namprd03.prod.outlook.com (2603:10b6:806:1c2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 21:54:11 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 21:54:10 +0000
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
X-Inumbo-ID: 4af19420-d333-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680645278;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9ZabhdgXSSrBvWvumOUTfZeknY8WfKfHQ46NHrpbX7k=;
  b=T8UVvalobsGjTF4yqjXPU5rD1D/ARvgJEKkr8xwycMMYrsDzD8MLjc6/
   TiSCwOfysvjEIFlLXpnwej8Sugxwm4mBd2Ros4lq1E2VXBOtdQ6qXk9KW
   Cq/7aKe5NccuBJBhmWJKfsNpIOgGyEHTQ1/0WSVHkv70WTUMn47JFReHm
   M=;
X-IronPort-RemoteIP: 104.47.73.40
X-IronPort-MID: 104746601
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aGnFs6OJgx50ehfvrR2IlsFynXyQoLVcMsEvi/4bfWQNrUoj1WYHz
 WBJXTyPaa3bZDemLt4kPYTk8U5UupXVmNAwHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tE5gBmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sUuOk9Pp
 e0fFDQQdCKpg+Cz4rj4UMA506zPLOGzVG8ekldJ6GmFSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vFxvzC7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXwXynBtxKTdVU8NZQnnax4DcQDSQGVHS0p/7ktErmRJF2f
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBQQ5b5dDm+N03lkiXEo4lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bzgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:J6Ok6K0dEx/5TNQAXjYPgwqjBIIkLtp133Aq2lEZdPUzSKClfq
 GV88jzsCWetN9/Yh8dcLy7WZVoI0mslqKdkLNwAV7KZmCP0gaVxedZnO7fKlbbak/DH4BmpM
 FdWpk7JNrsDUVryebWiTPIaurIGeP3lJxAU92uqEtQcQ==
X-IronPort-AV: E=Sophos;i="5.98,319,1673931600"; 
   d="scan'208";a="104746601"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfH9SsgOx/ZeREsVz8Hab5u5UhAcj+Z2iq5n/jncm5e17uW0Dq6ueRdrOBL+Diyx+kLU7wL1Upb3YgVhlMe4Eh3CYHyLSWqW5E97bRRNzyMV4sE4Am6KR8jKSiTuABcDygtQ3mRmx+dBRC3oNjlM3GfcxOzlgTIsFuCtL8uU4VOHTVnKtTQeL6xizUCC8fkgXZcOtJ/qiWyZPcWQ6k7HD9plMQGeHk8QPRBVUY/Bp8uvAIzB3boPZz/QOjUr/Uys1tgd+sCRSQHSb9jqbdWrt0CN2QWl4C7+T//6VBxZ3pawpSceQhwP0w14JENuC1XNN58uy3NLOT/MzUyMMAi+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93vfan2gsno1DCeqXREVT5h6NSIC8R4Twl29c7aP6Js=;
 b=Cm8dYvRAb3/24djSiEWENn3XfuoXr1ty5Xo7TvmGLTv8wQIeW+CxZ4itd50W9ElinYgrY1Bf3/St7r3sABdEGV2sdQsyE6BMRZTCosPBNcSqmq5ZVxj8Z9aJHwZdTQAAn/SA5efshvhTydxEjjzdovpVZ1tIrakbLQ78jbBJ8pux8JVjv7ickzqfkSJWOFhcuFNI+aBAlK1UH+BK8lQ6OUP0IUJdJ1zh/pDs9ZuWBnPvi74DCydBierEBEAx4qgsgAYRwZNpPVbVQ+3pyu16w6WgFZAb+2ZsbyntqaX/44Ry8ntQJqRV38QVUw/OFI4YW+Lj82ih3AStLd4e6WySsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93vfan2gsno1DCeqXREVT5h6NSIC8R4Twl29c7aP6Js=;
 b=H9A6pqwWufacSJRIvj+05gR/t5sOu9t5PhoE+y8etv9+5c68HH1X/ic+uyHlWP3VtlK0N2aKKdVKiMZmqmfWpQqahdatubiipaJPoSaXusQB5n16boG4S3zVE+2O6Z0TPUlwUDGMeO3ZXUxKryV9UPAvHKotsx8cq55wvLHYgXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d8d72cc8-f477-abb1-f6fb-5aa1909b36aa@citrix.com>
Date: Tue, 4 Apr 2023 22:54:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/9] x86emul: support LKGS
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <1eb21ece-9d33-d8e1-1c2b-c682dbb1cda1@suse.com>
In-Reply-To: <1eb21ece-9d33-d8e1-1c2b-c682dbb1cda1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c19b71-470e-415a-c6ad-08db35571f01
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vb0CtKbU3ol0ffgjokJh203s58Ccmj3YgkzJnl6h4/0CNxw7ivyVR5gj+I63yyMQickV8AnRXGP2Ql4F6MoBU/prpbjT80wUk5p7O2byhc7YxHAk0Bsi4pmQiiiiIlxAqwrGVrdjEyv+EV+8ypHfAX9iwtFDoU4pIHBkQAT0N3Ms5nlHI9F5upNgSIKH9/D5UPFHuCu2sDtAYlCKtP+NPMNlfHGU6BhG77jtctoUqTbSet3pOj27Jv8f37/ecm5ravx5t29mKwTndVk6S/xN9lF8Z1tUTNyXXFF40YMQpH0nb2rNCquuDuYBOAGe5Rd6QMf6L1BZ1xNknEA4z/0DVCCwIjq+vwQWa3rs3xi8pPd4xpBhf1Ih9qQjMLilHXZRf4z1wDugPZwUf6FbkyMk0wBs/CNCwF7WsDSoU2ZXavfLDrLGFPCySzB/nmFcuKMYlBApEuMU6d2dJk6KS4jTab0g2eOIlX6ng+ZQB0eV2/dea8pP7kMa5Gfr8+xL2JJh/QK4W1uuzhuw3SC8gZ3T0llsJI8z1XUQNzg1/RpnSpTDFnbuWRnYQkT3R2WmK1qkUnjXH06QY+QQEsuHU3jqMU4CIBqc2kOl9RlrNCmboTQjFdS9LRcUvJWxcIGF13IjW6ZsuIBTl4u3O4heyDdFOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199021)(107886003)(31686004)(6666004)(2616005)(83380400001)(186003)(53546011)(6512007)(6506007)(26005)(31696002)(86362001)(4326008)(66556008)(8676002)(66476007)(66946007)(38100700002)(2906002)(82960400001)(41300700001)(54906003)(316002)(110136005)(478600001)(5660300002)(8936002)(6486002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWFGMzFiL0kxL0ZUQXJQMzBzZmhzdFhZazdoRENFcCtZMS9DakhvTUNZcGk1?=
 =?utf-8?B?ZVBvaDdLS3FxeFR4d1ZnTTFkNllyM0VacUZyU2UyTC9PUXBFMi8vZTluZGRR?=
 =?utf-8?B?ZEZLL0N5Sm9PS2dXdElRTzhBVEozVVRuNjdSNGNiMEZQQUJWeGtBek5PRVd5?=
 =?utf-8?B?R3RqeTlMK1dpRHRZdEp1UU1pVzhNZTVZeGdhQjJqc0FGNmROeGFBMS9yVi9h?=
 =?utf-8?B?TlFmOGJXZEpSRDFQVEptQUI5VGtZR1YzeEM1dmJVRXZHeFBZMUtOQXRseWpn?=
 =?utf-8?B?ZGlKSWhWT3VhZklLTDRxUDNvYkFwcG4zRE9COUNudUtEU0c4YUdoWm14WXcv?=
 =?utf-8?B?YUZ0MXRSYUxDbVUwWnRhdWF5Z1lMY0U1cGlTeEN1TVNkRGhaeVlOZXREYlNw?=
 =?utf-8?B?S3lNaXBUaDMrdEl0TjV3RkdFQlVhdW1URlNWQ3hJcElvTlcwd2xDMnlwOHhR?=
 =?utf-8?B?TDIyQXJkNytISDN0Vis3cjJwQTlpZkgzQUh3bGZHRURZYXFKaVRTT0R2TXdj?=
 =?utf-8?B?anFzWTdmOGF2T1FWM0NFTGZCUXltWTB1L0VxWVBGTWRRc3VYUUJ4T1BhUTZj?=
 =?utf-8?B?YTA3VVNNWEZ1ZWtKV282NVNHSnRoVTNCaFhzK0tYaHdNQnBkcUFmRkw0azlS?=
 =?utf-8?B?bFV3NmZCcGFDSXJrbS9oOTlTTkZUcXZqclhuUkRuM2tIZzUrdDM2S3A1WTEz?=
 =?utf-8?B?YXFaN3FueUZqQW4zb2xkY1ROVUcrWkZ0bjlSaHFCOVhnT2hKUEMvZGFPYzcx?=
 =?utf-8?B?WjZyY01oRnpoRnBTc2FpZGZNY1dMVDE4cm1seTN6eURVcEpGWDgzQnZmMDVu?=
 =?utf-8?B?d2N0cVVVeEVmL0VsOUo5RENyTHZNUkVHNmxxY0RkVDJyaldEcGxGOERNbm1D?=
 =?utf-8?B?MVArTHpxV2VyZ0dqekhsWndTbUVoK2V1NnRjU05reXVpZkpkaSswOXZqZWNB?=
 =?utf-8?B?eUFUbXRsa25KTkxzNlFSTHRqWE1EcFRxRFBoM2w1bFU4QWJIS1NJU1RMOXkz?=
 =?utf-8?B?OSsyWDEwYzZSMTlpdmxFSGN0OVkzWXdXSVdQUnkvSTBSempwNmJqSm9rNlZw?=
 =?utf-8?B?YXY1VmI2bXFJa200aGtud1ZhQmloVXJwbkZBQVRDV0U4eTJKNk1YMnJhekNl?=
 =?utf-8?B?QURCMmFkRU9YWE94MFpsYncrZ1drMWEyYkNtT0IvbVN3VWZIcmh1WDJCbDV5?=
 =?utf-8?B?K1M1b3J2ZTBrV0JKcEY5M3NmL1RyUzdrVENwUC9jME1acndtUGhEYTVZMWZ0?=
 =?utf-8?B?QmxxRkVjdDlkQVFMTWp1RnQ4KzcyTVJ1aHRUem1Ec2pZVkVxQ3RVa1BZYXNM?=
 =?utf-8?B?NWxBNVh1aGJmR1lpUUY0S0wxa1hnbGUwVkg3VEh3VEdrdmtjYU9LVW1qb01w?=
 =?utf-8?B?OXVaWlZ5a3JPMEN0cFZFNkRGMWNiU2VZZUlZc0RPVVpyZUxPOTZQZXkyK3gr?=
 =?utf-8?B?ZlA0UG9VWllxbEFqWE05ekt6MDI4eGR1VWlwd0dYc3hUeUsyc3Y0RXlqTmxh?=
 =?utf-8?B?eUxTdWU5UG9WY1FaT01pbWZEZndsaW9SVVFSZ2Q3VTNuNzBTUWh5NElXRHJq?=
 =?utf-8?B?TmxKYkszeit6eHNZOG1QelBuZktjMWZoOHYwZkladjkrOFVkb3NheFByVUl3?=
 =?utf-8?B?MTZveDRzQUd3OERoUDRPazUxT09qVjJXdXBMVDRQcjNEdDF2L0kyVkYwL2I5?=
 =?utf-8?B?NGR1d24wSitYSi9TOUF0Tlpya2hOMHAwemQrbkpZTU9acVhNRVNUaHlJeXJE?=
 =?utf-8?B?Q3ZrK1BxRnVIUjdISlJ0SW1YSTRncUkrUWpuZ2o3WjVnQXBtd3JydkduTFE5?=
 =?utf-8?B?ekpTbmRjRFlhb2Z4a1JQSXM1SVRrVTh0OUxaa3VHWitDRnV1TXh5SUhxOXZ5?=
 =?utf-8?B?YVE2bG5KUjZzM2VVcDBmQXJjVXdmSHh4cXFTdFprWjI2alB1YzVKalBEREkv?=
 =?utf-8?B?d0JEL2pUTkgrcThhUnd1WFFXaHdQZTJvM2lVUm1vaWVsN25WNlNOTEFBeGhK?=
 =?utf-8?B?L2xpbXZuS1kwd3BtNU5UcGFzdmZCWHpRME1ld0FOdXVid3VUN0J6WjRuV2Jy?=
 =?utf-8?B?Q1pSWW9kSHpialVxUzhlLy96RHRJc1FYMmxtSzI1cEVYck0rd1B6K0JxOWVi?=
 =?utf-8?B?UDAzWk4ySHRnbmgyVFVTTDdZWnE5SDJTOWlUMkUrS1RKZytCd0JneHNpdEZi?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uT/yVC0+kxQNGpiumMSstrGq+FkHc3ef3wBFNpNZmfNYvyWNk35dlwseCcPIlU1NSSh8ISeW5C6A9JqdDKrpt3V0MQ4ZA1TXW99OC/Iyoke+iO4DZOUemC5i/qB4L+Hm6kRCLOnoclJknFFiP3hyEjcnA4awmaz7z+Uu5xYX2TJf4jmHEcC8GmI3qzznNejLx6tAgKs0148VVmIqet0nAIMVxmtC5nG3CyNjhm2zb+O9X0LcGJC08k+Vrsq7rtVNMxfgosivWGj+I35QUXSB0g/KUPBf9l1VIr4R2M2f619icadscfSTNlQ0P7o9TP0Cz+6idEpcUIqEYMquhtsXlrApZA0C1lSsKyrpHjyrELKphViZxNZUyzAd2MS7xDQ/y65XPZwuRkX7HSxtbSQSqoa+h8w81eEfyPjpiz771Wxpmb0RAWvxYbJQTgBugVrqRFaAriQ1LCb14x14gseUZ0PRWT9jNH4bC0tz8YMt/abY+epSofQdbe9QbeqzB2YtHayN4rgC9Q9NEnBEeYEGsr4GkQFDdq9OQjrBkWdAIEUjYQIzk9ubDznCV94/IN2NlArhnfx+1jF8qUIui7yzCyqtQBsq/5TkBIxj0rVrwx8G2AGlBoTTgsTh3nJ3thFm7+aOO4/1QhHtkaaDgXj9bbcCivL1GvQ+HH9xFli8laegHiqnju3HZ92CGmvHGh8dhXmciO0kjvhnGqCj9rUXfV2JX8MCncUGRAd5AcI0rWoM9VHjRANpFG3iMpJWda52hMUD1iwvkfEkuI8gItXirJdC8dvBVFocd0Rc+pYyOyijYAYx2BbFZ5WivDOsea7N
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c19b71-470e-415a-c6ad-08db35571f01
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 21:54:10.5766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iRnkCwweVfSLJ1nQqfd/qPBptLjSe/wNDMT+DXk1TBH0ubY9YHot131BSJKc/odQMME6pxeVtNm3LkIqfHfF/aXxddlW+yjcuqKaaBNe8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6387

On 04/04/2023 3:49 pm, Jan Beulich wrote:
> Provide support for this insn, which is a prereq to FRED. CPUID-wise
> introduce both its and FRED's bit at this occasion, thus allowing to
> also express the dependency right away.
>
> While adding a testcase, also add a SWAPGS one. In order to not affect
> the behavior of pre-existing tests, install write_{segment,msr} hooks
> only transiently.

IMO, the emulator is already complicated enough without us having
fallback logic to cope with callers that don't set up all the hooks.

Nor do I think making these hooks transient in the test harness is a
clever idea.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Instead of ->read_segment() we could of course also use ->read_msr() to
> fetch the original GS base. I don't think I can see a clear advantage of
> either approach; the way it's done it matches how we handle SWAPGS.

read_segment() is a much shorter logic chain under the hood, so will be
marginally faster, but it will be a couple of unnecessary VMREADs (on
Intel at least).

We could expose the get/set reg paths for cases where we know we're not
going to need sanity checks, but I'm not sure it's worth it in this case.

> For PV save_segments() would need adjustment, but the insn being
> restricted to ring 0 means PV guests can't use it anyway (unless we
> wanted to emulate it as another privileged insn).

I know, it's on the list.

What is rather irritating is that, depending on FRED or not, it's
opposite whether the guest user or guest kernel GS base is in context. 
Sadly Intel refused my request for a control knob to turn off FRED's
auto-SWAPGS, but I didn't really push them on it because for practically
all other circumstances, it would just be a way for OSes to shoot
themselves in the foot.

For PV guests, our regular ABI is half-way to FRED anyway.  I suspect we
can get most of the interesting rest of the functionality by adding an
ERET bit to the HYPERCALL_iret flags.  I'm not sure yet if we ought to
bother exposing CSL in the pvFRED ABI or not, but doing so would reduce
the divergence from native even further.

> --- a/xen/arch/x86/x86_emulate/private.h
> +++ b/xen/arch/x86/x86_emulate/private.h
> @@ -594,6 +594,7 @@ amd_like(const struct x86_emulate_ctxt *
>  #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
>  #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
>  #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
> +#define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
>  
>  #define vcpu_must_have(feat) \
>      generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -2886,8 +2886,31 @@ x86_emulate(
>                  break;
>              }
>              break;
> -        default:
> -            generate_exception_if(true, EXC_UD);
> +        case 6: /* lkgs */
> +            generate_exception_if((modrm_reg & 1) || vex.pfx != vex_f2, EXC_UD);
> +            generate_exception_if(!mode_64bit() || !mode_ring0(), EXC_UD);

Can we switch to X86_* please.  Alternatively, I've got such a patch
which I've just rebased over all your emulator changes anyway, if we're
happy to fix this in one fell swoop.

(Sadly, you did move some TRAP_* names into util-xen.c which I fixed up
in my other tree-wide exception constant patch.)

> +            vcpu_must_have(lkgs);
> +            fail_if(!ops->read_segment || !ops->read_msr ||
> +                    !ops->write_segment || !ops->write_msr);
> +            if ( (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
> +                                     ctxt)) != X86EMUL_OKAY ||
> +                 (rc = ops->read_segment(x86_seg_gs, &sreg,
> +                                         ctxt)) != X86EMUL_OKAY )
> +                goto done;
> +            dst.orig_val = sreg.base;
> +            if ( (rc = protmode_load_seg(x86_seg_gs, src.val, false, &sreg,
> +                                         ctxt, ops)) != X86EMUL_OKAY ||
> +                 (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
> +                                      ctxt)) != X86EMUL_OKAY )
> +                goto done;
> +            sreg.base = dst.orig_val;

Honestly, I think a comment is needed here, because I'm struggling to
work out if this is correct or not.

There is a 64->32 bit truncation of base with LGKS, just as there is
with MOV GS.

Which I think does happen as a side effect of protmode_load_seg() only
filling in the lower half of sreg.base, but I think it would be nicer to
have:

+            dst.orig_val = sreg.base; /* Preserve full GS Base */
+            if ( (rc = protmode_load_seg(x86_seg_gs, src.val, false, &sreg,
+                                         ctxt, ops)) != X86EMUL_OKAY ||
+                 /* Write truncated base into GS_SHADOW */
+                 (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
+                                      ctxt)) != X86EMUL_OKAY )
+                goto done;
+            sreg.base = dst.orig_val; /* Reinstate full GS Base */

Or so, because it's weird not to see a (uint32_t) somewhere in this logic.

> +            if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
> +                                          ctxt)) != X86EMUL_OKAY )
> +            {
> +                /* Best effort unwind (i.e. no error checking). */
> +                ops->write_msr(MSR_SHADOW_GS_BASE, msr_val, ctxt);

write_segment() can't fail.  (The sanity checks are actually deferred
until after emulation is complete, and I'm not sure if that's behaviour
we want...)

However, more importantly, if we actually take this error path (for some
future reason) then we've created a security vulnerability in the guest.

It will be strictly better to crash the domain in this case, than to try
and let it continue in this state.

> +                goto done;
> +            }
>              break;
>          }
>          break;
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -281,6 +281,8 @@ XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /
>  XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
>  XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
>  XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
> +XEN_CPUFEATURE(FRED,         10*32+17) /*   Flexible Return and Event Delivery */
> +XEN_CPUFEATURE(LKGS,         10*32+18) /*S  Load Kernel GS Base */
>  XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*   WRMSR Non-Serialising */
>  
>  /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -295,6 +295,9 @@ def crunch_numbers(state):
>  
>          # In principle the TSXLDTRK insns could also be considered independent.
>          RTM: [TSXLDTRK],
> +
> +        # FRED builds on the LKGS instruction.
> +        LKGS: [FRED],

Hmm...  This is the first case (I think) we've got where a dependency
that goes back numerically in terms of feature number.

Obviously we need to support it, but I'm not sure if the deep_deps loop
will cope in its current form.

~Andrew

