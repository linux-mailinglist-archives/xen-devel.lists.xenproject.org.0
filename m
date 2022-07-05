Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F093566F19
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 15:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361256.590669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8iUW-0000Rh-9K; Tue, 05 Jul 2022 13:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361256.590669; Tue, 05 Jul 2022 13:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8iUW-0000PR-4C; Tue, 05 Jul 2022 13:21:24 +0000
Received: by outflank-mailman (input) for mailman id 361256;
 Tue, 05 Jul 2022 13:21:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skT/=XK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o8iUU-000878-Ec
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 13:21:22 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30046.outbound.protection.outlook.com [40.107.3.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c6de334-fc65-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 15:21:22 +0200 (CEST)
Received: from DB6PR0801CA0045.eurprd08.prod.outlook.com (2603:10a6:4:2b::13)
 by AM0PR08MB4242.eurprd08.prod.outlook.com (2603:10a6:208:148::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Tue, 5 Jul
 2022 13:21:16 +0000
Received: from DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::a0) by DB6PR0801CA0045.outlook.office365.com
 (2603:10a6:4:2b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Tue, 5 Jul 2022 13:21:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT011.mail.protection.outlook.com (100.127.142.132) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Tue, 5 Jul 2022 13:21:16 +0000
Received: ("Tessian outbound d5fa056a5959:v121");
 Tue, 05 Jul 2022 13:21:16 +0000
Received: from 4256015374b0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 41D970AC-53FC-4E2C-BD92-9EDF15AAA113.1; 
 Tue, 05 Jul 2022 13:21:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4256015374b0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jul 2022 13:21:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6512.eurprd08.prod.outlook.com (2603:10a6:102:15a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 13:21:07 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5395.018; Tue, 5 Jul 2022
 13:21:07 +0000
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
X-Inumbo-ID: 5c6de334-fc65-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PkiuNnQlVih/4SZjkEH1fJfhmNN8jg+lMHd6VHiNwaDv4vGFMEJ6WCc+Evn4lTIhL/ffb0U3CalRC0v/dLx4KyRR7Qe5ySVuxn1vhhDihZOzlH9WB/6DOSPiuVKdyK1I3tK8u785XmgmFbI7qndtCj0Qeatp4xBZpBqvsyLTW6yzPm47FL2K7zRNnH1WXNKlp5KFJYH9eYgGJ2k7/rkUo5OKWxW1DKyFcn6xYPcGNIXImiwNOHAg4aW+07gLOjMyXuvfqpl4glmOEGtkCS8VPaaEcc+bEWBiywGiw5EW539ibYD57EIJj7XYlJrFC8IGwur36OrVPaj+pK/mOn8VIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yl7ydSF5w2O77ENb8wz3ALgNAI2MdbbutsWtrg5Svic=;
 b=CS/MGJoMjWXBrGKX24cYDdPYKCTqoQbeqbA/4YFhx4hFLBZoAZFqDMx1P6oaxO0Bva6IUmYSvOacJ2PotiMGULGo4j+6AlrVULXfV3vOiXp/+TOg4Zy7b8Tssd6B2XIat+9Rbvj1xjyEeWjmekC2AuJ/Sdah9c43Ud7gH/o6l954sALaB3InxoxqVOfnnv4X4E7QJGjJfjHDvsMftIYnnQ9Z3EnPBcH4cEfI0QxAIWAM965djVsgzkKzbhx36hD7rdcx59Er4fnrWY8jxr+oJ/bxFSR+E97xIC7VAvTgomNYfcOymMUcz56uNAfsELyp+vaplEM8k/u25qNHAkVz4w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yl7ydSF5w2O77ENb8wz3ALgNAI2MdbbutsWtrg5Svic=;
 b=xeqsI8ihmOl2yje4qWR6ggRNTrQICM/wkZ7LVtD5kNGPxNod44jpeYebruvHtmG1So6XJ9EIIMM8Tzx6TpbNrrEBbV97oytbB6Wh8JGFgZAiWo3D5GbjOTwZrb8j2FZkthSwjym88Gvhy4AOMeKLPfBUIsW4NgjA2GQieNZJZL8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1353698edf7850d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOWlDo4S0v9MYH2DpwrchK5Ye/b6YZGuM2Wp2zyzmYxUfnaNOpcB/NLcwvSTFkGg9AjZOTtrmftAJ6BLR3BoKlVFEsaOzuZiXvdMf9iQ/WiJclQathaNQsBjXX+MpYEAmAivv71za/OkNIzXbXljVJp3d9BxUpsj0gQ5GbLS3Wyc/IYSAOhRi/gZCtEJ49PuTFMVnakjSHY41cgHhiXhezcBzhNITdgvVRBKexRyj2gvLa7LQEizz8/GBqjxcUFo1sW/Z6L7fUnwKTntBuuQl6UbB5FDJ7nMM2XvkNGRuDi6BDfThAa5PDNx/oEr2VTmugRa5oT/U1EXS+VGFVoVDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yl7ydSF5w2O77ENb8wz3ALgNAI2MdbbutsWtrg5Svic=;
 b=S0sEMYsOmb/LcFkzoVIKOiSg/TM6bGUXMPwb2wEofknIF8KAWDswHwATQpTNmNziuZjI5AwiWZyw8Ab38KYN1CeplVF1xB1ySrgap1KhTvY3KNGJ19sKmLFhu9o3oK59qIgHuWj6fc/Xh68EM/vObMEoqMtQOoFiSpKnCLp6HfxyH2iLSPL9yts9aNiuyyJAJ9+R5LTUTGZn2jVpDy/zNwcMjD9y3oFTSni7Erwb9a9PWhr2E1YfcYq0L2Jq4LIna+0EOKmMxkYkQ1/YJ+V7RVTNIcjN9hqohHRJN4wQT4MbJpDKNABIlwWeK+4buqQ3q75ovIDKapHmcmeOGenF2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yl7ydSF5w2O77ENb8wz3ALgNAI2MdbbutsWtrg5Svic=;
 b=xeqsI8ihmOl2yje4qWR6ggRNTrQICM/wkZ7LVtD5kNGPxNod44jpeYebruvHtmG1So6XJ9EIIMM8Tzx6TpbNrrEBbV97oytbB6Wh8JGFgZAiWo3D5GbjOTwZrb8j2FZkthSwjym88Gvhy4AOMeKLPfBUIsW4NgjA2GQieNZJZL8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v3 15/25] libs/libs.mk: Rename $(LIB) to $(TARGETS)
Thread-Topic: [XEN PATCH v3 15/25] libs/libs.mk: Rename $(LIB) to $(TARGETS)
Thread-Index: AQHYh+Q5fiim5oiltUCifj9IfmTKrq1v1GKA
Date: Tue, 5 Jul 2022 13:21:07 +0000
Message-ID: <019778C8-041B-4740-8583-32EAC5AF3F7C@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-16-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-16-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 49d4e2e5-b35d-4f0f-e624-08da5e893d82
x-ms-traffictypediagnostic:
	PAXPR08MB6512:EE_|DBAEUR03FT011:EE_|AM0PR08MB4242:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PGrUHdqAGuIt0PNCTTaEB1/aDFKpkWUrJOul9hV00AZ5X0VBvcANeOOk7KGF2PQ+1WS2bswtY25j198o/1ecg5GPsmjrkZ7KAAEI97vE2o+JealCQntIk/AXJ81LhWcKVe5tDHA7d/Oco7ANjOfODGyGDzHMzTZ6Tzeyr5xAmv6RSYw2RJ/xgpmnQPgukqnBngHkd2d0+eipNob2r8mMdGhe6SUWoBzpBrQupcmPQCNQsNKUa2kwY24Ym7A29ZUKH8lSw2Kau9bDYwkdbDdnKpTvf1ErPztpuCg7tLf8Cuci/NAAIZI+Z4yRWao6T+MTl7WPRGtzrR8Vg0+6eEox4UJv2LqqIq+7AUH/4Hdd7uppRyTaOOQCYGbm/fRzyqWQf/G9K+ZuxRijSSZPYXkCuG1UnDYJnvlbkBgW6G0ysV2/HwekRmVe4Gm4DxH04rHbd3OGiL2OMamxHNEXJuVGsez1Au41CAa7GeyWVs0KLT4etgBNbPyGcYan4y6wlOe2Vj5eLwqFkMV/qqgIwdENKuUW9FgwjuWKyE6iBkvD3kTz6T/ytKkTgpNhNe6WctbUENgMymLE8xlkSEwjS5wB7KquheeMTYN7K1+ra/bd73ybMLiM8ZXVWwhANA3imeQSOEESSDeiKt3vRvD6qSevNx4o+OxX734WsIzWVByfyZoMflkHMncOR8GNELXlIXWMm00AnWlIPiBnXFo1cFnUUuPhKAX1JPU1h6/NUqo2wYP26+gS6rLQyS/y8G4yJnWwDEla9VjBcPDt/H/jcf4mmfveUQAp5z0rSLBJen/kHM+s1iDWhPJSb0jk/zwlnR+woKb7Bm/l/qikfiyUfyTro32bqaNb2XG9t7wZ358aFtE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(4326008)(66476007)(64756008)(66446008)(91956017)(8676002)(6506007)(66556008)(76116006)(66946007)(41300700001)(71200400001)(6916009)(316002)(54906003)(6486002)(478600001)(8936002)(5660300002)(2906002)(38100700002)(36756003)(86362001)(33656002)(38070700005)(122000001)(186003)(2616005)(83380400001)(6512007)(26005)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2F94C9A6A767B945920B6C724BAE9232@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6512
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7e69c7bb-74fe-4b36-00c5-08da5e893880
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yQndfrE6+QjXltdTDxx5x6kqxF/efIHgr2OhLkciFft3BwG7MYgvxQivtqxxeE2fiiSRBLw6b/bXCNx0xM41xGNMKZhbt3rqJtODSe7qIRD6AzfsdfuwoWOqqygQF1RrYhAxlL+gLw513Tw1bJJHqwlm6dRfpUtLFugCz1iDu+ob78G48QeLo6VWMLOTOK/DMaWYDwpEAOFPqjH1H0UjEf2OTdkjLjxrdB534BfAd1Jfk/4WsP5PSr+DF3w+Nz7RNe1GQqkBhq08ZG0YV6hKnMUZ5insqCocMRSasyPaVFuGnJLC47Q+egqN7MO1b7H4uDgMdcdTTj44jyD6aRiCkP68l7upj2BDe5nxnkR3xWqfDrhSw8znRgF1Uh6rCC5c8aHp53wz5rCkaIHQqAJPSBGT8jOz3IupzNuJ5sk6gNDeJC/eOlMXtLgX2+S5Hk85yfgSJ/zNRsKrfNYuCZHVsUnMCrzr83dBEq9Pk/yrbVD9S7HCjfOkX/IT48XnbiiY7kaJisXqVx7BzxJeIrNmpC7KdpVGDjcpzXKvi3RuZo+d1S1Pybw1KCmILh3zTiG/O17NzgCOBw0isZbaG3uZTspNObj+y2SpuTanTrJjL0CPQPoSoJh+tvT1SxFaoozOHzDEGERCx2Zb3ScqE2irX9DjnU1/lZL0wIaHmKZqEi8wMoJaCwuKZS3vuaYwHwDNwu2F2xwA5MVsxAW98BM0p/0//4CJTlGJHDyn6bhGrB2/wpdhm/IHGzGBAMY4rtKvNdQ5DKm4mTlMVoN5NFCVyVKXQsGVeqBcAdrhVCn1c+bMTYZXT8KEbjzVvPCDnqmo
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(346002)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(36860700001)(82310400005)(107886003)(186003)(2616005)(83380400001)(47076005)(33656002)(36756003)(2906002)(336012)(86362001)(4326008)(70206006)(8676002)(6862004)(70586007)(6506007)(6512007)(54906003)(8936002)(5660300002)(26005)(53546011)(6486002)(356005)(478600001)(82740400003)(41300700001)(81166007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 13:21:16.1865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d4e2e5-b35d-4f0f-e624-08da5e893d82
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4242

HI Anthony,

> On 24 Jun 2022, at 17:04, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> tools/libs/libs.mk | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
> index 58d8166b09..e02f91f95e 100644
> --- a/tools/libs/libs.mk
> +++ b/tools/libs/libs.mk
> @@ -23,9 +23,9 @@ LDLIBS +=3D $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDL=
IBS_libxen$(lib)))
> PIC_OBJS :=3D $(OBJS-y:.o=3D.opic)
>=20
> LIB_FILE_NAME =3D $(FILENAME_$(LIBNAME))
> -LIB :=3D lib$(LIB_FILE_NAME).a
> +TARGETS :=3D lib$(LIB_FILE_NAME).a
> ifneq ($(nosharedlibs),y)
> -LIB +=3D lib$(LIB_FILE_NAME).so
> +TARGETS +=3D lib$(LIB_FILE_NAME).so
> endif
>=20
> PKG_CONFIG ?=3D $(LIB_FILE_NAME).pc
> @@ -55,7 +55,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR =3D $(XEN_INCLUD=
E)
> $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR =3D $(CURDIR)
>=20
> .PHONY: all
> -all: headers.chk $(LIB) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL) libxen$(L=
IBNAME).map $(LIBHEADERS)
> +all: headers.chk $(TARGETS) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL) libxe=
n$(LIBNAME).map $(LIBHEADERS)
>=20
> ifneq ($(NO_HEADERS_CHK),y)
> headers.chk:
> @@ -124,7 +124,7 @@ TAGS:
>=20
> .PHONY: clean
> clean::
> -	rm -rf $(LIB) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
> +	rm -rf $(TARGETS) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
> 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(=
MAJOR)
> 	rm -f headers.chk headers.lst
> 	rm -f $(PKG_CONFIG)
> --=20
> Anthony PERARD
>=20
>=20


