Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FE4623E8D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 10:26:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441559.695699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot3om-0000cQ-K3; Thu, 10 Nov 2022 09:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441559.695699; Thu, 10 Nov 2022 09:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot3om-0000ZS-Gc; Thu, 10 Nov 2022 09:25:52 +0000
Received: by outflank-mailman (input) for mailman id 441559;
 Thu, 10 Nov 2022 09:25:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WK5U=3K=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ot3ok-0000ZM-6g
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 09:25:50 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8e9258c-60d9-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 10:25:48 +0100 (CET)
Received: from ZR0P278CA0148.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::23)
 by DU0PR08MB7613.eurprd08.prod.outlook.com (2603:10a6:10:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 09:25:44 +0000
Received: from VI1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:41:cafe::99) by ZR0P278CA0148.outlook.office365.com
 (2603:10a6:910:41::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Thu, 10 Nov 2022 09:25:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT019.mail.protection.outlook.com (100.127.144.122) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Thu, 10 Nov 2022 09:25:43 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Thu, 10 Nov 2022 09:25:43 +0000
Received: from 8b07d53cb028.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7E470F6E-C7EB-43A7-B4E9-E2139C39886D.1; 
 Thu, 10 Nov 2022 09:25:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8b07d53cb028.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Nov 2022 09:25:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM7PR08MB5319.eurprd08.prod.outlook.com (2603:10a6:20b:dc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 09:25:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Thu, 10 Nov 2022
 09:25:36 +0000
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
X-Inumbo-ID: a8e9258c-60d9-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=b2EHiCWL4CYy30M+lFqrwwWVNzUB00b96X8DO42hlJEO3J3xc/6T20uj40RED/UVlifIFrtWZWYuY/wtVPFe1T889b1RQdmMn91eamJWiuwOc7bQ6kUcbKqPzqoN1/IB7mEwRXztxYl2Y/3xe0fbVkZ6ChBVfzHEYoltzUT2QYmpMDv1zkKOjKGJP0TZczNpdnsQjziQo8QBZ+7/cqCc2Ktjrvh0RJ6VuRaS6sH9hj+FyOymRDHiuM8stcayPJ9zzOPN9crifdxz/K+EHwp3ltLu892OfdZtTJjifzGSzX7g3cnvm6pqqDH6wfgOTgp9ZlVeIzgt8Zf+jSGqIamhIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8lggpRIGZfOiJs0bWT/CM5KKEs5qWogZqPrPKzVnZs=;
 b=DddwQGR2Gj/ttf7Q6kZ7L2BkjJWoEvDzo5LAlQBORKfYuk19RAXweglzlcfrD3DIwMkKBuXctPymssWLBio02k5uIGYC1frUYG5AAAf5hs5G9zfHEqhcGkBMzKXyJvV5nl+vdco7PI3U+l71zZDLGBXSfUdqX4g6GGDCdzJQ6CIm5VeTDKDNfIeXFxdU6Cy8xSyIrPIKJKHMW2eCG08LS6EZq9xTTTy1ndtXfsiCbRj/IwSLLHPDTSWwwoo6May/fby3X4OpPJtnqIM+mjTmOAgTg54D0Ym3N1pa1YKv9yAfCePYmTwsp2Hep6qhuCg5pGYw5Ip50Zo8U7Una+x/rA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8lggpRIGZfOiJs0bWT/CM5KKEs5qWogZqPrPKzVnZs=;
 b=HSrDqS6esdgSyM6YyEkg6L0l4TZjd06As0XBSWEB4ediAR03NAHFbMaazxtqqx4pDPqLkKGC9/Z0wDD6Wfgqce6WTpdX1h/peeVR3Rcf8Sod5+K8tVyiZlnlucWXsHgn4sYcRsncnoMfWho1g00rOCtn8l3Hf2zOMw7ZVNFyHHk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUMaDpNZda7R+nWJzLzXs45L1oxy4Ek3MrKhyiNfVSy/ggBkfobF6ZLKYK6IEYc8Yvp8GwJxEIXh1L3EpQ7D8ezf9nO4rtNvb6eTRnMSBeHFT6d7TWcfQUzt1wLhL0gayZ+htbvhlxn0PkTyINawYuq3zuFKZb/HGRnVl4HJU43tFY7tJ8gRgMVIaTbDD+ymgpHhk+dqwlCFZgXRVdMcGBK5VdYZaTI9kzCCep2+Rs5ibf3PiE2mstp68jXiUNCXie/GpbbyOp6p34dNVV7MHcU5q6KyFTB7+xmSGrYnsZuTtIKhnBdUNTvtdBt4j3pJz3TZTIva3whXaCnDYEUK/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8lggpRIGZfOiJs0bWT/CM5KKEs5qWogZqPrPKzVnZs=;
 b=cx8RV1rh/bTItAPCWiJL+h8GAttfHlSOyPdoe97Y/JmKScCzg/ewsVV2C9R8ThojGXkh0DXA7dmCZsi0OA0eAeYOBb4yni35qKHJPpSLbnjHIe0iYGtZQK8dMgnm09vrd1VzRaK+N2RCyrBd6vADeo6htdmLz6kSmrjQP8kQV/zpu3gTQzanvCrVp0bD7Iinc5JOVYJyuhXJQNOOpyDd3bZbvVDNTqBn5FlXBljLIeREvC6EmvhZacleSWXU/dlAlCwuZ6X9fuRACFGl/9Ip+jLAFtnU62QyryW04j0RuAfaQuFH30mX7qJMXFfyTroM6T91YJ76OVPDiRVEF1cN4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8lggpRIGZfOiJs0bWT/CM5KKEs5qWogZqPrPKzVnZs=;
 b=HSrDqS6esdgSyM6YyEkg6L0l4TZjd06As0XBSWEB4ediAR03NAHFbMaazxtqqx4pDPqLkKGC9/Z0wDD6Wfgqce6WTpdX1h/peeVR3Rcf8Sod5+K8tVyiZlnlucWXsHgn4sYcRsncnoMfWho1g00rOCtn8l3Hf2zOMw7ZVNFyHHk=
From: Henry Wang <Henry.Wang@arm.com>
To: Christian Lindig <christian.lindig@citrix.com>, Julien Grall
	<julien@xen.org>
CC: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: RE: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Topic: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Index: AQHY84e5FV9zwZ/cMEqESsIC5Hbn0K41MEgAgACxXpCAAfedgIAACnbg
Date: Thu, 10 Nov 2022 09:25:36 +0000
Message-ID:
 <AS8PR08MB79919ABE0786424904E21A8392019@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <16f52592270e36670947fbcbe1e4d91f1daf9823.1667920496.git.edvin.torok@citrix.com>
 <4baa6580-a779-f1e4-b504-59895fa97309@xen.org>
 <AS8PR08MB79919C95C2B529B887D322CB923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <DF0BBACD-9D12-4B60-86F1-243A6018F8D4@citrix.com>
In-Reply-To: <DF0BBACD-9D12-4B60-86F1-243A6018F8D4@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B898338E1D01C745802EBCE1E1B1EB68.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM7PR08MB5319:EE_|VI1EUR03FT019:EE_|DU0PR08MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa342f0-05bb-46f2-80f2-08dac2fd8ac9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DvkXNBbXcbdfvRXO7U4wXO8nfH1+Mg3toNnsECmfMRVoP4jVwESWZcA+P3MUuaI3XY9cA6zljHgb99BPwvlRviOqtFiUuSrTMr6ar4pjUL/L/POhxZSS67xOL4U6zlScTFbjf3U+BDYQ91hZeSo68ppf3Dr1HVve7zlhUKpNVdKQnpwpPrhTzWs/IxOUOqRs1uJ3NYPl88agplR7Q99XHjCM+E5OEsKBriOkewOGcD2AlIuuUvnjUg+GECNuXu/um6fKCJa6s9hRIQ3Fo0tAZq8XODCftpe8W+hHsc0dsJS95iVkGJgxDHaZbmrprfAUtk9Y9pqxCWdE1r1Rw1Rnp0C5DZnfCRcWVDfdvGeLPUg8LKxS6Z/n54LOiS+ArC7aFanY/jtVtxYgXBg2bBDOzSrlwYJltghXJUWkVo4CpfCwM3ebHAy5Su9QA87YCfOxDsGB27xCi5ess+Zj9Haqinnw+OWG1Gq9YNufNpnIdCI8ZlkbW6lKJzYU230ZLGNDxnHbKTT6u45GGkADWey3szidrPF4/skr/jLaE8OMteoUk7a2A9vdu3Zz17MmbUnw7ssfxDaOKn3/Rp5mcCQenDRvo9l6FSu+y69OcjTKOMpUJYtfiUPOd0raew9cCCgobHGRmGcG+snfAqAbTy8RTfs60qjmnWWwirbkEisTNNkwG4zeCVSFZ7L8xxnR9DsggK6fMpnDts89KDA3CDNvhcj/xQXnsTWxAY26fU2TCCCcCqSREU4c9Egev2MDgdFKy70MqBO6kWZIUqrzf5qiBflWhv3tP/VfqOVfburhsaE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199015)(38070700005)(33656002)(478600001)(122000001)(9686003)(2906002)(86362001)(41300700001)(186003)(5660300002)(52536014)(83380400001)(38100700002)(76116006)(71200400001)(66446008)(66476007)(54906003)(66946007)(316002)(7696005)(26005)(64756008)(6506007)(55016003)(66556008)(8936002)(8676002)(966005)(4326008)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5319
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c9ac6c81-c86a-4544-b5b4-08dac2fd865c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7xUC4lf8gtcBSS8AlemV+0AZqwanhcXl2EVnBI1/MrURu/7a+s50pw1oWraU4qc07TfudZmFYE6e4dzLKH0NMdi0ic3I9y7Y03Htrm3ARFTp3YAYHmHx0Twar57z/QfNKJ96KMh1OTSIMhdAA6i0hgR6ITyfWOsqr/mT1DruycSWIsh+JCMqrS+O3V6x+MdTEzjK8pEs/KsHkz+AjkW77fTUcqk+XIbX09l1a0P+cjJvk1tHD0F7hkh0icbWejuykMIFIx4xsjrqBkMpvAr/1uQG1pxB5uHriiBHeA9kZ6R3i+g0NPvUL1k5P21koujsRyLKfVwKHO6yIYJW1VM1yS4q++8rD45uC2LQ05ZMnt2jRiEpmdjlpalrKqMCIO+l2SzpmuN49q1SvVau6TPhBbcbcHoFlK7AMFCjSbEFxD2VJiDQMSLLQAsXD2sp65+DO4Y+W2hFDGHdLn/qOQqxjcjqYF+0ItIkg85FLu1mhGLVDCnXeVvuqp8IEWZiHbaqVwVF1/7jija4RxEh9YIj307Qg8TB0hgWJ+v6JHTWEEh3yTICkno37t7I3gLzjM3CA1fdRegr82ZecDrqDEV7F3qhE7PskuM1AyU37TellXnnfqRkKuaNHXq8U1jblKfNvdBL2HhGqhNVd+RUeV7ncNbE+YFT7UC2pB6u5rD25OiKj0Zi0TvRF7YCWbGa1kwe5uKPVQ+nPUWe95N1f6G8X/4bJc5ltVVwJaqG73Y3JTuQ8WfVy6WxprGxUP8l6dW/6OFQr3xtDlQkPGyzLX2aJ4dNN38C5Pbkpca3bMag8vH8ykgIUXw0oaMrZKLQWvVS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(36840700001)(46966006)(40470700004)(356005)(478600001)(82740400003)(82310400005)(107886003)(81166007)(966005)(110136005)(40480700001)(2906002)(36860700001)(54906003)(316002)(5660300002)(6506007)(7696005)(70586007)(9686003)(86362001)(41300700001)(33656002)(83380400001)(52536014)(336012)(8936002)(26005)(70206006)(4326008)(8676002)(40460700003)(55016003)(47076005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 09:25:43.6385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa342f0-05bb-46f2-80f2-08dac2fd8ac9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7613

SGkgQ2hyaXN0aWFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENo
cmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBmb3ItNC4xNyB2MyAwNy8xNV0gQ09ESU5HX1NUWUxFKHRvb2xzL29jYW1sKTog
YWRkDQo+ICdtYWtlIGZvcm1hdCcgYW5kIHJlbW92ZSB0YWJzDQo+ID4+IFdoaWxlIEkgdW5kZXJz
dGFuZCB0aGUgZ29hbCBhbmQgc3VwcG9ydCwgdGhpcyBzZWVtcyB0byBiZSBhIGJpdCB0b28gbGF0
ZQ0KPiA+PiB0byBkbyBpdCBpbiBYZW4gNC4xNyAod2UgYXJlIG9ubHkgYSBjb3VwbGUgb2Ygd2Vl
a3MgYXdheSkuIEF0IHRoaXMgc3RhZ2UNCj4gPj4gb2YgdGhlIHJlbGVhc2Ugd2Ugc2hvdWxkIG9u
bHkgZG8gYnVnIGZpeC4NCj4gPj4NCj4gPj4gVGhpcyBpcyBjbGVhcmx5IG9ubHkgYSBjb21lc21l
dGljIGNoYW5nZSBhbmQgdGhlcmUgSSB3b3VsZCBhcmd1ZSB0aGlzDQo+ID4+IHNob3VsZCBiZSBk
ZWZlcnJlZCB0byA0LjE4LiBUaGF0IHNhaWQgdGhlIGxhc3QgY2FsbCBpcyBmcm9tIHRoZSBSTS4N
Cj4gPg0KPiA+IEkgYWdyZWUgd2l0aCB5b3VyIHBvaW50LiBJIHRoaW5rIG1heWJlIGRlZmVyIHRo
ZSBwYXRjaCB0byA0LjE4IGlzIGJldHRlciwNCj4gPiBnaXZlbiB0aGUgZGVlcCBmcmVlemUgc3Rh
dGUgd2UgYXJlIGN1cnJlbnRseSBpbi4NCj4gDQo+IEkgZGlzYWdyZWUuIFRoaXMgaXMgYW4gYXV0
b21hdGVkIGNoYW5nZSB0aGF0IGNhbiBiZSB2ZXJpZmllZCB0byBub3QgYWRkDQo+IGZ1bmN0aW9u
YWwgY2hhbmdlcy4gRWR2aW4gaGFzIGRlbW9uc3RyYXRlZCB0aGF0IHdyb25nIGluZGVudGF0aW9u
IGhhcw0KPiBtaXNsZWFkIHJldmlld2VycyBpbiB0aGUgcGFzdCBhbmQgY2F1c2VkIGJ1Z3MuIE5v
Ym9keSBleGNlcHQgRWR2aW4gaGFzDQo+IGNvbnRyaWJ1dGVkIHRvIHRoZSBhZmZlY3RlZCBjb2Rl
IGluIHllYXJzIGFuZCB0aHVzIGl0IGlzIG5vdCBhIGJ1cmRlbiBvbiB0aGUNCj4gcHJvamVjdCBv
dXRzaWRlIHRoZSBPQ2FtbCBwYXJ0LiBJIHN1Z2dlc3QgdG8gYWNjZXB0IHRoaXMuDQoNCkkgdW5k
ZXJzdGFuZCBwb2ludHMgZnJvbSB5b3UsIEVkd2luIGFuZCBKdWxpZW4sIGJ1dCBJIHRoaW5rIGlu
IHRoZSBlYXJsaWVyDQpkaXNjdXNzaW9uIGluIHRoaXMgdGhyZWFkLCBKdWxpZW4gaGFzIHByb3Zp
ZGVkIGFuIGFyZ3VtZW50IFsxXSB3aGljaCBJIGRvDQp0aGluayBpcyBhIHZhbGlkIHJlYXNvbiB0
byBkZWZlciB0aGlzIHBhdGNoIGEgbGl0dGxlIGJpdC4NCg0KQnV0IHNpbmNlIHlvdSBhcmUgdGhl
IG9ubHkgbWFpbnRhaW5lciBvZiB0aGUgT2NhbWwgY29kZSwgc28gaWYgeW91IHN0cm9uZ2x5DQpp
bnNpc3QgdGhpcyBwYXRjaCBzaG91bGQgYmUgaW5jbHVkZWQgZm9yIHRoZSByZWxlYXNlIGFuZCB0
aGVyZSB3b3VsZCBub3QgYmUNCmFueSBtb3JlIGV4cGxpY2l0IG9iamVjdGlvbnMgZnJvbSBvdGhl
cnMgaW4gdGhlIG5leHQgY291cGxlIG9mIGRheXMsIEkgdGhpbmsgSQ0Kd2lsbCBwcm92aWRlIG15
IHJlbGVhc2UtYWNrIGZvciB0aGUgcHVycG9zZSBvZiByZXNwZWN0aW5nIG9waW5pb25zIGZyb20g
dGhlDQptYWludGFpbmVyLiBIb3BlIHRoaXMgc29sdXRpb24gc2hvdWxkIGJlIGFjY2VwdGFibGUg
dG8geW91Lg0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzFmOGM5MGNk
LTgwMzctODRlYi1kNmY3LWM2MzlmOGE4NzU4NUB4ZW4ub3JnLw0KDQpLaW5kIHJlZ2FyZHMsDQpI
ZW5yeQ0KDQo+IA0KPiDigJQgQw0KPiANCj4gDQo+IA0KDQo=

