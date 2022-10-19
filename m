Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C823603AFA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 09:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425603.673539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3tl-0001ob-8S; Wed, 19 Oct 2022 07:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425603.673539; Wed, 19 Oct 2022 07:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3tl-0001mI-4l; Wed, 19 Oct 2022 07:53:57 +0000
Received: by outflank-mailman (input) for mailman id 425603;
 Wed, 19 Oct 2022 07:53:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lsc4=2U=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ol3tk-0001IL-4d
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 07:53:56 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2073.outbound.protection.outlook.com [40.107.103.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dcfb18e-4f83-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 09:53:55 +0200 (CEST)
Received: from ZR0P278CA0099.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::14)
 by DU0PR08MB7566.eurprd08.prod.outlook.com (2603:10a6:10:31e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 07:53:48 +0000
Received: from VI1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:23:cafe::57) by ZR0P278CA0099.outlook.office365.com
 (2603:10a6:910:23::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 07:53:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT016.mail.protection.outlook.com (100.127.144.158) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Wed, 19 Oct 2022 07:53:47 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Wed, 19 Oct 2022 07:53:46 +0000
Received: from cd2c502f2146.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C21989AF-1E69-45E6-91B9-A931EFF106D6.1; 
 Wed, 19 Oct 2022 07:53:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd2c502f2146.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Oct 2022 07:53:35 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AS8PR08MB5927.eurprd08.prod.outlook.com (2603:10a6:20b:292::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 07:53:26 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 07:53:25 +0000
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
X-Inumbo-ID: 2dcfb18e-4f83-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jMtVabdl+3ZEx3LCGQtTcgIKGH8PcwWRP/+SoyyrhTshjCIJNJY0c2X9SuVqvGnJ/YPJAEQoqLya5w6GPPOrGLjeedJbqMtX4IZbfa+jpifaN/SRV01Kq3z3aFVzyipKskoj222xBNMaDFIzaulzpIZMJ2y4JHbi0k5Guvwl+26jCJELfYSanQpIZ9/E3fzg+QhWT//mDvAlKnDkTZXec1E7C8cf4lpegM8sTpYOIYddAtpzKhFzKIQF+6HpPxnxT8oGa9BoWm8wlTsh1VSzbnXNNgbfcA8sD9ec0A0VbctW5J9TR6pyR6VnSDUwLk84LN/q0Gbhu76PhqaUkadFoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoue+sftUPG41DLR3UGsHkPb59JJLDks6XMlrJljExk=;
 b=IhIUPsStIhFfXMK7WkHDKZ1ZAM2Gw+3EVvPEI0XstJtGYimeBwyD4iDiUfgRrzMeYC3UxiteNKucDtjpn7iZK9pS8MyNVsrpwfpNCstllRc1OHxOMXSFaQ79uyE/j7Ba0DtR9n0Qf8DIb5C9moXNp1CNv9TCRL4AAUilQiTLlFhTSyxPQBJ7mr6TwcqVwgO0Dow0Wu+MZkF4gs/PmgLKrWa75gSA01PgjzQ39M5eu7NiXdfljK4uf6pGWH2X+y0EBK0h2xzwwivd0tCzkRLtFFxqbXRNeENy52DTP3SeWnOQ+ceS5oEs2XTKqqoMYStJagsnvb2sRVrrSRq/+hS3YQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoue+sftUPG41DLR3UGsHkPb59JJLDks6XMlrJljExk=;
 b=XbL48FxHBNVbDRmN+GRO79KWh+QBVIp+lNQcHNdjzt1rsUOx1RtD97WeL7wczxlBanqmQKn2/jyOhSaelKWhQXJxtn5Q1U+ZOFGTsHGvI4Y9l2a277LavZQukV9shnbd4xLVvjL7oTw7GhFn+Mp8gtx6o3SMrJIt727kT91eoaU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 97f69dac5f32b2f3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgNNek7baVS1CZdpN1oYupLxPtGdXjGDN1m/Xx7BhN7gmna7SB+rhnOJF2wfZyVdv4aZBB+aNgnWQuYXoFIWwdqRg5xg3lquBo5uxGI36OcOtZHvr2TFMi0RcZBMHLgkqth301cS+RCbTVIv/Q9+qYC4yd8KH61embNrWKwKF9hLVMuPKcqr7Y1uuFxRoBpIBk5xgiWSd4nnu0y1eFohWwQOzT8TT639IsGVmTc7aPnMJd18q8doooDxTUNS1mREUBaBUFY0cd9iZUbCacN8JNxDo7OzNjoAwiXy/YGwxahbCYnCYZCufbUFiq+mI9At6zxX6ega/XDjJsCwjgCsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoue+sftUPG41DLR3UGsHkPb59JJLDks6XMlrJljExk=;
 b=i3k73I3yZXRPXnaEF07jXuxQxE0iGrhtQ5vhWxrTNERL8ZdNpYK2L15ITrNeIhaumB4SCM8lmX5PF92ieKYtzgs0i1e2Bz4oMnco6q9zzMLdXyhIpVHM7AqZE5Uj+i+QpwvAd3vTm4D0QDFatNWzkRLEnEgB2eSq99foUTsWLodhjbRhiV85SyWW83Z344iDw+d8KcFViXfQoEM9nLEwOe8GDrNYnVBfhDsVtVMBcb/yXjCeZIqAraXkR4kkYs6n4b2CF7w+a2vf7auOtX3RAKHi5nnyQNF7At0vZg3QCVNYDyXFjb2fMaFlUkiJzxBAbeIW2PrCNTL4LDRfXmHMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoue+sftUPG41DLR3UGsHkPb59JJLDks6XMlrJljExk=;
 b=XbL48FxHBNVbDRmN+GRO79KWh+QBVIp+lNQcHNdjzt1rsUOx1RtD97WeL7wczxlBanqmQKn2/jyOhSaelKWhQXJxtn5Q1U+ZOFGTsHGvI4Y9l2a277LavZQukV9shnbd4xLVvjL7oTw7GhFn+Mp8gtx6o3SMrJIt727kT91eoaU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Proposal for deviations in static analyser findings
Thread-Topic: Proposal for deviations in static analyser findings
Thread-Index:
 AQHY3lPHTZwvWtdyCU+0K6Hw9nMyM64L9DeAgAAneoCAABdHAIAIGdUAgAADdICAAAu3gIAA8h6AgAAU+4A=
Date: Wed, 19 Oct 2022 07:53:25 +0000
Message-ID: <5A5A9588-A6A3-4F46-8498-A5382C6144F0@arm.com>
References: <EBCDE6CE-A84A-48C7-B3C2-7856E5D2392B@arm.com>
 <ddc5039d-e312-326a-b71c-8d08d04100e0@suse.com>
 <186C83D7-6C7A-4319-86E4-69F7FDA7FDA5@arm.com>
 <559a3d4c-08ea-ef8c-9a56-2b53db3d51e4@suse.com>
 <E00E3AE4-7863-4231-9DB7-A7B66C8F6791@arm.com>
 <233a9356-b64f-37f7-d7ee-3d6223224497@suse.com>
 <A906FDB6-7DA5-4900-A6DE-1140231E69AE@arm.com>
 <9b113db9-4dce-d300-9393-a8572ee4fdcd@suse.com>
In-Reply-To: <9b113db9-4dce-d300-9393-a8572ee4fdcd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|AS8PR08MB5927:EE_|VI1EUR03FT016:EE_|DU0PR08MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ee0009-3666-4ffa-0006-08dab1a70df2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XFF4MBwN7cfc0SS72VRdlLYnqSimRW/wM4UojCPJvfCp+J6gCatVz03IP11lBgtedWiOvuCnB3Mu3Z7nviRAoeOCx6zqFWPJcRys9ZUFtmSDPWONLBSNzVFygyoB7Yag9+qqshEOZJF3IOZEJGW/HNKRQZYC7IOrCSXZaH3Re0xPWHr6qV0Z8ptG+qchSydJDPVotvj0nYgUwmFuwnnXJmOTgb4rQUuBOUCiM1WrfU2uk+8sNfKSbMF3uynAF8sK1Ffmj4NxId69xamhOB35f/mXCiZwyY0RHhznuFcv0XzylIdTWrtgZd4r92Oj8alZO0fwccW3vwCgQZ6ZCR+4K0On1sqBVpRq+4bm8dBbSFgZ83vCV4pSc5NShGBnVTR8Wf+zr6Z4MGi+mRGb9+PLvj1fkC7Z+MfCX0E37h5IeROSK/ZOZMChnl8v37gohqlqRJQpXnI5/4MagWbBq1WD2g1LzkC/1kS7/ku5A5lVpNgbJX9Hm+cpcR0eGHGZCdKKwlCzr9fomlQ5v1MEAJ4HLurnaP86g3XGcO/LjX3r6F++dp5BUpBv4EawOVVgs9mazyChiA14Ie1/1+O9lgP+DuH5idJtR1+DetpDAxvH293SvpOENSWgMREo/VRcepHXuFbP15tsoBAHPEc9Dc3NGYkuSHCjdbCijld9LKcIGVfwhp/US/YwxK7U3mZwpHTEVE+BKVyq6xmz3a9mzXaY00HTuy++0OlNUHRKnBiXMZ+6vxp3kCv8zcTdSUSC/IdS3SY4xLOklpRYppI6kxVWMbSRkbbT4eIZ0+muDQ5UMlA0lvNXUdeKZ+yxbNwaSc6/2TxvFPMJqfzTnAiNvod0XA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199015)(33656002)(36756003)(91956017)(122000001)(38070700005)(4326008)(316002)(54906003)(66476007)(6916009)(86362001)(64756008)(66556008)(66946007)(66446008)(8676002)(5660300002)(38100700002)(6486002)(478600001)(966005)(41300700001)(53546011)(6512007)(6506007)(26005)(2906002)(8936002)(76116006)(186003)(71200400001)(2616005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <121AD643FDD1FF48AF5108C63981758D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5927
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	776a0664-f966-49f7-f9cc-08dab1a700dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	szJTkzFro2kKlY+TX6kMbwm8A7VP1StjiIckOwWMkwS4KWhVboD5Cnx10D6sqcfYwHc9rucuvOyoZ54qQvV1uceBeQd6zO84UmWchj8ZtH0vxj17xsVI/MWaDovPWYgQQQHiopxGNw2/TSWgnPLbf8GZVPd03mINnxQ8LyK3m3mljz34T7xN9hhO+tWqjpG4ExxqZI7Xnoz7PYvao2xPiSxYqJ/3Cwyyt4Qe+QxwLkWHWjoX0ji/a+Iwn9rwzqN+J47DxzxP/YK5ysu83bWOIeKQFtYlmPxvQH9e1GoveW33h1pDvyYoAoEP5RDfkwiwYI6HvFAz7Y1RnLUGR57RKJKB8891jpnnlKG960Je3XcUPeLCyEh+j26N/sO/6O55AFdPAIu25cAJwZgmsjdqJnPWvwNtRyw00/7xu01RxmdoTCTiqwT/I1Fl8XA957A056HBMIeaq5cpQNNO1wkO/nTsB58L5R0YE9QkvhNctfK2wlHi7r+qd7S/dDLz5spXPdFIprWMiJKZ9RJdlUlwXPGmXUZg0/sGN/qMkdTHAcifRUfGQSOrcBodrGy5Kr/u7LLJnXX8U1/n70aPDsQvhp55Vw6hH26I/ZFxVTIPvfFx46/Ol1+OhH6CufrxYsb54cTNB/DCGMziWmlHVHwjbtNiO6Xk/BmRovFrB2pzfPLZDdhQytgCt0l6a5sjxF63PKKo0JzUb8BQCIdWF5gDuDso3qm074/jXISwnyK5AJRNbsHEp+sKye13T3eoqu81HbChmssejjsOU+prAaNn3Rjc4ZHwu8uGlrYw/6SSIfo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(40470700004)(46966006)(36840700001)(81166007)(47076005)(186003)(6486002)(83380400001)(356005)(336012)(86362001)(41300700001)(36860700001)(2616005)(5660300002)(82740400003)(2906002)(966005)(82310400005)(40480700001)(4326008)(8676002)(70586007)(6862004)(6506007)(478600001)(6512007)(316002)(8936002)(70206006)(40460700003)(53546011)(36756003)(54906003)(26005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 07:53:47.6714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ee0009-3666-4ffa-0006-08dab1a70df2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7566

DQoNCj4gT24gMTkgT2N0IDIwMjIsIGF0IDA3OjM4LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTguMTAuMjAyMiAxODoxMSwgQmVydHJhbmQgTWFycXVp
cyB3cm90ZToNCj4+PiBPbiAxOCBPY3QgMjAyMiwgYXQgMTY6MjksIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMTguMTAuMjAyMiAxNzoxNywgTHVjYSBGYW5j
ZWxsdSB3cm90ZToNCj4+Pj4+IE9uIDEzIE9jdCAyMDIyLCBhdCAxMjozNCwgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IE9uIDEzLjEwLjIwMjIgMTI6MTEsIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+Pj4+IE9uIDEzIE9jdCAyMDIyLCBhdCAwODo1MCwgSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+Pj4gT24gMTIuMTAuMjAy
MiAxODowMCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+Pj4+IEVudHJpZXMgaW4gdGhlIGRh
dGFiYXNlIHNob3VsZCBuZXZlciBiZSByZW1vdmVkLCBldmVuIGlmIHRoZXkgYXJlIG5vdCB1c2Vk
DQo+Pj4+Pj4+PiBhbnltb3JlIGluIHRoZSBjb2RlIChpZiBhIHBhdGNoIGlzIHJlbW92aW5nIG9y
IG1vZGlmeWluZyB0aGUgZmF1bHR5IGxpbmUpLg0KPj4+Pj4+Pj4gVGhpcyBpcyB0byBtYWtlIHN1
cmUgdGhhdCBudW1iZXJzIGFyZSBub3QgcmV1c2VkIHdoaWNoIGNvdWxkIGxlYWQgdG8gY29uZmxp
Y3RzDQo+Pj4+Pj4+PiB3aXRoIG9sZCBicmFuY2hlcyBvciBtaXNsZWFkaW5nIGp1c3RpZmljYXRp
b25zLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gQ2FuIHdlIGFkZCBwcm92aXNpb25zIGZvciBzaHJpbmtp
bmcgc3VjaCBlbnRyaWVzIHRvIGUuZy4ganVzdCB0aGVpciAiaWQiDQo+Pj4+Pj4+IGxpbmU/IE9y
IGlzIHRoZSBpbnRlbnRpb24gdG8gYmUgYWJsZSB0byByZS11c2Ugc3VjaCBhbiBlbnRyeSBpZiBh
IG1hdGNoaW5nDQo+Pj4+Pj4+IGluc3RhbmNlIGFwcGVhcnMgYWdhaW4gbGF0ZXI/DQo+Pj4+Pj4g
DQo+Pj4+Pj4gSSBwcmVmZXIgdG8gZG9u4oCZdCBzaHJpbmsgaXQsIHRoZSBuYW1lIGl0c2VsZiBp
cyBub3QgdmVyeSBsb25nLCBldmVuIHVzaW5nIG1hbnkgZGlnaXRzIG9mIHRoZSBpbmNyZW1lbnRh
bA0KPj4+Pj4+IG51bWJlciwgaXQgcmVtb3ZlcyBhbHNvIHRoZSBkZXBlbmRlbmN5IG9uIHRoZSBm
aWxlIG5hbWUuDQo+Pj4+PiANCj4+Pj4+IE5hbWUgbGVuZ3RoIGlzbid0IHJlbGV2YW50IGhlcmUs
IGFuZCBJIGhhdmUgbm8gaWRlYSB3aGF0IGRlcGVuZGVuY3kgb24gYQ0KPj4+Pj4gZmlsZSBuYW1l
IHlvdSdyZSB0aGlua2luZyBvZi4gTXkgcXVlc3Rpb24gaXMgYSBzY2FsYWJpbGl0eSBvbmU6IE92
ZXIgdGltZQ0KPj4+Pj4gdGhlIHRhYmxlIHdpbGwgZ3JvdyBsYXJnZS4gSWYgYWxsIGVudHJpZXMg
cmVtYWluIHRoZXJlIGluIGZ1bGwgZm9yZXZlciwNCj4+Pj4+IHRhYmxlIHNpemUgbWF5IGJlY29t
ZSB1bndpZWxkeS4NCj4+Pj4gDQo+Pj4+IE9rIEkgbWlzdW5kZXJzdG9vZCB5b3VyIHF1ZXN0aW9u
LCBub3cgSSB1bmRlcnN0YW5kIHdoYXQgeW91IGFyZSBhc2tpbmcsIHdlIGNvdWxkIHJlbW92ZSB0
aGUgY29udGVudA0KPj4+PiBvZiB0aGUg4oCcYW5hbHlzZXLigJ0gZGljdGlvbmFyeSBmb3Igc3Vy
ZSwgYmVjYXVzZSBpZiB0aGVyZSBpcyBub3QgYW55bW9yZSBhIGxpbmsgd2l0aCB0aGUgY3VycmVu
dCBjb2RlLg0KPj4+PiANCj4+Pj4gUmVnYXJkaW5nIHJlbW92aW5nIHRoZSDigJxuYW1l4oCdIGFu
ZCDigJx0ZXh04oCdLCBjb3VsZCBpdCBiZSB0aGF0IGF0IHNvbWUgcG9pbnQgd2UgY2FuIGludHJv
ZHVjZSBpbiB0aGUgY29kZQ0KPj4+PiBhIHZpb2xhdGlvbiB0aGF0IHJlcXVpcmVzIHRoZSBzYW1l
IGp1c3RpZmljYXRpb24gcHJvdmlkZWQgYnkgdGhlIOKAnG9ycGhhbuKAnSBlbnRyeT8NCj4+Pj4g
SW4gdGhhdCBjYXNlIHdlIGNvdWxkIHJldXNlIHRoYXQgZW50cnkgd2l0aG91dCBjcmVhdGluZyBh
IG5ldyBvbmUgdGhhdCB3aWxsIG9ubHkgd2FzdGUgc3BhY2UuDQo+Pj4+IFdoYXQgaXMgdGhlIG9w
aW5pb24gb24gdGhpcz8NCj4+PiANCj4+PiBXZWxsLCB5ZXMsIHRoaXMgaXMgdGhlIG9uZSBjYXNl
IHRoYXQgSSwgdG9vLCB3YXMgd29uZGVyaW5nIGFib3V0LiBJdCdzIG5vdA0KPj4+IGNsZWFyIHRv
IG1lIHdoZXRoZXIgaXQgd291bGRuJ3QgYmUgYmV0dGVyIHRvIGFsbG9jYXRlIGEgZnJlc2ggSUQg
aW4gc3VjaCBhDQo+Pj4gY2FzZS4NCj4+IA0KPj4gRm9yIHRyYWNlYWJpbGl0eSBhbmQgcmVsZWFz
ZSBoYW5kbGluZyBJIHRoaW5rIGl0IGlzIGltcG9ydGFudCB0aGF0Og0KPj4gLSB3ZSBuZXZlciBy
ZXVzZSB0aGUgc2FtZSBJRCBpbiBhbnkgY2FzZQ0KPj4gLSB3ZSBrZWVwIElEcyBpbiB0aGUgZGF0
YWJhc2UgZXZlbiBpZiB0aGVyZSBpcyBubyBvY2N1cnJlbmNlIGluIHhlbiBjb2RlIGFzIHRoaXMg
d2lsbCBwcmV2ZW50IGFkZGluZyBhIG5ldyBJRCBpZiBhbiBleGlzdGluZyBvbmUgY2FuIGJlIHJl
dXNlZA0KPj4gDQo+PiBJbiBhIGNlcnRpZmljYXRpb24gY29udGV4dCwgd2hlbiBhIGp1c3RpZmlj
YXRpb24gaGFzIGJlZW4gdmFsaWRhdGVkIGFuZCBhZ3JlZWQgaXQgd2lsbCBtYWtlIGxpZmUgYSBs
b3QgZWFzaWVyIHRvIG5vdCBtb2RpZnkgaXQgYW5kIHJldXNlIGl0IGluIHRoZSBmdXR1cmUgaWYg
aXQgaXMgbmVlZGVkLg0KPj4gRnJvbSBvdXIgcG9pbnQgb2YgdmlldywgaGF2aW5nIGEgY2xlYXIg
YW5kIHNpbXBsZSB3YXkgb2YgaGFuZGxpbmcgdGhvc2Ugd2lsbCBtYWtlIGJhY2twb3J0cyBhIGxv
dCBlYXNpZXIuDQo+IA0KPiBJc24ndCB2YWxpZGF0aW9uIG9mIGEganVzdGlmaWNhdGlvbiBjb25u
ZWN0ZWQgdG8gdGhlIGFmZmVjdGVkIGNvZGU/IElmIHNvLA0KPiBldmVyeSBuZXcgaW5zdGFuY2Ug
d2lsbCBuZWVkIHZhbGlkYXRpb24sIHdoaWxlIGFuIG9ycGhhbiBlbnRyeSBpcyBlbnRpcmVseQ0K
PiBtZWFuaW5nbGVzcy4NCj4gDQo+Pj4+Pj4gQWZ0ZXIgdGhlIGFuYWx5c2lzLCB0aGUgc291cmNl
IGNvZGUgd2lsbCByZXR1cm4gYXMgdGhlIG9yaWdpbmFsICh3aXRoIHRoZSBTQUYtKiB0YWcpLg0K
Pj4+Pj4gDQo+Pj4+PiBXaGlsZSB5b3UgbWVudGlvbiBzb21ldGhpbmcgc2ltaWxhciBhbHNvIGFz
IHN0ZXAgMyBpbiB0aGUgb3JpZ2luYWwgZG9jdW1lbnQNCj4+Pj4+IG5lYXIgdGhlIHRvcCwgSSdt
IGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCB0aGlzICJyZXR1cm4gYXMgdGhlIG9yaWdp
bmFsIg0KPj4+Pj4gbWVhbnMuIElmIHlvdSB3YW50IHRvIHJ1biB0aGUgdG9vbCBvbiBhbiBhbHRl
cmVkIChjb21tZW50cyBtb2RpZmllZCkgc291cmNlDQo+Pj4+PiB0cmVlLCB3aGF0IEknZCBleHBl
Y3QgeW91IHRvIGRvIGlzIGNsb25lIHRoZSBzb3VyY2VzIGludG8gYSB0aHJvdy1hd2F5IHRyZWUs
DQo+Pj4+PiBtYXNzYWdlIHRoZSBjb21tZW50cywgcnVuIHRoZSB0b29sLCBhbmQgZGVsZXRlIHRo
ZSBtYXNzYWdlZCB0cmVlLg0KPj4+Pj4+Pj4gaWYgdGhlIG9iamVjdCBkb2Vzbid0IGhhdmUgYSBr
ZXktdmFsdWUsIHRoZW4gdGhlIGNvcnJlc3BvbmRpbmcgaW4tY29kZQ0KPj4+Pj4+Pj4gY29tbWVu
dCB3b24ndCBiZSB0cmFuc2xhdGVkLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gSWlyYyBhdCBsZWFzdCBD
b3Zlcml0eSBpZ25vcmVzIGNlcnRhaW4gaW5zdGFuY2VzIG9mIHdoYXQgaXQgbWlnaHQgY29uc2lk
ZXINCj4+Pj4+Pj4gdmlvbGF0aW9ucyAoZmFsbC10aHJvdWdoIGluIHN3aXRjaCgpIHN0YXRlbWVu
dHMgaW4gcGFydGljdWxhcikgaW4gY2FzZQ0KPj4+Pj4+PiBfYW55XyBjb21tZW50IGlzIHByZXNl
bnQuIFRoZXJlZm9yZSBtYXkgSSBzdWdnZXN0IHRoYXQgc3VjaCBjb21tZW50cyBiZQ0KPj4+Pj4+
PiBkZWxldGVkIChyZWFsbHk6IHJlcGxhY2VkIGJ5IGEgYmxhbmsgbGluZSwgdG8gbWFpbnRhaW4g
Y29ycmVjdCBsaW5lDQo+Pj4+Pj4+IG51bWJlcmluZykgaWYgdGhlcmUncyBubyBtYXRjaGluZyBr
ZXktdmFsdWUgcGFpcj8NCj4+Pj4+PiANCj4+Pj4+PiBZZXMgdGhlIGxpbmUgd29u4oCZdCBiZSBh
bHRlcmVkIGlmIHRoZXJlIGlzIG5vIG1hdGNoLiBUaGlzIHRvIGVuc3VyZSB0aGUgY29ycmVjdCBs
aW5lDQo+Pj4+Pj4gbnVtYmVyaW5nIGlzIG5vdCBhZmZlY3RlZC4NCj4+Pj4+IA0KPj4+Pj4gIndv
bid0IGJlIGFsdGVyZWQiIGlzIHRoZSBvcHBvc2l0ZSBvZiB3aGF0IEkndmUgYmVlbiBhc2tpbmcg
dG8gY29uc2lkZXI6DQo+Pj4+PiBPYnNlcnZpbmcgdGhhdCBjb21tZW50cyBfcmVnYXJkbGVzc18g
b2YgdGhlaXIgY29udGVudHMgbWF5IHNpbGVuY2UgZmluZGluZ3MsDQo+Pj4+PiB0aGUgc3VnZ2Vz
dGlvbiBpcyB0byByZW1vdmUgY29tbWVudHMgKGxlYXZpbmcgYSBibGFuayBsaW5lKSB3aGVuIHRo
ZXJlJ3Mgbm8NCj4+Pj4+IGVudHJ5IGZvciB0aGUgdGFyZ2V0ZWQgdG9vbCBpbiB0aGUgdGFibGUg
ZW50cnkuDQo+Pj4+IA0KPj4+PiBXaHk/IFRoZSB0YWcgY29tbWVudCB3b27igJl0IGRvIGFueXRo
aW5nLCBpdCB3b3VsZCBhY3QgYXMgYSBibGFuayBsaW5lIGZyb20gdGhlIGFuYWx5c2VyDQo+Pj4+
IHBlcnNwZWN0aXZlLg0KPj4+IA0KPj4+IFRoZSBfdGFnXyB3b24ndCBkbyBhbnl0aGluZywgYnV0
IGFzIHNhaWQgYW55IF9jb21tZW50XyBtYXkgaGF2ZSBhbiBlZmZlY3QuDQo+PiANCj4+IEkgYW0g
bm90IHN1cmUgSSBmb2xsb3cgdGhpcyBvbmUgYnV0IGluIGFueSBjYXNlIHdlIGNhbiBjaG9vc2Ug
dG8gYW55d2F5IHN1YnN0aXR1dGUgdGhlIHRhZyB3aXRoIHNvbWV0aGluZyBsaWtlIC8qIE5vdCBh
cHBsaWNhYmxlICovLg0KPiANCj4gVGhhdCdzIHN0aWxsIGEgY29tbWVudCwgd2hpY2ggaGVuY2Ug
bWF5IHN0aWxsIHNpbGVuY2UgYSB0b29sOg0KPiANCj4gICAgc3dpdGNoICggeCApDQo+ICAgIHsN
Cj4gICAgY2FzZSBhOg0KPiAgICAgICAgLi4uDQo+ICAgICAgICAvKiBTQUYtPE4+LXNhZmUgKi8N
Cj4gICAgY2FzZSBiOg0KPiAgICAgICAgLi4uDQo+ICAgICAgICBicmVhazsNCj4gICAgfQ0KPiAN
Cj4gaXMgbm8gZGlmZmVyZW50IGZyb20NCj4gDQo+ICAgIHN3aXRjaCAoIHggKQ0KPiAgICB7DQo+
ICAgIGNhc2UgYToNCj4gICAgICAgIC4uLg0KPiAgICAgICAgLyogZmFsbC10aHJvdWdoICovDQo+
ICAgIGNhc2UgYjoNCj4gICAgICAgIC4uLg0KPiAgICAgICAgYnJlYWs7DQo+ICAgIH0NCj4gDQo+
IG5vcg0KPiANCj4gICAgc3dpdGNoICggeCApDQo+ICAgIHsNCj4gICAgY2FzZSBhOg0KPiAgICAg
ICAgLi4uDQo+ICAgICAgICAvKiBOb3QgYXBwbGljYWJsZSAqLw0KPiAgICBjYXNlIGI6DQo+ICAg
ICAgICAuLi4NCj4gICAgICAgIGJyZWFrOw0KPiAgICB9DQo+IA0KPiBPbmx5DQo+IA0KPiAgICBz
d2l0Y2ggKCB4ICkNCj4gICAgew0KPiAgICBjYXNlIGE6DQo+ICAgICAgICAuLi4NCj4gDQo+ICAg
IGNhc2UgYjoNCj4gICAgICAgIC4uLg0KPiAgICAgICAgYnJlYWs7DQo+ICAgIH0NCj4gDQo+IHdp
bGwgbWFrZSBlLmcuIENvdmVyaXR5IGFjdHVhbGx5IHBvaW50IG91dCB0aGUgcG90ZW50aWFsbHkg
dW5pbnRlbmRlZA0KPiBmYWxsIHRocm91Z2ggKGJhc2VkIG9uIHBhc3Qgb2JzZXJ2YXRpb25zKS4g
V2hldGhlciB0aGF0IGJlaGF2aW9yIGlzDQo+IGZhbGwtdGhyb3VnaC1zcGVjaWZpYyBJIGRvbid0
IGtub3cuIElmIGl0IGluZGVlZCBpcywgdGhlbiBtYXliZSBteQ0KPiBjb25jZXJuIGlzIHZvaWQg
LSBpbiB0aGUgbG9uZyBydW4gSSB0aGluayB3ZSB3YW50IHRvIHVzZSB0aGUgcHNldWRvLQ0KPiBr
ZXl3b3JkIHRoZXJlIGluIGFsbCBjYXNlcyBhbnl3YXkuDQoNCmh0dHBzOi8vd3d3LnN5bm9wc3lz
LmNvbS9ibG9ncy9zb2Z0d2FyZS1zZWN1cml0eS9naW1tZS1hLWJyZWFrLw0KDQpOb3cgSSB1bmRl
cnN0YW5kIHdoYXQgeW91IG1lYW4sIHRoZSBmYWxsIHRocm91Z2ggaXMgdmVyeSBkaWZmaWN1bHQg
dG8gdW5kZXJzdGFuZCBmcm9tIHRoZSB0b29sIGJlY2F1c2UNCkl0IGNvdWxkIGJlIGEgc291cmNl
IG9mIGEgbG90IG9mIGZhbHNlIHBvc2l0aXZlLg0KDQpIZW5jZSBDb3Zlcml0eSBjYW1lIHVwIHdp
dGggdGhpcywgaG93ZXZlciBJIHJlYWxseSBkb3VidCBDb3Zlcml0eSBpcyBzaWxlbmNpbmcgdGhl
IGZpbmRpbmcgb24gX2FueV8gY29tbWVudCwNCnRoaW5rIGFib3V0IHRoaXMgZXhhbXBsZToNCg0K
c3dpdGNoICh4KQ0Kew0KY2FzZSBhOg0KICAgICA8c3RhdGVtZW50Pg0KICAgICAvKiBicmVhazsg
Ki8NCmNhc2UgMjoNCiAgICAgPHN0YXRlbWVudD4NCiAgICAgYnJlYWs7DQp9DQoNClRoaXMgaXMg
Y2xlYXJseSBhIGRldmVsb3BlciBtaXN0YWtlIGFuZCBzaG91bGQgbm90IHNpbGVuY2UgdGhlIGZp
bmRpbmc6IGZhbHNlLW5lZ2F0aXZlIGFyZSB3YXkgbW9yZSBoYXJtZnVsIHRoYW4NCmZhbHNlLXBv
c2l0aXZlIHRoYXQgYXJlIG1vc3RseSBhbm5veWluZy4NCg0KSW4gZmFjdCBJIHRoaW5rIENvdmVy
aXR5IGlzIGNoZWNraW5nIHRoZSBjb250ZW50IG9mIHRoZSBjb21tZW50IGxvb2tpbmcgZm9yIGZh
bGwtdGhyb3VnaC9mYWxsIHRocm91Z2gvZmFsbCB0aHJ1IFvigKZdDQoNCg0KDQo+IA0KPiBKYW4N
Cg0K

