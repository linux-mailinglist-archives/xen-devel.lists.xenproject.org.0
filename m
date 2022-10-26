Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AB560D90D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 04:04:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430310.681850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onVlo-0000PV-NQ; Wed, 26 Oct 2022 02:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430310.681850; Wed, 26 Oct 2022 02:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onVlo-0000NU-KH; Wed, 26 Oct 2022 02:03:52 +0000
Received: by outflank-mailman (input) for mailman id 430310;
 Wed, 26 Oct 2022 02:03:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NsSF=23=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1onVln-0000NO-Oo
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 02:03:51 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20068.outbound.protection.outlook.com [40.107.2.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f0d8790-54d2-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 04:03:50 +0200 (CEST)
Received: from FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::21)
 by AS8PR08MB9094.eurprd08.prod.outlook.com (2603:10a6:20b:5b0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 02:03:47 +0000
Received: from VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::3b) by FR0P281CA0016.outlook.office365.com
 (2603:10a6:d10:15::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.13 via Frontend
 Transport; Wed, 26 Oct 2022 02:03:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT065.mail.protection.outlook.com (100.127.144.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Wed, 26 Oct 2022 02:03:46 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Wed, 26 Oct 2022 02:03:46 +0000
Received: from 051c43c4fcdb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5348FD87-D148-43B4-A7B1-95C9B3AD10CA.1; 
 Wed, 26 Oct 2022 02:03:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 051c43c4fcdb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Oct 2022 02:03:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB6273.eurprd08.prod.outlook.com (2603:10a6:20b:2d7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27; Wed, 26 Oct
 2022 02:03:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5746.026; Wed, 26 Oct 2022
 02:03:32 +0000
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
X-Inumbo-ID: 6f0d8790-54d2-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=S7VS46O6QQfp+f/6Rphz+LDQWN82IKNQFZnXBLZazX3HGDLCvv6Ld1VuZRX3oNqijHZThqCz0mfpN8hCMeU4h1C2eiXbW1D90sJfc0TWRTewFTUBS+99pMNS4wUJ0xdeDThsb4VtY40vdiDvlCy4QjQcujqehsPdW/gdVQ8lHiIID4MVrjPEf90PdMTpB2WtjrIJ6DIadpE/qXqC6Dpil1M61htIq2qmPh5LcWjhuR9yS7H/ggEfFH0exXGo7L7rVUfnr0en4iZgy61tPnZnlYfE1D63oItIp4E2UYzldpTUBXHKzdSV7fiok5w0QxZYuFNKGTI2h46DrP+o49yi2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+z2dHxmsY1Lp//3Um1aszd+MDEWQGZ0kuBI78SFfUjg=;
 b=F6zo/8g1z7Y4dMZ9sOP9jHmN2NlT0obOOT+fMEAGL3DFyzEcIxLijKtQWDH4iA8J3hUEWjgQ+wSIJkM9H7KnxyVlJzfa9rhTKCTUN5V8bO6+26GK6FTXKiQ31BvxThEXjXjdB4BOQpjEiu5DhvCxdJaMAMm2MslZXyX+OX/D9MzS4wMIx3Quoo1r7jDHia8iA6y6IJpqcdcr9NhQY6X3GcNxbDFx7D/F/wlK69WujPSKf8Y4+kTE1EGYhX+yGgsO7/20SlahPFEnJwM9LJs2Hbg57mftLiUT9OJ2y6ZiggdhgMqdQNrm5z8C+XW/NosqPX5ybiXui5H9JA/0RI8kzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+z2dHxmsY1Lp//3Um1aszd+MDEWQGZ0kuBI78SFfUjg=;
 b=0yS+QXWG6k5mHSfF2xXg7JaX2VCocQ8jV9y98V0S33Gf5f2TPNVsb/g3qiNGJkghk2dvYvBcFQeQgkQsTFdaQs1KOoOZUT/coW0g3b9U96K9iwH1//pXSjvQWEQNZS8RrSO/l98eLu4Nu9T3eSEWTWexLmfRVQL4DdbEUub5vlM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hg08SOC0AMOhn5Qz1LMe+qAz8DjqD3Sft1JX0kMOoKkwV/J8YS3peEswQpJ1fh0FE8OHuMx+cpkr4Yc8VgEuWni1px+/YuYlb1TQo0+IFD3Dd1v3ys+vNAx3kF5USsx2RxLT82bS2nvibejZe54JS+3EYpF4CPuaGo8lWFQQ75S+aycAa3DaPihPAt8IVlTRKxOclbLOwvvDcikxChcZc4JdCXbYcWmaV3HNdRQsMRdBbez0fvgwj9XMDultOOLdEl4kpUY6Pluq5vlSqEu44BIYKKTc56mlgj/U0fqT+45d6MM+yhimHykyUG9UmIm74J1XgqQanTuosSXG0XSxIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+z2dHxmsY1Lp//3Um1aszd+MDEWQGZ0kuBI78SFfUjg=;
 b=AuiVjD4E52dSv0h8oJrDrLBFCxyOA7nA7wT7jJjTwrgQ9GSNVRRfYAAKhUlVMhLnPlt1qTRfiTrWaXnRkXWjZbcXB49Z5HYlysT1fMmnBu2jdzP30QVQet2SSwNQJixR3qgABRLdPIEFHVuZ4rH0WVOKbxFGKdcSBmVgKxwSV3G+ShnNegn2zh9oxmqJp5iPW+i6kt5z8VZgqAtPQrflLZq4S7eMatE0AcyVAPsXaXyxToZHbsdY0QrEKTwan6l2TOUB5XuaIAD69kGaPf7RHZyHl6xfcDBP5Ogfk06uMmFiRfvdnwbx5wMorFjS1JpsXHmBfpwlSCtS+u6onVbgFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+z2dHxmsY1Lp//3Um1aszd+MDEWQGZ0kuBI78SFfUjg=;
 b=0yS+QXWG6k5mHSfF2xXg7JaX2VCocQ8jV9y98V0S33Gf5f2TPNVsb/g3qiNGJkghk2dvYvBcFQeQgkQsTFdaQs1KOoOZUT/coW0g3b9U96K9iwH1//pXSjvQWEQNZS8RrSO/l98eLu4Nu9T3eSEWTWexLmfRVQL4DdbEUub5vlM=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [4.17?] Re: [PATCH] common: map_vcpu_info() wants to unshare the
 underlying page
Thread-Topic: [4.17?] Re: [PATCH] common: map_vcpu_info() wants to unshare the
 underlying page
Thread-Index: AQHY3U5WyIj+k3kfXES3Q5PgZ4e+DK4fVjIAgAAG1YCAAKWEIA==
Date: Wed, 26 Oct 2022 02:03:32 +0000
Message-ID:
 <AS8PR08MB7991C7034FE22A68AE77A39A92309@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <b2382fad-e328-fb03-2860-cca93625f4bb@suse.com>
 <Y1gD7GmclguLZCM8@Air-de-Roger>
 <b9c190ee-f916-b03d-e56f-0a54d93ba948@suse.com>
In-Reply-To: <b9c190ee-f916-b03d-e56f-0a54d93ba948@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8AB12A33C9DCAC4B86B156B3E36D9BEA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB6273:EE_|VI1EUR03FT065:EE_|AS8PR08MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: bdce586c-ef5f-4b98-b9f9-08dab6f65157
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BEJyadq+uW+GJwNSc25N1lQ5ajAnQ3SqJZ9IgnRJLYJoyJIFhPWb5SFLqcP78az1Tu1s1DNPnaS/FBtkMCRSVT5GxLnsrtEH9OZy88ujiK8SNAK7lc/b0CrOYzan84R6DBjhGccDZr3jK00Cjl7bUhFqPAezwXoq2byTJY9qA6CB4t4BZKJFkuNcxTThywNSmmF75H3icl3AZ2Up1dmBkD5gtCcUKuh3+M/O6eoupqqWr+rdJBDwL/abErmn9hn7KfABdvtblRnS3BPoIIUvXZL14FqzUvEAw5VVXEkOyr8UslkP0TusjbbitmtQHmxNoT48L822q1eym7Z99LiXEzQctYTTfii7FsngSvjA4u438uiQ6HY43q4/l/2BgdhHS4fNye/7bRfHQ2AE/E+ikxBn5shTUp4MFf1NA68nhEFzaBRQnWF/419+8pvVNwWVI7iLCIBw/tYLob0w5gE7xwL4pw2ij3l45HvT2cvJY8EtOMDbiK3IG70t9rZA2PZK6IXj4wJxzlKFuwP9K/8jvnWKJEuBQ1zKTSC/3QdIAAQrbAqFg+Dt5PNyycBch8xb8NSMvJuCdrDidvzzIBX8nJOYLQQysJza/r9+VRglW/Rz6/IkGYuKks31V8TpP0L5gb42oDCtYrxCP5KwsU5bbyLW3mxNL5LpisfGw7u8THqnmEgxO8QXgbrEuen1Zwom65EvVXpoRkphztq/m0ZnSNVm7geo0lOaZjExG/hsCKp5c6E2QEXGpNPHsiML9bs2Rt9pqCSXKO2TgK79IYLGIoEShQROpIDaBog1wEnlABw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199015)(66446008)(66476007)(52536014)(5660300002)(66556008)(66946007)(76116006)(8936002)(122000001)(38070700005)(83380400001)(33656002)(38100700002)(64756008)(86362001)(6916009)(54906003)(55016003)(26005)(966005)(186003)(71200400001)(9686003)(478600001)(316002)(4326008)(8676002)(41300700001)(6506007)(7696005)(53546011)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6273
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7515dc8e-8b02-4a1a-f515-08dab6f648db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vFaujDEOfVRtlH12B7wq+QSCsOVNNeqN8WqiX91qsHXrHX4g+ykBsuu9oFktH3D6X7AHDOOqC5jXcUGHJ16095rzfGNqBalbUMXutup+y45HTZhK2lR/TS/Yj0D+9nykZSYUy9189haD6r0/Y0jSRy+pTj8zKXHpetwT+luJghz3jUCaTej3VbRTuQDarAHpXXe5+PH21J6rt9kpx/S6dZoDOdsWezF8VgyTz6kPoh/vXHEAmoQJ7dW59Hgs2wcD/6umDJhcoeJuGBR73fqLuImAkzOUPk7nJH+WwahfcksJz9P6W0pAOC6RK+Gc28yB48zesp7Asea8YQUcuVtfQQ01aBvmKWoVWRiKF8SaRiXaYesVy54WsELPy5hJcN6aw/mYegWgbYANR33OjwKFUfKgQ3gfPaQMSllCg+5rSEII1cNECPHM5WrCVHVSuxcMlb4KaVKSOFiLAIgX2w63W3nW9YFvMrwootb33yMm2pckuN0Evbk9sqCBUpbaskM+PWxX1gxKe2uszZsobGg8dAJW9wMq2TYMxSinx610icM2hZSSsTpw5hMFE3GG237Wk/ose0VRxAG8Qcc4TlVzP2Tq6ttptIAnArjBccgBWmsb93Ww3HNtrE0tQJKdOaNBiQXicdvbs8yYhvZvsEQmMF5HJ2eKUv7NMrdLSX6Jp75iQNx4lxAMs9dCwJ67eNNWQHlUsYxYQg0yv2afkQsWk0UKHomnc0jI0kEgZRbWyod8A7MiLoXIpVdUkrhsZRBx78RJNjoIe6MYv9mvy8XWlffnyfvLylXxVRscGx6+8fY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(40470700004)(36840700001)(46966006)(2906002)(40460700003)(70586007)(6862004)(5660300002)(52536014)(7696005)(8936002)(53546011)(6506007)(33656002)(9686003)(316002)(4326008)(26005)(81166007)(55016003)(70206006)(186003)(336012)(8676002)(41300700001)(54906003)(86362001)(478600001)(966005)(36860700001)(356005)(82310400005)(83380400001)(82740400003)(40480700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 02:03:46.8166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdce586c-ef5f-4b98-b9f9-08dab6f65157
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9094

KCtBcm0gbWFpbnRhaW5lcnMpDQoNCkhpIEphbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdl
ZG5lc2RheSwgT2N0b2JlciAyNiwgMjAyMiAxMjowNyBBTQ0KPiBUbzogSGVucnkgV2FuZyA8SGVu
cnkuV2FuZ0Bhcm0uY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBB
bmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsNCj4gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47DQo+IFdl
aSBMaXUgPHdsQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4NCj4gU3ViamVjdDogWzQuMTc/XSBSZTogW1BBVENIXSBjb21tb246IG1hcF92Y3B1X2luZm8o
KSB3YW50cyB0byB1bnNoYXJlDQo+IHRoZSB1bmRlcmx5aW5nIHBhZ2UNCj4gDQo+IE9uIDI1LjEw
LjIwMjIgMTc6NDIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+ID4gT24gVHVlLCBPY3QgMTEs
IDIwMjIgYXQgMTA6NDg6MzhBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4+IE5vdCBw
YXNzaW5nIFAyTV9VTlNIQVJFIHRvIGdldF9wYWdlX2Zyb21fZ2ZuKCkgbWVhbnMgdGhlcmUgd29u
J3QNCj4gZXZlbiBiZQ0KPiA+PiBhbiBhdHRlbXB0IHRvIHVuc2hhcmUgdGhlIHJlZmVyZW5jZWQg
cGFnZSwgd2l0aG91dCBhbnkgaW5kaWNhdGlvbiB0byB0aGUNCj4gPj4gY2FsbGVyIChlLmcuIC1F
QUdBSU4pLiBOb3RlIHRoYXQgZ3Vlc3RzIGhhdmUgbm8gZGlyZWN0IGNvbnRyb2wgb3Zlcg0KPiA+
PiB3aGljaCBvZiB0aGVpciBwYWdlcyBhcmUgc2hhcmVkIChvciBwYWdlZCBvdXQpLCBhbmQgaGVu
Y2UgdGhleSBoYXZlIG5vDQo+ID4+IHdheSB0byBtYWtlIHN1cmUgYWxsIG9uIHRoZWlyIG93biB0
aGF0IHRoZSBzdWJzZXF1ZW50IG9idGFpbmluZyBvZiBhDQo+ID4+IHdyaXRhYmxlIHR5cGUgcmVm
ZXJlbmNlIGNhbiBhY3R1YWxseSBzdWNjZWVkLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IA0KPiBJIGRpZG4ndCBDYyB5
b3Ugb24gdGhlIGluaXRpYWwgc3VibWlzc2lvbiBiZWNhdXNlIG1lbS1zaGFyaW5nIGlzbid0IGEN
Cj4gc3VwcG9ydGVkIGZlYXR1cmUsIGJ1dCB1cG9uIHJlY29uc2lkZXJhdGlvbiBJIHRob3VnaHQg
SSdkIGF0IGxlYXN0IGFzaw0KPiB3aGV0aGVyIHlvdSB3b3VsZCB3YW50IHRvIGdpdmUgdGhpcyBh
IHJlbGVhc2UtYWNrLiBJIGRvbid0IHJlYWxseSBzZWUNCj4gYW55IHJpc2sgYXNzb2NpYXRlZCB3
aXRoIGl0Lg0KDQpCeSBsb29raW5nIGF0IHRoZSBwYXRjaCBpdHNlbGYsIHRoaXMgY2hhbmdlIHNl
ZW1zIG9rIHRvIG1lLCBzbyBJIHRoaW5rDQpJIHdpbGwgbm90IGJsb2NrIGl0LCBidXQgSSB0aGlu
ayBBcm0gbWFpbnRhaW5lcnMnIGFwcHJvdmFsIG1pZ2h0IGJlIG5lZWRlZA0KYmVjYXVzZSBvZiB0
aGUgZGlzY3Vzc2lvbiBpbiBbMV0sIHNvIEkgYWRkZWQgdGhlbSBmb3IgdGhlaXIgaW5mb3JtYXRp
b24uDQpJZiBBcm0gbWFpbnRhaW5lcnMgZG8gbm90IG9iamVjdCB0aGUgY2hhbmdlLCB5b3UgY2Fu
IGhhdmUgbXkgcmVsZWFzZS1hY2suDQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4t
ZGV2ZWwvMTc4MGFjYjMtZDI5Ny1lZGM2LTNhMWUtYWRmOGIyOGE1MjYyQHN1c2UuY29tLw0KDQpL
aW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBKYW4NCg==

