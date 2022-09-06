Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 644995AED83
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 16:46:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399932.641348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVZpW-0007ey-AO; Tue, 06 Sep 2022 14:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399932.641348; Tue, 06 Sep 2022 14:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVZpW-0007cJ-7V; Tue, 06 Sep 2022 14:45:34 +0000
Received: by outflank-mailman (input) for mailman id 399932;
 Tue, 06 Sep 2022 14:45:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nuBZ=ZJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVZpV-0007cD-2Q
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 14:45:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dcd071f-2df2-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 16:45:32 +0200 (CEST)
Received: from AM4PR05CA0032.eurprd05.prod.outlook.com (2603:10a6:205::45) by
 PAXPR08MB7672.eurprd08.prod.outlook.com (2603:10a6:102:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Tue, 6 Sep
 2022 14:45:27 +0000
Received: from AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:205:0:cafe::a4) by AM4PR05CA0032.outlook.office365.com
 (2603:10a6:205::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Tue, 6 Sep 2022 14:45:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT015.mail.protection.outlook.com (100.127.140.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 14:45:26 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 06 Sep 2022 14:45:26 +0000
Received: from c2cd1d0554f8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B6384AFD-9329-425D-B653-4D333266D458.1; 
 Tue, 06 Sep 2022 14:45:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c2cd1d0554f8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 14:45:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB3PR08MB9109.eurprd08.prod.outlook.com (2603:10a6:10:43c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 14:45:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 14:45:13 +0000
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
X-Inumbo-ID: 8dcd071f-2df2-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=U1LE+jtsBkb03mh9FMDEy7Ic0NPd+Olz5uLEdbpKzqgWUbpBzwnToY9b6FRd0B63vWzTf3pgaRuJMpahutjBNkGsCvvSUg/l9Vbve19bK0md9+UnyzJ3BEfLP4bnlHE5mi/aXihfqTPyYSDkWXrPFlakR73P1sOaP1sB8HCzMFlnEBWbDe/gV3YVQiPDeUaH4SEL9vHX0IoV1kxAHF/3VxcwiRFeukSwFQXwCppFRAn0xQu5t4Z9p00mNC3dAbOcirCOYf9Kp00ogEu4x808g+6sR6yVVV7VLKHDvtvyq6ENlUZwGWelwzU32pojQ2kUUGCq5JaiIKFkADLnnObXSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6z8KUo+QFq4Jyj4JVloTBzfjaAx35/FUsJVSJtNT8Pc=;
 b=SxJ8zzZYF3xcPABeGzrp179ihCbinQwl9GqCyQe+G/L6lG55g78M4AeZAfArmYR+nCIAeBCZp6/LOoz9PtkpUdYc1T4fu9V/PUSOeE5Yj3L4JKu96uDeNFGMoWlGlv7ifAgcGUh6Xs/8ocY5ZqnMad/l8R+X3qrYzd5BGHOq7ncf/s3Tiotq+uwXssH4FNkx3VW4+88Do/m4+5ULsPQunLJ41rvmYbqiHwPCW9+9wxG6M3oyNyxfvCH9Gc669nWcmqL5CcbkmtcG43YVEsDoPEqPfH4FikFmunHEG9A4xQFYZ4I7J4d/wNK0L4HvP2Ua0t2jamZ1wz1UOMmlNOOe1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6z8KUo+QFq4Jyj4JVloTBzfjaAx35/FUsJVSJtNT8Pc=;
 b=kB4t5mYCPid/gG5zaImco2KgiDSQ926X9vObua9R0jkb+0jeDktwuKi7I2qGz8Cm8oMG+tVTJq0WKYW3+6PmSPIgdvv1Py0AJqmCIFrg/F5VAswYkJCjH+7sfsxt1EbhsB+0H6WzV20VDZWySmr9/gdnt1K4HnfJS5wvhWXpssk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba5932f8dbc783d0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fw/K6CKZZvrwHlzym+dw0BhiQF2pNx+n06FABGkjVAzUCYOT7VeOlB0XnO3jNsaSvII27lAweZIYKGOyZegRmgH3ZQUB+OZ1ArgiqheGDajHXQ4PfV1SdFzCn8vf4aWMTXyhabuHdSZ3zxSmsAHAOQTy3U+H9l2FEKEIiFts//9ngyvpydCZrWF8y7Ee/F8UDbcNXmRE+2XK+ssdf1vaMUH/XwKtlaWjgyK62iL3j24X2Igm9RTxqmzaY53jKxtIk6wdTP943SnKSHHhAIvOAaEVF2UV+kcXFCfaKR4CaY/YwXMHavwINEeAahrGmPFIbcpmE1L5qtBaEcFO6k1k4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6z8KUo+QFq4Jyj4JVloTBzfjaAx35/FUsJVSJtNT8Pc=;
 b=ACibcI/rmEPKCC1GmFSZovPnZeER0FNBeCdZ3xv+Yc8u0TgPam9Ce8sEsJF8BiRRhmMwlwqGTAU5QFgx3d9OVZhxk29K1S6+S5cj5sAs3kWVGbdXSAvJ2RCcuLShW8ofHgcB17BcgMzmO5zOW73ByPrPXPGOm3EcIuy4SYQIC9VRoDE+b7DHL919WzH+PL4WN19n9fx6uz5A2hrHKba+QXu06Ccge0hCcW76mkV7C2Prz58DMy3uTbGcW3Guj2rhyIpMPn7GnfLngz4lAe+apWVZk8rkAuRBLFScfZGTaPrJjkgaCHS1YAhnDQp7dVuFNqSdrpUZXPj13N2BYmKLfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6z8KUo+QFq4Jyj4JVloTBzfjaAx35/FUsJVSJtNT8Pc=;
 b=kB4t5mYCPid/gG5zaImco2KgiDSQ926X9vObua9R0jkb+0jeDktwuKi7I2qGz8Cm8oMG+tVTJq0WKYW3+6PmSPIgdvv1Py0AJqmCIFrg/F5VAswYkJCjH+7sfsxt1EbhsB+0H6WzV20VDZWySmr9/gdnt1K4HnfJS5wvhWXpssk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Zhou Wang
	<wangzhou1@hisilicon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
Thread-Topic: [PATCH v4 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
Thread-Index: AQHYwdelUBSV4OOcQUmjNGIzTG/77q3SetoA
Date: Tue, 6 Sep 2022 14:45:13 +0000
Message-ID: <4671F8E2-2952-4904-989B-335652EBFB10@arm.com>
References: <cover.1662455798.git.rahul.singh@arm.com>
 <4404a056ba2dfc7ed2a69270dd2c28d0d343dfa3.1662455798.git.rahul.singh@arm.com>
In-Reply-To:
 <4404a056ba2dfc7ed2a69270dd2c28d0d343dfa3.1662455798.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 639ca176-c90d-483b-573b-08da90166fed
x-ms-traffictypediagnostic:
	DB3PR08MB9109:EE_|AM7EUR03FT015:EE_|PAXPR08MB7672:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8NGkfPn+Jgat/V++sP30yq92dujAIih9eGSXUGcpnuv2f8wP/I9lqcXECNMjRkSd2slX+VUWEYk728nezsVEZugzu3CUSOf8IGwThycGrndTxTzSwxU6bBAa4zUedh5/rI45e9+Wt3/04Ts9b5oXuUgYIADWfY/80BHdGX3145UQv764/xxmhdjJP7SS+6X5OzM7Z1N85I8MiTpQfn+Hl303cWVPVy+xdjKBaJiR2DZ6wcfkRaVzjFmxl/Md/m/g8MJjJ11XWJsztYLp5379uWcnzJ6Kjr/KBF0bWrAxihE4RfSBgUmXPpD/rOdOwNXlNBGk4SXrMvQQKWephpZYp3gtLb+REvhdPiT4icykq2OvDuuJoVfeM7BwIJKxDwlQrYNn3GHeFUrkshw/11WoSgsPruxREAGHH9MsZ2P7UGo5eBbw9KAIIyPivm3Bp1h+f3HfpWsmsn3mu4UcIgSy53B2dYhmrpPdv/jyDI0lT3/jjU0ZW3Sc+l/WSL2FUEyL/thdiQr/LpNywN4P90m4kevKm6sIxgZWXLddcqyrjDu9SNsqoaAqgAEUl8jQtrYGsjGN6uarxSdcRavBwdmvSpwFcxGuoSJ49G3kuYnOn1byOvMirAcmEc8PLx+Qtc7/a1Nww/P8/g7afCmN0YMHctU3XTa9LXs918vpu7IixrNlxE74JgdhTCNr3HKz8dSSTz/jGB8KZoaASm581PkUH1QuElag5YNLbbrpbWHhDwUVXrU/eQjafcMhpwKEmbAXMZm+fniSplHsoPROkeJUSt+Pd9XC3xKpjD3uErrKfQRN3KBZIAQzgWagA12Vy4Vh049fr4q6Vk3ZX+sPXbjgXg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(122000001)(26005)(38100700002)(41300700001)(86362001)(53546011)(83380400001)(2906002)(36756003)(6862004)(33656002)(6506007)(6512007)(5660300002)(8936002)(64756008)(66946007)(8676002)(66476007)(66446008)(4326008)(91956017)(71200400001)(76116006)(478600001)(966005)(66556008)(2616005)(38070700005)(54906003)(6486002)(6636002)(186003)(316002)(37006003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <312E94AEFB81C2499C31987C72EE0416@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9109
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a55b2ed-4a1c-464b-d9b4-08da901667e5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PinrbXDYAO/kncFb9cGDXPS4r6X6RxL92zcUl9lZAwpUOOTrmQgegnEA+PzlGv32qkgzxsTNWD3ZOaG1DpZHkxIR2icVCz+9ga66VguN8s4qKDBq63U46+RcXI8adj4sRFH4Xsq63ajalI5FYvLLwnce9ehM08IqZ0Vr8IyDlLnTWnmHNl9ss+Pe7uKjb17rmy/70mVFqYiA3SISObZJbLrMQ5x6SLWwKPEFbdLVxL61NicgNfISPgQeDbsnxl8VRTiG7/OfzNtoRWNjC5LS7kFn5fhiq6XOSihQHbfDw8LC+lW8bH9QizWM2Fa7mWOzxs42GtSt/EgyYX6CJ4Wt5NGGPMz8QbTHWnJQBVpLNgLcBl9d9hi1HBZ2HbuwiV3ufL5Y2vOqd6YcqmsnYI70WorjHtzNtB9wHS4M9zTt47GVIkSCmpoZnD2qzvVsbsXZCDR4kfwx4ofRsc6ZI5iRNdYtxDw4PIk1qaaDIUZw/6J2eJTeXpIBSfCoWANKc/aPfF/8RDhMK57KBpqGs80iq6urcLqRbkoNC6jCubP7PAg/PXv/oOVw1rZfKhdzrVMyTUPOx8Qmaq7PYQupGofT5eGfjaj0NUSYArsgMT6mz2msx2z9U13Q5CxBjp1psW59zke4/YzJzKv9JdKrJY4j3Hf3uKbJLPN/RI5avgcCD91Wl2bazjAU8JTDUMKg29uoTdOImdjKPD7nPiTRwkk+jPuPScnY4WktsWPWTZMmxFekAH/yWqiGTCLy4mOvmrbUP/6zLeRGxCXXMJfiuFVTYOs47zW37cg4KWpQy2BvdKc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(136003)(376002)(46966006)(36840700001)(40470700004)(6862004)(41300700001)(5660300002)(966005)(6486002)(8936002)(107886003)(33656002)(8676002)(356005)(4326008)(478600001)(70206006)(70586007)(82740400003)(82310400005)(2616005)(47076005)(2906002)(86362001)(186003)(336012)(53546011)(6506007)(83380400001)(26005)(6512007)(40480700001)(316002)(40460700003)(81166007)(6636002)(54906003)(36756003)(37006003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 14:45:26.7227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 639ca176-c90d-483b-573b-08da90166fed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7672

Hi Rahul,

> On 6 Sep 2022, at 10:55, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> From: Zhou Wang <wangzhou1@hisilicon.com>
>=20
> Backport Linux commit a76a37777f2c. Introduce __iomb() in the smmu-v3.c
> file with other Linux compatibility definitions.
>=20
> Reading the 'prod' MMIO register in order to determine whether or
> not there is valid data beyond 'cons' for a given queue does not
> provide sufficient dependency ordering, as the resulting access is
> address dependent only on 'cons' and can therefore be speculated
> ahead of time, potentially allowing stale data to be read by the
> CPU.
>=20
> Use readl() instead of readl_relaxed() when updating the shadow copy
> of the 'prod' pointer, so that all speculated memory reads from the
> corresponding queue can occur only from valid slots.
>=20
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> Link: https://lore.kernel.org/r/1601281922-117296-1-git-send-email-wangzh=
ou1@hisilicon.com
> [will: Use readl() instead of explicit barrier. Update 'cons' side to mat=
ch.]
> Signed-off-by: Will Deacon <will@kernel.org>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
a76a37777f2c
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v4:
> - rename iomb() to __iomb()
> Changes in v3:
> - rename __iomb() to iomb() and also move it from common file to
>   smmu-v3.c file
> Changes in v2:
> - fix commit msg
> - add __iomb changes also from the origin patch
> ---
> xen/drivers/passthrough/arm/smmu-v3.c | 13 +++++++++++--
> 1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 64d39bb4d3..229b9a4b0d 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -107,6 +107,8 @@ typedef paddr_t		dma_addr_t;
> typedef paddr_t		phys_addr_t;
> typedef unsigned int		gfp_t;
>=20
> +#define __iomb()		dmb(osh)
> +
> #define platform_device		device
>=20
> #define GFP_KERNEL		0
> @@ -951,7 +953,7 @@ static void queue_sync_cons_out(struct arm_smmu_queue=
 *q)
> 	 * Ensure that all CPU accesses (reads and writes) to the queue
> 	 * are complete before we update the cons pointer.
> 	 */
> -	mb();
> +	__iomb();
> 	writel_relaxed(q->llq.cons, q->cons_reg);
> }
>=20
> @@ -963,8 +965,15 @@ static void queue_inc_cons(struct arm_smmu_ll_queue =
*q)
>=20
> static int queue_sync_prod_in(struct arm_smmu_queue *q)
> {
> +	u32 prod;
> 	int ret =3D 0;
> -	u32 prod =3D readl_relaxed(q->prod_reg);
> +
> +	/*
> +	 * We can't use the _relaxed() variant here, as we must prevent
> +	 * speculative reads of the queue before we have determined that
> +	 * prod has indeed moved.
> +	 */
> +	prod =3D readl(q->prod_reg);
>=20
> 	if (Q_OVF(prod) !=3D Q_OVF(q->llq.prod))
> 		ret =3D -EOVERFLOW;
> --=20
> 2.25.1
>=20


