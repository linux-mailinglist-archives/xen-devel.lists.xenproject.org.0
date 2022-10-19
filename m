Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7776A6037F5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 04:18:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425422.673215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okyeg-00053X-8I; Wed, 19 Oct 2022 02:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425422.673215; Wed, 19 Oct 2022 02:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okyeg-00050l-4z; Wed, 19 Oct 2022 02:18:02 +0000
Received: by outflank-mailman (input) for mailman id 425422;
 Wed, 19 Oct 2022 02:18:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JMjo=2U=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1okyed-00050f-Rr
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 02:18:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140080.outbound.protection.outlook.com [40.107.14.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f2f4a1a-4f54-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 04:17:57 +0200 (CEST)
Received: from AM6P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::37)
 by GV2PR08MB8076.eurprd08.prod.outlook.com (2603:10a6:150:7a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 02:17:55 +0000
Received: from VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::6e) by AM6P194CA0024.outlook.office365.com
 (2603:10a6:209:90::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32 via Frontend
 Transport; Wed, 19 Oct 2022 02:17:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT017.mail.protection.outlook.com (100.127.145.12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Wed, 19 Oct 2022 02:17:54 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Wed, 19 Oct 2022 02:17:53 +0000
Received: from ec8b72b553d5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AEA02377-BD64-47BC-9BA3-8AB218A67891.1; 
 Wed, 19 Oct 2022 02:17:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ec8b72b553d5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Oct 2022 02:17:47 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by GV2PR08MB8194.eurprd08.prod.outlook.com (2603:10a6:150:74::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 02:17:37 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%4]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 02:17:37 +0000
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
X-Inumbo-ID: 3f2f4a1a-4f54-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZlBH6yT+3xky3s5qP4cvVTjGXjMLDgNCtvnR2bCRtoStHJFvpGqoOjMUuzB4hXOcMqj4Cdvmhxob2FcisOH11Rid1H6mIpuUZiksGUiTumzjGr0pB0t1L12pbYWkjilB2ITwtGJAcLM9da2FPv2LxnQ1ZFKzBDEsjW4nOgcqYS5YKfT9UfLTXcBiJBQMwr5PpFmLNJYKH1czdHCM8dOwTT6ZSfcJq3C7XjV1mFjLRAQgmSXvjLu0ch/8iWC4nDKPWIXKnIW4ODkKtKcW6F2z53afcDlTbVldBuuB6sjr5A+YN3SqmfinnKYQNeZ2PJnnHgzErFhJkvSevRA7tzMJTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XURcNgy3MkV74ZAjLI3+lIYyiOJT9nfVQUYsk9XBMWo=;
 b=SvKHzB9FiEFL2QjcTbAY7o4FOCHoSXwuoT3atABReYaZa4Q2iL4cea5uX8iQ7wQTsRSuybyl9B1uGeYeXSpP/1uo7UYMFtT/Nmd7bFKRSTdgSgbM1dSjYToa3WPkSXuY/pqT7poIpmayvTF12w0P994MVIBPlHi4ibyHTUvjbBikhI2zAaFDZpPa2VepnYIYCAZT7QWBz4t7CbdzA4akBHW6Ki/NTg3Lf+p6iSBy+bKJqP4e21km3ls+eSC+h0cIHA9ENuCYbGQXgyN+fFbp6su8VaTrbbTC8iTiqLWbm0G513AryYmbfZE2nr+RXyrv5KAMXVo0kLpS4R5dL27iNw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XURcNgy3MkV74ZAjLI3+lIYyiOJT9nfVQUYsk9XBMWo=;
 b=Ao53vf7hWg9/wHvpSp6ND8scMXrsahuz4tqzvldW52U3hk239vBBBgaPO4+YKPTIQNuTnZxaiWt6UKs7CTc/nE/EMJxfHdbWNOYM/zanuK6g/gDJljBeFnzQD1phZIZrEFKOm+dHggu2Qeozhe7PRfprsrT1QIyCDPD8x2Vi2w8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nP/vv35EVLdXXevQnoleV7uOX0+W48QHK175iSRFFOXoNLwNVLLO/oQHxXL9LSSMCkMOYqcm7OoKnDGTcLUUMjrze2JJ9hk87M2WD7NeES8rBKZyKFltLAHDEVZRRx18oc8a4Js9SqwWCst02ijRT0gd7fzTvb1e2mNctKIe4o0x2bnc6yLkYqRvjO2Mf5eCU8BPga4OqOVN1AmyGUAhSFEC0PHFlmvfsT+9X1u2f1SNwU6O/YnrIX99Owa/i4deSxsMNw06SfPNbCFzK8g/6DgO9h5niZLxLuBMw/68GmCQX4HM+++f4HFQ5MRBgziMGstjCfTrojhwLTPi6IAUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XURcNgy3MkV74ZAjLI3+lIYyiOJT9nfVQUYsk9XBMWo=;
 b=hgnqxuH8U0lK9FtAni8+zUpFbyGlxI6FLgPw2yLbPzMXZgs/4PoG3TOGgovUwwzmye6zzzj2qcAt3SKx4lml2ayGe5FP+DSZgoQNKo3Eo2A5AugRXGFmRmAzCZz5mml3lwVq+w1Y2wOjkp6jZVJ2LAGntGyjdto0AVUsAnQG5MaXC7L/Zt7nqYEXV5NoAhSVm4TSvpEiFwJF3mJwCmKfYjpB+x24kNcFxo/PpWJ6EJI3N8cPsVMUb57eNJnbg1sANtKqx8XckeSQsId/XSt3tRJkUG2q1+xuHXKEVyGR924uM1C+2FWTjg7nxmLSiYleQNq2+QoQWaeWN7WcMfgIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XURcNgy3MkV74ZAjLI3+lIYyiOJT9nfVQUYsk9XBMWo=;
 b=Ao53vf7hWg9/wHvpSp6ND8scMXrsahuz4tqzvldW52U3hk239vBBBgaPO4+YKPTIQNuTnZxaiWt6UKs7CTc/nE/EMJxfHdbWNOYM/zanuK6g/gDJljBeFnzQD1phZIZrEFKOm+dHggu2Qeozhe7PRfprsrT1QIyCDPD8x2Vi2w8=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 5/6] xen/x86: move NUMA process nodes nodes code from
 x86 to common
Thread-Topic: [PATCH v6 5/6] xen/x86: move NUMA process nodes nodes code from
 x86 to common
Thread-Index: AQHY3WMd/F6kSYZvakmE40WWtzpE9K4UO1IAgADGeHA=
Date: Wed, 19 Oct 2022 02:17:37 +0000
Message-ID:
 <PAXPR08MB7420DD4B01123A16896BDA7D9E2B9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221011111708.1272985-1-wei.chen@arm.com>
 <20221011111708.1272985-6-wei.chen@arm.com>
 <298666d7-f007-fb3e-99ab-18b01ad48b00@suse.com>
In-Reply-To: <298666d7-f007-fb3e-99ab-18b01ad48b00@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9343258818AE7D4F88472CD565157A6C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|GV2PR08MB8194:EE_|VI1EUR03FT017:EE_|GV2PR08MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d1b06f2-942a-4b03-af9e-08dab1782169
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6gn70GKFLAsg+50P1nq3I+6HxjsB00mq9J/79n1nf1UPS1dTzSOnTgVOQTe6/Kua67w31BSWA0uEfcZXv3li0vdDHxpCq0EvXq3lbi7XywpDqCTde59Y8kISdb/FYQ1iisg3NLxssZa2oR5VsdtlZGCt20KbcJVSY46BU8cDhClAT7v8iOogjY2rP5gFg2H6tDQ4V+3v0H79MGDsYlV7WrXxU7WPbWAscs1tuxpJfTWuwib1+B5jJHKNK98o7rFvkZTu04WYUWgJoC8SAy9BbAeNRcVsyV7BPkNrdCETysCorvPvZ50cHPpSvdBkGuni0kgGTiQnDbIW1Bgr/+OvGzahNz0BV/NjpKFTzKagUszYKslMUzPGPFiPJTTw1VRy/ZGwM17MKVfML8/JAVsQluXK9LpSRtF6rnLZtnLAlkNJlhcnTdZ8wS2koiVHgD8Z2frJf1SorS40OmAv6nDGvbFk5DVSmmXjfua994i0EJavjNWVT6FVOnako++Jgj27gfJ7P8Jyvu1qqf0XaZczeONhGAhW9VBGLUvpatQhG54JD2FRL1dPtYe2EjJVh63QpIsddPnChpzLgS3mgS96U5OUKHLYywTOtPsFL8ebmdsuHfnV/BvVsuopH35xvdcN4N3nqTPPysdrEnT5I590lEfTxWDTJO3k0g6XTLZAGtezYg2Q/DntShNbN1NOZesgZGsVZ4aJKu0pKqdFvmSL0QJG3aTpLVlvOug63vrs0QL8tDwvU2zgXgbCx0rGAp1sXjBZVqTnHW2TYdGOR097Mw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(33656002)(86362001)(9686003)(38070700005)(7696005)(6506007)(26005)(8676002)(122000001)(66446008)(64756008)(2906002)(66476007)(66556008)(4326008)(8936002)(38100700002)(41300700001)(52536014)(5660300002)(76116006)(66946007)(55016003)(83380400001)(316002)(54906003)(186003)(6916009)(53546011)(478600001)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8194
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fd63c3ac-b847-47e0-bb17-08dab178179d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k+S5ITa3BHTqLke9NWVLZiqVcIpOXgQtXPyEfk/0pmM5jMsWqp9WIGUXRyDQZ3GtwnO0Lvom3iTLmd5hsgGPKyLG2wYYBzq9QKx0tm5dhBNrkvjpvEzw6wACyiLXSwsW0ZC4Ci2+cW58+bsxKgDxh1ma2yoQKQ0tnDqubu1zYnwmwW89R5CSI2IHwJ9z1DIrARgL/+uRwbSpJ7rLKBdNeJ+WA6TYTALhPGJmXYjO84Io0N6n4q9NYkjFE/xEIsr8NJe6TYW6dbDspL58NyN26So3Dir/DbDbq143rOXA1dv8XR6T/TGuUMA0bd/aXo50Yb10cbvXzYlPNiwESF4fwDoo9HPcxv+9NieuK6Cab9X/Wh0fxFydB8lh2oWTPPNcF9JmCQpBtKbxnuTiGCHjRL5e+31F+t+0mDHThl4gnUNCY//l3bCVvx/VVvovrRYzL/YB+WVRtoQlGh5rIKWUeR8N7wJDvJ5kjgdw9vJndOyNcvIAhErNwMuX5PCQgBMWgxVrt4Uv6R5xon6JVve81aj7WsloHI4qtV1h6MHDFbXuM2Bzg82MybKcSy4+lBiYCnJS6SnghCE3Qrhgy42+NXNfiLXd0lJy37B6ihL8p8uL60odTgtpz4OchDKK955b538u2Yr/OKlGBFkwoUPPmsCtZLJgAJh6S48TGomAAcSJhgusT7Qhqnqbk/EnFfAV07enNO4Bqooh9uooBzPKM+QnAXyfrsghA1c0xli3z4WeokiLApVoW7eloIOXY3b6T5Yl8OD/paWfPwC1Q0s8aQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199015)(46966006)(40470700004)(36840700001)(478600001)(4326008)(8676002)(33656002)(70586007)(70206006)(8936002)(86362001)(6862004)(5660300002)(316002)(2906002)(336012)(186003)(40460700003)(52536014)(7696005)(9686003)(41300700001)(83380400001)(6506007)(26005)(356005)(82310400005)(81166007)(47076005)(36860700001)(53546011)(54906003)(40480700001)(82740400003)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 02:17:54.0019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1b06f2-942a-4b03-af9e-08dab1782169
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8076

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDEw5pyIMTjml6UgMjI6MDgN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogbmQgPG5kQGFybS5jb20+
OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1DQo+
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgR2Vv
cmdlIER1bmxhcA0KPiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8NCj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY2IDUvNl0geGVuL3g4NjogbW92ZSBOVU1BIHByb2Nlc3Mgbm9kZXMgbm9kZXMgY29kZQ0K
PiBmcm9tIHg4NiB0byBjb21tb24NCj4gDQo+IE9uIDExLjEwLjIwMjIgMTM6MTcsIFdlaSBDaGVu
IHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9udW1hLmMNCj4gPiArKysgYi94ZW4vYXJj
aC94ODYvbnVtYS5jDQo+ID4gQEAgLTQ2LDYgKzQ2LDExIEBAIGJvb2wgYXJjaF9udW1hX2Rpc2Fi
bGVkKHZvaWQpDQo+ID4gICAgICByZXR1cm4gYWNwaV9udW1hIDwgMDsNCj4gPiAgfQ0KPiA+DQo+
ID4gK2Jvb2wgYXJjaF9udW1hX3VuYXZhaWxhYmxlKHZvaWQpDQo+IA0KPiBfX2luaXQgPw0KDQpZ
ZXMsIHRoaXMgZnVuY3Rpb24gd2lsbCBvbmx5IGJlIGNhbGxlZCBpbiBhbiBpbml0IGZ1bmN0aW9u
Lg0KSSB3aWxsIGFkZCBpdC4NCg0KPiANCj4gPiBAQCAtMzEsMTEgKzQ2LDMzNCBAQCBub2RlbWFz
a190IF9fcmVhZF9tb3N0bHkgbm9kZV9vbmxpbmVfbWFwID0geyB7IFswXQ0KPiA9IDFVTCB9IH07
DQo+ID4NCj4gPiAgYm9vbCBfX3JvX2FmdGVyX2luaXQgbnVtYV9vZmY7DQo+ID4NCj4gPiArY29u
c3QgY2hhciAqX19yb19hZnRlcl9pbml0IG51bWFfZndfbmlkX25hbWUgPSAiTk9OQU1FIjsNCj4g
DQo+IERpZG4ndCB5b3UgbWVhbiB0byBsZWF2ZSB0aGlzIGF0IE5VTEwgZm9yIHRoZSBEVCBjYXNl
PyAoQnV0IHllcywgdGhpcw0KPiB3YXkgeW91IGF2b2lkIGEgY29uZGl0aW9uYWwgYXQgZXZlcnkg
cHJpbnRrKCkgdXNpbmcgaXQuKQ0KPiANCg0KWWVzLg0KDQo+IEknbSBhbHNvIHVuY2VydGFpbiBv
ZiAiTk9NQU1FIiAtIHBlcnNvbmFsbHkgSSB0aGluayBlLmcuICI/Pz8iIHdvdWxkDQo+IGJlIGJl
dHRlciwganVzdCBpbiBjYXNlIGEgbWVzc2FnZSBhY3R1YWxseSBpcyBsb2dnZWQgd2l0aCB0aGlz
IHN0aWxsDQo+IHVuLW92ZXJyaWRkZW4uDQo+IA0KDQpPaywgSSB3aWxsIHVzZSAiPz8/IiBmb3Ig
dGhpcyBkZWZhdWx0IHZhbHVlLg0KDQo+ID4gK2Jvb2wgX19pbml0IG51bWFfdXBkYXRlX25vZGVf
bWVtYmxrcyhub2RlaWRfdCBub2RlLCB1bnNpZ25lZCBpbnQNCj4gYXJjaF9uaWQsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90IHN0YXJ0LCBwYWRkcl90
IHNpemUsIGJvb2wNCj4gaG90cGx1ZykNCj4gPiArICAgIG5vZGVfbWVtYmxrX3JhbmdlW2ldLnN0
YXJ0ID0gc3RhcnQ7DQo+ID4gKyAgICBub2RlX21lbWJsa19yYW5nZVtpXS5lbmQgPSBlbmQ7DQo+
ID4gKw0KPiA+ICsgICAgbWVtbW92ZSgmbWVtYmxrX25vZGVpZFtpICsgMV0sICZtZW1ibGtfbm9k
ZWlkW2ldLA0KPiA+ICsgICAgICAgICAgICAobnVtX25vZGVfbWVtYmxrcyAtIGkpICogc2l6ZW9m
KCptZW1ibGtfbm9kZWlkKSk7DQo+ID4gKyAgICBtZW1ibGtfbm9kZWlkW2ldID0gbm9kZTsNCj4g
PiArDQo+ID4gKyAgICBpZiAoIGhvdHBsdWcgKSB7DQo+IA0KPiBOaXQ6IFBsYWNlbWVudCBvZiBi
cmFjZS4NCj4gDQoNCk9rLg0KDQo+ID4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4g
PiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+IEBAIC0xNTksNiArMTU5LDggQEAN
Cj4gPiAgI2RlZmluZSBQR1RfVFlQRV9JTkZPX0lOSVRJQUxJWkVSIDANCj4gPiAgI2VuZGlmDQo+
ID4NCj4gPiArcGFkZHJfdCBfX3JlYWRfbW9zdGx5IG1lbV9ob3RwbHVnOw0KPiANCj4gTm90IF9f
cm9fYWZ0ZXJfaW5pdD8NCg0KSSB3aWxsIGFkZCBpdC4NCg0KVGhhbmtzLA0KV2VpIENoZW4NCg0K
PiANCj4gSmFuDQo=

