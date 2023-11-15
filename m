Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B89077EC285
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 13:38:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633622.988643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3F9g-0005yU-7g; Wed, 15 Nov 2023 12:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633622.988643; Wed, 15 Nov 2023 12:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3F9g-0005w8-4C; Wed, 15 Nov 2023 12:38:04 +0000
Received: by outflank-mailman (input) for mailman id 633622;
 Wed, 15 Nov 2023 12:38:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lFI=G4=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r3F9e-0005vy-Vq
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 12:38:02 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2074.outbound.protection.outlook.com [40.107.13.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0bb0416-83b3-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 13:38:02 +0100 (CET)
Received: from AS9PR04CA0159.eurprd04.prod.outlook.com (2603:10a6:20b:530::20)
 by DB9PR08MB9634.eurprd08.prod.outlook.com (2603:10a6:10:461::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 12:37:30 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:20b:530:cafe::8) by AS9PR04CA0159.outlook.office365.com
 (2603:10a6:20b:530::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18 via Frontend
 Transport; Wed, 15 Nov 2023 12:37:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.20 via Frontend Transport; Wed, 15 Nov 2023 12:37:30 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Wed, 15 Nov 2023 12:37:29 +0000
Received: from eec2d66673c7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A4E7A13C-418F-43DD-864E-9AF2C81899FD.1; 
 Wed, 15 Nov 2023 12:37:23 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eec2d66673c7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Nov 2023 12:37:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9639.eurprd08.prod.outlook.com (2603:10a6:102:2e3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 12:37:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 12:37:18 +0000
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
X-Inumbo-ID: d0bb0416-83b3-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PBlH0GeYL4OaP1gG5xQwKQEcmFvt5dXs5zVGRGqwn3F3IDVknTTAjX6R6VKcuAZ5LrEE/etIPvQpjwH3vuvj7gfQnp1HZhV4xApOFxdqw29YO4bOMZ2TT48hxbx+tPF8359a8eRlgbQxa6p2ktjk9vdc7CFGE8fQQ8oE2+RB/01tGM/WZKGOOXRNPuF4GnI/JXwzTTklAe5ytROAu2ztSuO/345SQypnJOD61CzYUZ1OX71SN3IGtdxjaHhqtII2aea6501vV0dsC2y/L0RFrIcJki4anJxJK2UhpgmIrQxN8VC91LPFkj5EYyF4mY1XMP1g9cpkjN47spqbVTeq6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLJ2Cd9UGowk6lq28GE8OtWxdm5gAavHp2Yhyu7sM9s=;
 b=XZ/veO4HykUtbQBAIecU/djElvqTf2XkMmb31Jq4NxL/1/w1bOU44FLOwHoKbWsmQgA3xleH//N0CC5PlLpre5wvAXWtQmhrFB22ASE65NQ4m3yTRuE+yVWWr3DCYoOstxPm5NtwWKXcn6+nhAvH0Ajvj5TcwbvHzqYeEwdLkYJxZefOwdXbYMf3JB0e1Gh4I2cD0scq1AritgcsCfn1b3T2DFpI7tOYJVZwQ50WSn9LbFp98RG/yhRRXo3CAAfNkzpCefkuuxQxhgczv8M6j12McMrXMZnNsPjCQnaq9tKGc8TFJHRlyAjnSd/TzANP0SydgYKkntd+tPox+JrSiA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLJ2Cd9UGowk6lq28GE8OtWxdm5gAavHp2Yhyu7sM9s=;
 b=hL0huDQkx4YwPiz1NTqEy7cnx8RXZIeq7IKfho7KAdUC8BYdhWoQRKQbwE26c/6icWuduPcs6KjLtla9rG/L6uQ79Is10IZAJ0CtwIcFu5BKP//YAnU59V4E9DwoWSJ6ervPakHhRg4aSHL1mohH1V0D+hNPZWdUzvpc8nFeC8c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a1fe04f4f7722c9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3atXe9+5i81Pt1KN4oj9yfLHYnCOjla4tTZnIydyajWrSkWnZKusFCYoMMJkdZpjpfQadnyYXZ6pBKIP9Ph96CBK0g4txNJOifNYRpSJW9YAllf09JOcnSoUVkhta4MssKCfjmdlu6QDk3Awwwt+LHsMOZHGo8XJbDplPBxdgfKCe/IpFcW/A0Ve9jwiLrLt4ajsDXu+h7+Ss4/bG8aVNspaXzYQDJBMjS2D+zjDqHfRtdbpeeUPMrxCw6zP7sVX5slPvfULPT1onJNW4TS7vPROGT2tgu8L1GVJl9UoPX26cbarSAq4RUwx45dFVpW64dtYaE4Ezm8cPjq7AQm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLJ2Cd9UGowk6lq28GE8OtWxdm5gAavHp2Yhyu7sM9s=;
 b=I0kLD06OrzTfQIizjxg6cpSGoQleh3ztsE96yeEJ+S8x+hAxe62pHTZGmppXvta+GokMx/cTPk3a+fHy+0v0ClEcz72MEDSmCFZbeeyV+baOzqgh4zmEUsJnW1FJ0bw9+pcAB4dtwCHFueDjmjP5QPHVmElvngPZQ4wy+Qa6r/djM6r1Kpy35W35M6hlE/WAY8dCTFsDMccG6s5MfSievsThdgOzr3wucfvq1nNwweCN5/d8aGlhesKazMzrhRZO8/b341VE8W2iWk2ey8GDq0SWCxrU/8kXcuWlpfcmdJJkllrR9bcP4IdmvIh200kJ1lWOsn4vgGfhPfnY/3LheQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLJ2Cd9UGowk6lq28GE8OtWxdm5gAavHp2Yhyu7sM9s=;
 b=hL0huDQkx4YwPiz1NTqEy7cnx8RXZIeq7IKfho7KAdUC8BYdhWoQRKQbwE26c/6icWuduPcs6KjLtla9rG/L6uQ79Is10IZAJ0CtwIcFu5BKP//YAnU59V4E9DwoWSJ6ervPakHhRg4aSHL1mohH1V0D+hNPZWdUzvpc8nFeC8c=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.18] SUPPORT.md: Define support lifetime
Thread-Topic: [PATCH for-4.18] SUPPORT.md: Define support lifetime
Thread-Index: AQHaF72b8CvvI5/pmESXrW//HT9C3LB7Tp4AgAACUQCAAAB4AA==
Date: Wed, 15 Nov 2023 12:37:18 +0000
Message-ID: <0EE453CE-DC2C-4F69-874B-7D6F8130388F@arm.com>
References: <20231115121632.63868-1-julien@xen.org>
 <AA42890F-2B1D-4DCA-939B-4F7BCB073891@arm.com>
 <c010e6c5-f352-46da-bb23-cd668de6a0a8@xen.org>
In-Reply-To: <c010e6c5-f352-46da-bb23-cd668de6a0a8@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB9639:EE_|AMS0EPF000001B6:EE_|DB9PR08MB9634:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ddbcda0-8ad1-4355-3eeb-08dbe5d7a1fc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CX6JqetA9QFMx2clJiK4ccS5df49QClWJ3xut2gVMUelBegqHgRr8ys1rZ4u81swvX+sqk4ZJAVToMwtDSLLfauTE1M3ceCwqUp3W/y6iytNHfODg/m/vypkhnIhWo9wj6O3mSGDaIKPRS7s7Vsl5lhcKoFbNWWDoZol032M7lBOb8Y7bti7co4vBCFwtTzBS4cZk6cusFiBvmYoel7nyveyodDqYOn0f26c1XG6ZItPNq8E4udgPHdLiTPj5Fvl5FqRpzk99GawuG6wfPhzAmoNE9IhNTySpff9w8h0nQ3TDxDYKqvcrDeJp0cGIGPD1xVm50ncBZzgs+MiYUuZnJp7tfZnPOVm3QrxtAILyof/7eb70aGSuU7mE6Go1Wlg/ASd6sv+rWL6FBkYjuoxQxDnFzUn3A1SPFOzCalbkD5KRxJiuXAGSGWFY3M9sKgf65cOMpyl4uIjvdvGKPsYNTzpRwaJyWPV6DfLHEGdQZKfJ1m53OmKCG2gV3+wNRl3fKrcGNyrXBvxiNNgrYkqWadCHSJWDP5W7OujxQntyQKtyKqdzwf1lTeXY1hQ2gFuDmJMGTg8nx6Y6QmGQS4Y09QQlr8kfDdYyG5GjOKbN6opp/bItBeRyTB4iYsNTdnc2EE3q5kysoGW96iLUQzdVg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(33656002)(5660300002)(122000001)(38100700002)(41300700001)(86362001)(83380400001)(26005)(2616005)(71200400001)(6512007)(6506007)(4001150100001)(53546011)(6486002)(36756003)(478600001)(38070700009)(2906002)(64756008)(54906003)(66556008)(316002)(6916009)(8676002)(91956017)(8936002)(4326008)(66476007)(76116006)(66446008)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <40839EFE24478247934D383C90210021@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9639
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f5fd8a40-78c0-4b22-bf87-08dbe5d79b3c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iwHUSyIUEDdS1cE7tocgSomlCEIz+lK3/dPtrIRam6o/s4/fjHL0IBNEj5wIaAD4QxRXs+6giskoyJNrmvaZtVjGuz7maZDoQptgJxpWY3mGGd/gwNl4H8O8iVKL8Vi+1Lty37T5v2ieZpBBDiXQ0X8Bm9eeAy7wanWlVg+Dc2eHpwaETb2bJKnxHT4t+5DHcBl1cper6DRopsFyOctBoPqsqeV89F/Hauf+DmpwXRBhbDx1bHtFkSkKRkV2L15viupzbG3h9Am1nWN6Hz+VMpWmp+RGEOFwULkx43ek6idL1SRe3L9xIhEflQMOcTiqGtXo+ZWdyekz3TXcptVyVREeTLT/jG3rZltLFuQGRIMTmPkfEixJ311De5xLwctoCi12Hzc+mzR6SP0PHHHBVwksu8TDcf5lH4CnQVIqECqBm3QCoBYlCCexI4vpERafPZjMuH6cf8TL6e/CzYM+hi3JyHoFmFxDXMD4sBquexo/pNOVTYk5a3FIkj/iKBQa/R5hw5QLUhQtKBwxLQNgXZVnMNMvC8drwW7FYD+nDA7oUiVr74zo68TpgMKOG/1o9gIOP3oFrgHyrtVyX01iHrZIuBWdCaG/5rhe83f4b0YKshPr7cd3oHOhSLcdRcIEZRvOld3tfEsF9U5avMkcgJnUMimqdQ4SrTxE9iH15+S3M/6S881/qtpnGF0hoOs1nRpade/ON3dKUZCy9vQBp3x71M33dJG8Nbk/9DQI/jxKSnT6LImJJIByWMEwa/Eq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(1800799009)(64100799003)(82310400011)(186009)(451199024)(36840700001)(46966006)(40470700004)(33656002)(8676002)(4326008)(6862004)(40480700001)(41300700001)(4001150100001)(54906003)(8936002)(2906002)(40460700003)(6486002)(336012)(83380400001)(36756003)(316002)(82740400003)(70206006)(86362001)(36860700001)(5660300002)(53546011)(478600001)(6506007)(47076005)(356005)(70586007)(6512007)(2616005)(26005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 12:37:30.0980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddbcda0-8ad1-4355-3eeb-08dbe5d7a1fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9634

SGkgSnVsaWVuLA0KDQo+IE9uIE5vdiAxNSwgMjAyMywgYXQgMjA6MzUsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBPbiAxNS8xMS8y
MDIzIDEyOjI3LCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4+IE9uIE5vdiAxNSwgMjAyMywgYXQgMjA6
MTYsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IEZyb206
IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+Pj4gDQo+Pj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4+PiAtLS0NCj4+PiBTVVBQT1JU
Lm1kIHwgOCArKysrLS0tLQ0KPj4+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL1NVUFBPUlQubWQgYi9TVVBQT1JU
Lm1kDQo+Pj4gaW5kZXggZmZmNGI0YzViYWQ2Li5jNDUyNjM1ZWI1NTIgMTAwNjQ0DQo+Pj4gLS0t
IGEvU1VQUE9SVC5tZA0KPj4+ICsrKyBiL1NVUFBPUlQubWQNCj4+PiBAQCAtOSwxMCArOSwxMCBA
QCBmb3IgdGhlIGRlZmluaXRpb25zIG9mIHRoZSBzdXBwb3J0IHN0YXR1cyBsZXZlbHMgZXRjLg0K
Pj4+IA0KPj4+ICMgUmVsZWFzZSBTdXBwb3J0DQo+Pj4gDQo+Pj4gLSAgICBYZW4tVmVyc2lvbjog
NC4xOC1yYw0KPj4+IC0gICAgSW5pdGlhbC1SZWxlYXNlOiBuL2ENCj4+PiAtICAgIFN1cHBvcnRl
ZC1VbnRpbDogVEJEDQo+Pj4gLSAgICBTZWN1cml0eS1TdXBwb3J0LVVudGlsOiBVbnJlbGVhc2Vk
IC0gbm90IHlldCBzZWN1cml0eS1zdXBwb3J0ZWQNCj4+PiArICAgIFhlbi1WZXJzaW9uOiA0LjE4
DQo+Pj4gKyAgICBJbml0aWFsLVJlbGVhc2U6IDIwMjMtMTEtMTYNCj4+PiArICAgIFN1cHBvcnRl
ZC1VbnRpbDogMjAyNS0wNS0xNg0KPj4+ICsgICAgU2VjdXJpdHktU3VwcG9ydC1VbnRpbDogMjAy
NS0xMS0xNg0KPj4gSSB0aG91Z2h0IHdlIGhhdmUgYSAzIHllYXJz4oCZIHN1cHBvcnQgbGlmZXRp
bWUsIHNvIG1heWJlIGl0IHNob3VsZCBiZSAyMDI2LTExLTE2LCBidXQgbm90IHN1cmUNCj4+IGlm
IGl0IGlzIHN0aWxsIHRoZSBjYXNlLg0KPiANCj4gSG1tbS4uLiBZb3UgYXJlIHJpZ2h0IGZvciB0
aGUgc2VjdXJpdHkgc3VwcG9ydC4gSSBkaWRuJ3QgZG8gdGhlIG1hdGggcHJvcGVybHkuDQo+IA0K
PiBTbyBpdCBzaG91bGQgYmUgMjAyNi0xMS0xNi4gSSBjYW4gYWRqdXN0IG9uIGNvbW1pdC4NCg0K
VGhhbmtzLCBhZGp1c3Rpbmcgb24gY29tbWl0IHNvdW5kcyBnb29kLg0KDQo+IEkgdGhpbmsgdGhl
IG90aGVyIGRhdGUgc2hvdWxkIGJlIGNvcnJlY3QuDQoNClllcyBpdCBpcyBjb3JyZWN0Lg0KDQo+
IEZvciByZWZlcmVuY2UgdGhpcyBpcyB3aGF0IHdlIGhhdmUgZm9yIDQuMTc6DQo+IA0KPiArICAg
IEluaXRpYWwtUmVsZWFzZTogMjAyMi0xMi0xMg0KPiArICAgIFN1cHBvcnRlZC1VbnRpbDogMjAy
NC0wNi0xMg0KPiArICAgIFNlY3VyaXR5LVN1cHBvcnQtVW50aWw6IDIwMjUtMTItMTINCg0KS2lu
ZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

