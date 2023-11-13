Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35527E9FF9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631724.985364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Ys8-0006Fb-4z; Mon, 13 Nov 2023 15:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631724.985364; Mon, 13 Nov 2023 15:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Ys8-0006D9-1y; Mon, 13 Nov 2023 15:29:08 +0000
Received: by outflank-mailman (input) for mailman id 631724;
 Mon, 13 Nov 2023 15:29:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUjx=G2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r2Ys6-0006D3-Et
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:29:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2082.outbound.protection.outlook.com [40.107.7.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6168cb87-8239-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 16:29:05 +0100 (CET)
Received: from AS9PR06CA0244.eurprd06.prod.outlook.com (2603:10a6:20b:45f::35)
 by AS8PR08MB6199.eurprd08.prod.outlook.com (2603:10a6:20b:296::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 15:28:34 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:20b:45f:cafe::a4) by AS9PR06CA0244.outlook.office365.com
 (2603:10a6:20b:45f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29 via Frontend
 Transport; Mon, 13 Nov 2023 15:28:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.14 via Frontend Transport; Mon, 13 Nov 2023 15:28:34 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Mon, 13 Nov 2023 15:28:34 +0000
Received: from 4e82c1590d56.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BCB77F74-0073-468B-9CE4-D02CFF481894.1; 
 Mon, 13 Nov 2023 15:28:27 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4e82c1590d56.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 13 Nov 2023 15:28:27 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by AM8PR08MB6435.eurprd08.prod.outlook.com (2603:10a6:20b:317::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 15:28:26 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e%3]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 15:28:26 +0000
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
X-Inumbo-ID: 6168cb87-8239-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=b+vPHVLv9DgaDIpsV4G/GvndoObaR+YaTA9XmT36br/3/x07aKBU1cb9qvcNz/XM7oB6S0+gJ0hYTMUnUbJjSM7lmyKuYE1i3D3n0NPB1n6OaXgB0dsbW0PmmAYhXxiTpzeBgm/cVLNUAGpAH0HmBa/Z8zXjf2SZa0ihZYszXWOT2oKPUtRcj9YB+9vyzXeFEXvfTVsn8RVV9wsUMyG8YaHIg10gwIpOO/VZChHsGvKy4UZIy8qhGQ7BR/KQBspPN4k+rD1J9Fv23Ykz6LOZX2oprkyFn71m43CkRsb6quqeu4ChjqUKjUtub4XSUdHnzZroEmGz0wUsDfCHdGGXtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIdcjh8GTqbof6QVLq/iuNdGDsY94HJxNcCXRGGW+rI=;
 b=SRQnRsiBNPR2LLhCQv0btZGzk+ATjvAXuQvEcAYlkAO1Li/LFQz3LL47FVMrnHfEYbDw56GVSuV1lCSz3Ziqp9qkNUkvEH40Sobi8pxd1PiUZlw8k+OEa0PKQZe1fqQD/JH/9LwbSknXai54GEWJ8uOL5buh0O+HDGEnJ8mtlRTIVAjkr2903SdwHM/aGvOoX9S4SIPWv0QZeLNZk95SvwJqtnjrfJk1+Fa6mrUyeI4nAUacnkQbocmIaSiS4ojEpnuEauA5ueCCbnpQxaTWD5Z2dBEoBo4JrtSgaY1gywYUW/FOfhauz/TDJbhpdwD46wOxkWJL1D2zhoendWgvcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIdcjh8GTqbof6QVLq/iuNdGDsY94HJxNcCXRGGW+rI=;
 b=EDcZC02Sk5+J+gOo8d/37kdFzjwb8WV4D2IoN4VIw99vjJacwSPhFmlKqJtC+oS4qwvqd9DLw4AbqJIVO5v52FPcetSfQmcsDbryiD8pjeRqPRTRV0mdATx7G60sn6A2Li+Tej0LpKDb/Uc/sflVOCcEWh4sRyjBrNHDMZAAchE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c2f9a57c965a9b76
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkzESVq4edIQDXqtAS/A8R5qK5NixCsQMi0v6MDFO0OlGlSyFw63DZH+U0q/Ml+7WGzNcOt73CB3YOAycjY2OKPa4/rv1ucO6cpmmq17nSCts3Pf0DMjawSOdrZxUVexEv8oejflP6pBwfYmQmTeBQ1ZKGPNePiDEK8hwjnr6batrC3tN+1TMEtO17WZCoAt7b6ukcVV5oae0dCYMi92jpJFqk834Vk97nECUFPA1n6DkwZIc2ecDza8Lbfh6tIslTEGQc2oJ5TSnH/bnC4fmjNhYHkKTMYzDbC3Tqo4z228YgzjPOWD2z6ND2ncP/OUjF6KvapsjbK6ITgIXju8aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIdcjh8GTqbof6QVLq/iuNdGDsY94HJxNcCXRGGW+rI=;
 b=AAvcMxmZI8fltbhfw5km4WHAZ7+ynhzyFzyX5In0/OJHJn7gbwhhZZU/mYUySmDnNPTIyR11CG+gFelmyWcRSzK1eFia18C81fdQu12SiYkx2+BmIOIgmzm/gDABKoaAuPY6arpPctDcybQQIyQhJ1cEhLn8TgojvLAUp1+ZuVnQhhDOLaAFojmhW5+gni7T3JQYK6nZS9W9c1RxW/NvwywFXJD1+SJnbMcfHzW0j+BBYWqXqRHncExOWE1SqRapI2KMIJ1P6PyFJa6VlFd0ZbomhBUCVddLRAgI9Bz+iu9bYnn4zMnYqHm3Wy1N+IWu28FDMVDRW6UMDds5EUe7Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIdcjh8GTqbof6QVLq/iuNdGDsY94HJxNcCXRGGW+rI=;
 b=EDcZC02Sk5+J+gOo8d/37kdFzjwb8WV4D2IoN4VIw99vjJacwSPhFmlKqJtC+oS4qwvqd9DLw4AbqJIVO5v52FPcetSfQmcsDbryiD8pjeRqPRTRV0mdATx7G60sn6A2Li+Tej0LpKDb/Uc/sflVOCcEWh4sRyjBrNHDMZAAchE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: George Dunlap <george.dunlap@cloud.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <Michal.Orzel@amd.com>, Wei
 Liu <wl@xen.org>
Subject: Re: Clang-format configuration discussion - pt 1
Thread-Topic: Clang-format configuration discussion - pt 1
Thread-Index: AQHaEild8psuTSSrb0SmQq+9AXKRR7B4Sv6AgAAcuYA=
Date: Mon, 13 Nov 2023 15:28:26 +0000
Message-ID: <809BE359-C54A-450D-8F61-935E1C106981@arm.com>
References: <174FCBBC-3C2F-47E9-936A-F1399DD9AFFB@arm.com>
 <CA+zSX=Z2O-EoP5AL-vEgeJgf11YGi4fweSy+XFWOAc5TEEJ9dA@mail.gmail.com>
In-Reply-To:
 <CA+zSX=Z2O-EoP5AL-vEgeJgf11YGi4fweSy+XFWOAc5TEEJ9dA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|AM8PR08MB6435:EE_|AMS0EPF000001A8:EE_|AS8PR08MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: b828910c-604e-4363-1166-08dbe45d334c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Tv3SSAE+Iwae+6hrc0cDVDuPf/3NbNwBru90MSM1Yx+Lkwmb7O+6leyn5trjEiJ6XJItGRrgUbvfb2Dq2YpU2vlCVGrQFsJSv17mdaTsqQyEflUutHe+krhz+zMJQo1QsOpn7JoiBdS75dFqhn+aN2iXwgJGhRh69y2T+/lnpaDScZhcuebFEzmMWV1WaEjPken4n5T1H5Rv/UsENqN0DDc3YHi/e57OYRSBmhigcCXw2fdC+hlcoza3FrBTCIteDODLNvu8ZG0dR97mWdl78DQ1NPpH8J8Gsi/YCZ40Rr72veR6XouxuDza4i/xmATqyPUPEubnfRekuUCeEOVnfosfcwnr3UE0SMz98O1VtomBYCqgKHxaMo0MKo+cCTv3/GTyuovyfG1QO9xLYeeLRxnvWsTMF2xebz0ppm3bt4qyU0pOebSg8+WlmQNOCsSINqEgsFnnBbhzHrmOTIBUEjbz6D0wI9ZfTS5xwdq3NWbGmU9AYSGNVrT77FI0Mcf7f6ZeEhX6CJVIjFgA+od9VxmhGtd095aCZoinfkt6sx04LTeOlOwjfLMbBDIAQerBGJk9Cw++HIM9MQX+gxJ1jN069ddnJRwJo+f4ylZ79BSvAL3WtWnphZFKawOo8C3+fwl5l3Lxu+IRwSS9IULLBQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(91956017)(316002)(76116006)(54906003)(64756008)(66446008)(66946007)(66556008)(66476007)(6916009)(478600001)(6486002)(71200400001)(86362001)(5660300002)(38070700009)(41300700001)(33656002)(36756003)(2906002)(4326008)(8676002)(8936002)(2616005)(38100700002)(122000001)(26005)(6506007)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDF07A5C43007448BC5D06637F5FDCB8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6435
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ac70d9c6-ca1d-4f9f-7f25-08dbe45d2e3d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1K5fO2PA+XqwRUwu8R/T0JnHNQp+OLPHOXuQYJBuksY/RmsmXhsnDX3JEovHRtiz4/5T70Nj3z5MARdLI0MFZEAa5HJVMbL2se/YgkPkS9iCNRJBCh44+ulda289SJ9GdVouOXcAhKXmaNLsZWliM5ft8GZI6qlkfkVyDIfyKeCf9FdmFcmxb2gjtsQ2CmVQ9dpxwUVSoPY6vG5kc71jNdBrfAakXs2NBO27SYvCMAjiCR4YN8ZpTxSbyQ6BTTCYgP0Cf7kBcCBORuPcPpr0xH0jPb9ruoBzQakwFSyWRGmJpTIitgNsg+fvQ3QnvnabIKpKt4wzI3P+pt4s4vRByVKis7FbQVcBkAUdtGNA9wXUmyP5H754A18stxnNQh0pw8F839Bi5d8fdsr0j4wcOIfczEmMwyi8VUU62hSQM/wDvWRRS3lYEaVFXC3gc7abRB24Lxz5UrYeE0TiAovdAuHguigWbw3UBUgO5jv/RYx7nbgOdGPx3+YQn7TQ6RloG8I8R0g1XKPWye32bmwk5UI7tFWZ2ygqHVFsnSnXiHZbvFmyna0G/W6bnrFTZ0PPiOd9i1X5e5Xa1mqi1sB5mAfbSLCbYhfMqBJi2S5k+04tALeGU6Eo7HGMTn4XoxmQvcDp0ZtYOgv1ALbj7cUP13sY0vf6hIJBxfTrfa0sQnFUPW3V4BsYjhy2oPZYIkWjnMZJdMRWC0q11yaJMbc48grBcpZfXTLRk2QwODLb+vub3K0VsOIh4drzUuLpCQ29
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(396003)(136003)(230922051799003)(186009)(1800799009)(82310400011)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(2906002)(5660300002)(40460700003)(41300700001)(81166007)(356005)(33656002)(36756003)(6506007)(82740400003)(86362001)(2616005)(336012)(478600001)(26005)(6512007)(47076005)(6486002)(36860700001)(6862004)(4326008)(8676002)(8936002)(54906003)(316002)(70586007)(70206006)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 15:28:34.6303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b828910c-604e-4363-1166-08dbe45d334c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6199

SGkgR2VvcmdlLA0KDQpUaGFua3MgYSBsb3QgZm9yIHRha2luZyB0aGUgdGltZSB0byBoYXZlIGEg
bG9vayBvbiB0aGF0Lg0KDQo+IA0KPiBMdWNhLA0KPiANCj4gVGhhbmsgeW91IHNvIG11Y2ggZm9y
IHRoZSB3b3JrIHRoYXQgeW91J3ZlIGRvbmUgaGVyZS4NCj4gDQo+IFRoZSBhcHByb2FjaCBpbiB5
b3VyIHYyIHNlcmllcyBsb29rcyBwbGF1c2libGUsIGFzIGRvZXMgYSBicmllZg0KPiBvdmVydmll
dyBvZiB0aGUgaXRlbXMgaW4gdGhpcyBsaXN0Lg0KPiANCj4gT25lIHByb2JsZW0gSSBoYXZlIGlz
IGhvdyB0byByZWFsbHkgZXZhbHVhdGUgdGhlIHByb3Bvc2VkIGNoYW5nZXMuICBJDQo+IHNwZW50
IGEgZmV3IG1pbnV0ZXMgc2tpbW1pbmcgdGhyb3VnaCB0aGUgIm1lZ2FkaWZmIiBbMV0gb3V0cHV0
IGZyb20NCj4gdGhlIHYyIHNlcmllcywgYW5kIHdoaWxlIGV2ZXJ5dGhpbmcgbG9va2VkIGZpbmUs
IHRoYXQgaXMgYSBIVUdFIHBhdGNoDQo+IHRvIHNraW0gdGhyb3VnaC4gIEkgZG9uJ3QgcmVhbGx5
IGhhdmUgYW55IHdheSB0byBrbm93IGlmIHRoZXJlJ3Mgc29tZQ0KPiBydWxlIGludHJvZHVjZWQg
dGhhdCBJIGRvbid0IHJlYWxseSBhZ3JlZSB3aXRoLg0KPiANCj4gT24gdGhlIG90aGVyIGhhbmQs
IEkgd2FudCB0byBhdm9pZCBidXN5IG1ha2Utd29yayBhbmQgdGhlIGludml0YXRpb24NCj4gdG8g
aW50ZXJtaW5hYmxlIGJpa2Utc2hlZGRpbmcgZGlzY3Vzc2lvbnMuDQo+IA0KPiBJcyBpdCBwb3Nz
aWJsZSwgZm9yIGluc3RhbmNlLCB0byBzdGFydCB3aXRoIGEgZGlmZiB3aGljaCB3aWxsIGVuZm9y
Y2UNCj4gKmp1c3QgdGhlc2Ugc2V0dGluZ3MqIChjb2x1bW4gd2lkdGgsIGluZGVudGF0aW9uLCBh
bmQgc28gb24pPyAgQW5kDQo+IHRoZW4gYWRkIG9uIG5ldyBjb2Rpbmcgc3R5bGUgY2hhbmdlcyBv
bmUgKG9yIGEgZmV3KSBhdCBhIHRpbWUsIGluIGENCj4gd2F5IHRoYXQgd291bGQgbWFrZSBpdCBl
YXNpZXIgdG8gdW5kZXJzdGFuZCB3aGF0IGVmZmVjdCBlYWNoIGNoYW5nZSBpcw0KPiBoYXZpbmc/
ICBJZiBzbywgZG8geW91IHRoaW5rIHRoYXQncyBhIHJlYXNvbmFibGUgYXBwcm9hY2g/DQo+IA0K
PiBJZiBub3QsIGhvdyBkbyB5b3UgcHJvcG9zZSB0byBwcm9jZWVkPw0KDQpZZXMgdGhleSBhcmUg
YSBsb3Qgb2YgbW9kaWZpY2F0aW9ucywgdGhlIGlzc3VlIGlzIHRoYXQgd2hlbiB3ZSBkb27igJl0
IHNwZWNpZnkNCmEgY29uZmlndXJhYmxlLCB0aGUgZGVmYXVsdCBvcHRpb24gd2lsbCB0YWtlIHBs
YWNlLCBzbyBpdOKAmXMgbm90IHJlYWxseSBmZWFzaWJsZQ0KdG8gcHJvZHVjZSBhbiBvdXRwdXQg
d2hlcmUgb25seSB0aGUgc3BlY2lmaWVkIGNvbmZpZ3VyYWJsZSB3aWxsIGFmZmVjdCB0aGUNCmZv
cm1hdC4NCg0KVGhlIGVhc2llc3QsIGJ1dCBkaWZmaWN1bHQgYXQgdGhlIHNhbWUgdGltZSwgd2F5
IEkgdGhvdWdodCB3ZSBjYW4gcHJvY2VlZCBpcw0KZGlzY3Vzc2luZyBhIHNldCBvZiBydWxlIGF0
IHRoZSB0aW1lIHdoZXJlIHdlIGFsbCAod2VsbCB0aGUgbWFpbnRhaW5lcnMpIGFncmVlDQppbiBw
cmluY2lwbGUsIHNvIHRoYXQgd2UgYXBwbHkgdGhlbSB0byB0aGUgY29kZWJhc2UgdW50aWwgdGhl
IGxpc3QgaXMgY29tcGxldGVkDQphbmQgYWxzbyBDT0RJTkdfU1RZTEUgY2FuIHJlZmxlY3QgdGhl
bS4NCg0KQW55d2F5IGlmIHNvbWVvbmUgY2FtZSB1cCB3aXRoIGEgYmV0dGVyIGlkZWEsIEnigJlt
IG9wZW4gdG8gc3VnZ2VzdGlvbnMuDQoNCkNoZWVycywNCkx1Y2ENCg0KDQo=

