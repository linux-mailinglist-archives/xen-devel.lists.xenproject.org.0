Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 638396206B2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 03:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439678.693712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osEI1-0005Gy-Tz; Tue, 08 Nov 2022 02:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439678.693712; Tue, 08 Nov 2022 02:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osEI1-0005EK-Qi; Tue, 08 Nov 2022 02:24:37 +0000
Received: by outflank-mailman (input) for mailman id 439678;
 Tue, 08 Nov 2022 02:24:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cq9g=3I=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1osEI0-0005EE-AA
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 02:24:36 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2052.outbound.protection.outlook.com [40.107.105.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c66d580-5f0c-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 03:24:35 +0100 (CET)
Received: from AS8PR04CA0191.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::16)
 by GV1PR08MB8153.eurprd08.prod.outlook.com (2603:10a6:150:93::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 02:24:32 +0000
Received: from AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::89) by AS8PR04CA0191.outlook.office365.com
 (2603:10a6:20b:2f3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Tue, 8 Nov 2022 02:24:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT026.mail.protection.outlook.com (100.127.140.154) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 02:24:32 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Tue, 08 Nov 2022 02:24:31 +0000
Received: from dfa80afe70ba.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D4E56138-F90D-4A23-81A1-594F84857D72.1; 
 Tue, 08 Nov 2022 02:24:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dfa80afe70ba.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Nov 2022 02:24:21 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VE1PR08MB5821.eurprd08.prod.outlook.com (2603:10a6:800:1b2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 02:24:19 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5813.011; Tue, 8 Nov 2022
 02:24:19 +0000
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
X-Inumbo-ID: 7c66d580-5f0c-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Klqr6KKGvOuUAavdq8HExJhL36/OX19jNhXPoanKGqDV+0BAaPME6khYNoMiNOFFIrqPxNiJ7uU4IkuFJfB1qkd5WPgtfWQAJTP8ZKDHZH716i4YCDrLxA8Ld6ORng7JCFop4M88U/dV0KPdC5fVKghk+OsgH3sG7pVlqjwcbb0Esn0tqwpN6vKkqneID6L+dmfv1/HaBwaBPM+Rrxm4RKumAlwFT2U6oitWOQ+nyPTMqG4TcYiArX5OpAVXT+5RcEDeVHRYTN5fbZkuwgsW3CaLoVyPhEEMq8PN/CaQxfwPalwbDeXJNqfz0d5h+USbn9a4nbaY34kfytW90l03cA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZICmTGVYE3R2Oh7eZQHC56GR45tyNfodhlp1AkrmuDs=;
 b=iTRX4CHiLDS9U7BlqVZeXVyFLEQN9J1mTO5rwCMstDV/J1vft6JhzZct91BdcQXlN3bqOiIEPcqkkqb7p1xjJf5FtB0BkPUTKLb9qsk3mSVUnSq//EErwtkFiW74FF+tDI86M2F5AGBMU7ydU24AqFs6r8F11j90QFiCs+7dZ9DDVb4tv4jnZKZEeJ1NVhTHxT0JvncCv6t3V7h7DXb78Xbqp38OriHn2K4aCFZoJm6VVG3qwGgmzbLjXls3vRmPpCOvi5wFq1euxEAk8uiSDfbrpJJH8zn0F29tMs+IR6aMxMfHKAwgHyD42zw+2imnUMuIIrchqlUshj4GrimRlg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZICmTGVYE3R2Oh7eZQHC56GR45tyNfodhlp1AkrmuDs=;
 b=zTLobEP6sVFaa+fSgVmD5e3Hx3ardTQ54ohyu994OBXXaSZ5WOB3bVJC8PL/GpkP4+GzAGbi7T6TIxn90jM8aS+Xfgqtn6+ZdvB0N9pvASiaPnF34NwOGPunPJlre8DviDRqkYMYa8etsEht7kIJ1laakBZVMZVhubfqytjAW1E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUcKlkucTl71J1HIxUa7TSW0sFbMyAToGuWV5aNUJ3oTHtXpiCJyYmPIGXwxCmJKkQIF6DZ+I/knmxU4O2UmpKsceaBHY0LTNvYHf61NLdXnH8YGAz4tN+boLX2b0WqAXS6vrWOCXwPcBECIR1QD1VE8irIcpU2COxyAO53ZrOmNV1qimoxkJW73Cm4qjiHIOtcgWbdty426fXbx+42Lc7VjNrTfoBMpL1ETXwi2AS2bnvbJgikhT88NG+G63yoVwYApRbWYhlMFfwPTzL1BfZ+O4vHPfrRKvGI5/aQzchY7xU3IomCn5DRR93rdjV63AFXbdAH2rd9mv8X6+RJfXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZICmTGVYE3R2Oh7eZQHC56GR45tyNfodhlp1AkrmuDs=;
 b=Ams14O1KBWqcmPX5XHoTdUXm05Dd/S5YRiFhXYuKOmZURvAvGru8agk9b+PHs1uXnUacgbvrMU7hqDsBt9lT8EXOuQ78tgAuLviY+qt1FknLlXNLoSAvAuI4W/K2qsf6C4aQUWwuPWAp883i9FqGZoNCDnKoJIGbM24t2me1TOWHwbIYE9g9idTFZOUPsWDiXbBUAwEOB22i4JjJz7UfowCnUc38gb845bh0M05JvoxH9jbNZFMQQl6CSJB8g+MlYVg6K13vFkejlK1xHYbe0UGTNpGk8pXwHxnpCE1GnLMWPAS72l7r2DsaoCteF86RxB4VWSuRS1JQ6jUBpLOgzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZICmTGVYE3R2Oh7eZQHC56GR45tyNfodhlp1AkrmuDs=;
 b=zTLobEP6sVFaa+fSgVmD5e3Hx3ardTQ54ohyu994OBXXaSZ5WOB3bVJC8PL/GpkP4+GzAGbi7T6TIxn90jM8aS+Xfgqtn6+ZdvB0N9pvASiaPnF34NwOGPunPJlre8DviDRqkYMYa8etsEht7kIJ1laakBZVMZVhubfqytjAW1E=
From: Wei Chen <Wei.Chen@arm.com>
To: Wei Chen <Wei.Chen@arm.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: RE: [PATCH v6 02/11] xen/arm: add iounmap after initrd has been
 loaded in domain_build
Thread-Topic: [PATCH v6 02/11] xen/arm: add iounmap after initrd has been
 loaded in domain_build
Thread-Index: AQHY8DVmEdLqaRCRCUuW0jNzr25ema4yQiqAgAIMi/CAAALrkA==
Date: Tue, 8 Nov 2022 02:24:18 +0000
Message-ID:
 <PAXPR08MB7420D0428E2317D70CA4F0D19E3F9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-3-wei.chen@arm.com>
 <a3b0c695-3e2f-7529-39c6-2e4c23ee9b78@xen.org>
 <PAXPR08MB742002FC135BED2CB4360BC79E3F9@PAXPR08MB7420.eurprd08.prod.outlook.com>
In-Reply-To:
 <PAXPR08MB742002FC135BED2CB4360BC79E3F9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B0852FDD17EE5E4CA0FDD3A8311E4C4E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|VE1PR08MB5821:EE_|AM7EUR03FT026:EE_|GV1PR08MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: b7ca3a50-2cb1-4d76-8b2e-08dac1305ee7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 O4HaEIiLQt7RY2DIhlvl7oQTyHzRHTcq4lWFTjDukKXj02Pm7esHk/VBZirsYCWNCxCgJ213EgS02EP1fwHjmVr2WyQ0bYwfzKFjwNY/ckWFVypw6GqLdzJ9TTy07hTILV6nK9dN7NHy+9iZP9MVmgEqWsTzKHh+gwp5plQj2BdJMRwXHjp7unpBrALCvc/6jREGGbFCgVlGDaf2yLpQeWrlGwZj7e2g0DMwVbiIaIJ1rIEyaVWg/btE4THNJFI7/9FFMna3yGTt/nPVB4UaXsayoE16T5i3Faxv81WY/411F5lMY+kydevN9hBFZ/yRwGQRikRjhBPt6sKYbcIgcK0p+sUYvoxgG/zv/a/Z5ioSfelujzgjfPLjUrgGx3wmU8ICzrqx6lzjI5p9yB8ofptsaKufnaLmgVwbjw+uDmt+uop8bDyE8yzB9KScam77YWx0Hlcwm0ZidBFyxj3n9pJsj9PNE769mDSX6w1aF4gL57Ayj+2la/bBfNI1SVwALXsRA2k3DFKp52EWn81hpaFDHMRh58tSLnjm1bNutXMoHnEKP+JoJVm/ELgNrF2kCM7AoDmXadOIuYxh+BEw7KjfGB5Up946PoMIpgLfwRY1a0DJc2LbkX+Dn/C31dnd75YZp0aAFPnBvkIgetqzLpxuVRJwz/vydZrWyzwjtkUVbhk3K186vB/dwjcxYH7C3PoushtIt0mVj0w6Zwpa6z3MEbubvVkGQIzc0AFrSvyQgQvrskGz//KoCjjAeWl14FjZE100lL6/EOAGGwviSA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199015)(52536014)(5660300002)(8936002)(122000001)(6506007)(7696005)(71200400001)(55016003)(64756008)(66476007)(76116006)(66946007)(66446008)(66556008)(4326008)(8676002)(38100700002)(54906003)(316002)(110136005)(33656002)(38070700005)(86362001)(41300700001)(9686003)(2906002)(186003)(26005)(478600001)(2940100002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5821
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8a706e75-5b2c-4c69-6c88-08dac1305701
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rDEoewk6niIfVfMFzlG2LCG0BMYTFlU5pktYUKebPvWjA3OSnyE9ghASPJBbw/nFwBGceI13IkYfIch/iEoicSfI4HeMMqkvuLU1BgdQqYLU+FYJDp5MwKDECqbm2TznRqmKh5XkCSjADqGAc+HfasxX0GGuLrHo3fiI1pCyN77qCfGnUFUD5QMM7ccfw3IlAPHFLi7i6LoBp1s5v9UR0coJ6SssD47XcF9Gw4QpCKTLb1RMYZON/Y5jFiRrlYWh1w3CLc6KfNlZ5i0NJ4f+du3+Z2z8DXzLKoNO1XR1/eFJxvsBOmmjYfxPrUguQIvJL3VLWZbC1afqluRvHy7GqdGrO+KHs7K9MDlsFK1a5/4YqdRRHp0BMIlN/eIUFhR02GEoX6g8fCBNZ6pREAg05UiYdHrxSbC+meJ2UczyPKVL8cJlDh7NqRDaJhbwMi4r6DkVpRlY/7+nflpgo/3MsSDxTO0MoaB4XnKrg9ucUS5r/+cpS4RN/uU3RsUpAU9/HScauLGAdX/Jk6UFhTGiv5UQSduRzvx2h1zhC2fOvyqjyIsHdyWO/+ijtagLjcaf34oHPxNsL1yZBveOkjmWUktSnS5xim+3EiXGcBNWU+g0SitJ3IOHTBxxvoFwzJbfz/K2dAaDctU0tfRThMXG5awFoB7Vggj79GXCGgKFH7LC2qjaGWJKOGPjIIMuJKDi1fdbDt/GqYxSvkbHAlXfr9Mv6nFy8YHcCv2YGNqGOvhY+/WLyE6IHIGshllYs2wnkcnQVll8S0Y3CXhaNSsUOw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(47076005)(336012)(26005)(186003)(9686003)(2940100002)(6506007)(36860700001)(7696005)(40460700003)(2906002)(55016003)(40480700001)(82310400005)(8676002)(8936002)(110136005)(54906003)(478600001)(5660300002)(52536014)(41300700001)(316002)(70586007)(70206006)(4326008)(33656002)(82740400003)(356005)(86362001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 02:24:32.0545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ca3a50-2cb1-4d76-8b2e-08dac1305ee7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8153

PiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4gPg0KPiA+ID4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYw0KPiA+ID4gaW5kZXggNGZiNWMyMGIxMy4uYmQzMGQzNzk4YyAxMDA2NDQNCj4g
PiA+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+ID4gKysrIGIveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4gPiBAQCAtMzQxOCw2ICszNDE4LDggQEAgc3RhdGlj
IHZvaWQgX19pbml0IGluaXRyZF9sb2FkKHN0cnVjdA0KPiBrZXJuZWxfaW5mbw0KPiA+ICpraW5m
bykNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5p
dHJkLCBsZW4pOw0KPiA+ID4gICAgICAgaWYgKCByZXMgIT0gMCApDQo+ID4gPiAgICAgICAgICAg
cGFuaWMoIlVuYWJsZSB0byBjb3B5IHRoZSBpbml0cmQgaW4gdGhlIGh3ZG9tIG1lbW9yeVxuIik7
DQo+ID4gPiArDQo+ID4gPiArICAgIGlvdW5tYXAoaW5pdHJkKTsNCj4gPg0KPiA+IFRoaXMgbG9v
a3MgZ29vZCB0byBtZS4gQnV0IEkgYW0gd29uZGVyaW5nIHdoZXRoZXIgdXNpbmcgaW9yZW1hcF93
YygpIGlzDQo+ID4gYWN0dWFsbHkgY29ycmVjdCBiZWNhdXNlIHdlIGFyZSByZWFkaW5nIHRoZSBy
ZWdpb24uIFNvIGl0IHNlZW1zIHN0cmFuZw0KPiA+IHRvIG1hcCBpdCB3aXRoIHdyaXRlLWNvbWJp
bmUuDQo+ID4NCj4gPiBTbyBJIHdvdWxkIGNvbnNpZGVyIHRvIHVzZSBpb3JlbWFwX2NhY2hlKCku
IFRoYXQgc2FpZCwgdGhpcyB3b3VsZCBiZSBhDQo+ID4gc2VwYXJhdGUgcGF0Y2guDQo+ID4NCj4g
DQo+IE9rLCB3ZSB3aWxsIHRyeSB0byB1c2UgaW9yZW1hcF9jYWNoZSBhbmQgdGVzdCBpdC4gSWYg
ZXZlcnl0aGluZyB3b3Jrcw0KPiB3ZWxsIHdlIHdpbGwgaW50cm9kdWNlIGEgc2VwYXJhdGUgcGF0
Y2ggaW4gbmV4dCB2ZXJzaW9uLg0KPiANCg0KT3IgaXMgaXQgYmV0dGVyIHRvIHNlbmQgYSBzZXBh
cmF0ZSBwYXRjaCBmb3IgdGhpcz8gQmVjYXVzZSBJIHRoaW5rIHdlDQptaWdodCBuZWVkIHNvbWV0
aGluZyB0byBhZGRyZXNzIHRoZSB2MSBjb21tZW50cy4NCg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0K
PiBDaGVlcnMsDQo+IFdlaSBDaGVuDQo+IA0KPiANCj4gPiBJIHRoaW5rIHRoaXMgd2FudHMgdG8g
YmUgaW4gNC4xNy4gVGhpcyB3aWxsIGF2b2lkIFhlbiB0byBoYXZlIHR3bw0KPiA+IG1hcHBpbmdz
IHdpdGggZGlmZmVyZW50IGNhY2hpbmcgYXR0cmlidXRlIChpbml0cmQgaXMgcGFydCBvZiB0aGUg
UkFNIGFuZA0KPiA+IHRoZXJlZm9yZSBkaXJlY3RtYXApLg0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+
DQo+ID4gLS0NCj4gPiBKdWxpZW4gR3JhbGwNCg0K

