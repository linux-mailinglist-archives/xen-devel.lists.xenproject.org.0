Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C55606D1F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 03:44:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427245.676112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olh4B-0001k8-5i; Fri, 21 Oct 2022 01:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427245.676112; Fri, 21 Oct 2022 01:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olh4B-0001h2-13; Fri, 21 Oct 2022 01:43:19 +0000
Received: by outflank-mailman (input) for mailman id 427245;
 Fri, 21 Oct 2022 01:43:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gujA=2W=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1olh48-0001HJ-TA
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 01:43:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb1af48f-50e1-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 03:43:16 +0200 (CEST)
Received: from AS9P250CA0003.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::9)
 by DB8PR08MB5450.eurprd08.prod.outlook.com (2603:10a6:10:116::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Fri, 21 Oct
 2022 01:43:10 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::96) by AS9P250CA0003.outlook.office365.com
 (2603:10a6:20b:532::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29 via Frontend
 Transport; Fri, 21 Oct 2022 01:43:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Fri, 21 Oct 2022 01:43:09 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Fri, 21 Oct 2022 01:43:09 +0000
Received: from 9a1d3d18c706.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9187C2A3-70F9-446A-B3BA-B783279DBF36.1; 
 Fri, 21 Oct 2022 01:43:03 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a1d3d18c706.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Oct 2022 01:43:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB6644.eurprd08.prod.outlook.com (2603:10a6:20b:30e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 01:43:01 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 01:43:01 +0000
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
X-Inumbo-ID: bb1af48f-50e1-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OIfMpaPX3cL0sVFmND/d3o3EBA8rW0pGbNSALAzRfnhl/MICcJW3CpuK7OrSyUTLEDKtOP6j3ju/cX5NZC3919+mp7+Dd/JUrykTtuHeHHBzaTFcW4HZnsltfU4JiPuYu20eospltMGo5LwPciMOSV+zB45tl+hiOsqkyUhBj0u54/3VFO33HC9p5Y3lM5hzqwpbHhSyrJli0IS2Fh+XXmG7ePcrzMSzOa3tZAqE7aflpCTQMvsBufc3wktqG87phgOkmsZoETD8o2bCTxIZjuGQKExa9pVpu8M9t8V/6X+ZfNiYHgXONPC+mxLIZ1eycI/inzLI8OcsYf6rKihGCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/1lRJQoi940BYFAJ88BXjIaVMViStIp0n5oPY7StpI=;
 b=GOzb27BZKFAieD2XCX6wcGmJTS08PLkS2zDbM9vme0oB7y/xHEDQeBZ3D14n/pXru+oLeRMTOi9t2haAOuqHVUhFNFxZXmZeyYnMoSIZM6/7412GjTwfbQnZfUGBNGM4/z5IAV4reDHOX7PgdYyvFTbzzfZl3OWJgPixIk1F5V0unm4FCFz7ekiopgAkpSoMkJ16yHB+fyIXJN/k8Vc9AqQ/NSxkmAoDDxmMi3UPz0ofW8hGGjD9WEp8GB1KD1YRO6RqITExHG449+IkMfPCCcwOcGUrako9EcinYmS2Hv/ybXbUKrFBRxi4NFOm+WQ0RLNRrPlb63QBXoWqRuQpcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/1lRJQoi940BYFAJ88BXjIaVMViStIp0n5oPY7StpI=;
 b=6W8y2iKtcqKrgEmXGnczO0SBPu5fxnks3iKFSXKu5WTtrRR2xX1S/4L1u5H8nRY1IAcqRfMWhMPWT+yh88j+D5koevTjU31mvyfdqPsKgtr00hFH5UGAhME/LVhlXm4T9yqoeic+qD5/aVQjJ+rjpiDWk8W0h7FcQqXc85ocpf8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZ45DSLL6o9U8EP3/QZezEDo5KpsGI0wQjaO3OrI9loo1jpUrgggQ8KVwvkD8XjBkCzSHAlO9b0dD124ZG0xctvT56OiD+hmPMFHX+oW38SmJkK/ldY1Qo106UyXEt7Zuk7t73d473zChXKx/6pvM4iK/pLmad1Yrv8e6m3wQztEsZa++y6UoCPOyy9c+FEcjFSfiBd3EMID0toSSfxipizBmclMLKdX7ARB641jD2WPh+8cfK2nnZ96dfX7OQv8W798yABwIjlLkqP/Zq2tzkcVFZkwVlt+ZBH8gIcAzwW24akPB0GZFCfACXHoqhSQlT9TQvkgyj3yRS/45WKs+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/1lRJQoi940BYFAJ88BXjIaVMViStIp0n5oPY7StpI=;
 b=RUIRhXvXf4A8QGBltC4CBSIIvBpWRpI11krOSpyopEj6UTXMAVvXSQ4Zjf92yO/ruXB436l2w1MxvUNHS5xLev8dNVDEBEhVnOlErOw2b+HNhg9qGOnh3LInt/ZkFbjDleUVlr0I3WDi6/IFQ3sCd6ETs/b0T5c/dGGA5WCR4it24OOzadQ+C5DQYxDBiopQimZ1mkszA+U70OJPV9Y+E808qsrxiPwLs9blKysEJHxXza+W5j0LqWYKXViaqcfFA/l63s0ir93CLFfDwCMaVZTStfFrkS/TC4ND41WDq7hfYH6S7CA1nUphpeSyfG5lz5FVWSHHvG1uoBi57VKwyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/1lRJQoi940BYFAJ88BXjIaVMViStIp0n5oPY7StpI=;
 b=6W8y2iKtcqKrgEmXGnczO0SBPu5fxnks3iKFSXKu5WTtrRR2xX1S/4L1u5H8nRY1IAcqRfMWhMPWT+yh88j+D5koevTjU31mvyfdqPsKgtr00hFH5UGAhME/LVhlXm4T9yqoeic+qD5/aVQjJ+rjpiDWk8W0h7FcQqXc85ocpf8=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2] xen/arm: mark handle_linux_pci_domain() __init
Thread-Topic: [PATCH v2] xen/arm: mark handle_linux_pci_domain() __init
Thread-Index: AQHY4AkLAZG1W03ugkqkeLVQdjVQ9K4XoOsAgAB7wRA=
Date: Fri, 21 Oct 2022 01:43:01 +0000
Message-ID:
 <AS8PR08MB7991F349919947C426D29EB5922D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221014025354.30248-1-stewart.hildebrand@amd.com>
 <20221014200926.15250-1-stewart.hildebrand@amd.com>
 <fe6ac13f-70c4-8d15-20b5-a52ec88f394d@xen.org>
In-Reply-To: <fe6ac13f-70c4-8d15-20b5-a52ec88f394d@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AE53891DAAE07B4E820E7F452A47E81C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB6644:EE_|AM7EUR03FT006:EE_|DB8PR08MB5450:EE_
X-MS-Office365-Filtering-Correlation-Id: df4324c2-a8f3-4147-4f19-08dab3059bec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UU5BCsXHpV5xoHZJr0TtJtgIynKW4DwHm0M8f53FsOOecDrbaneRLTc0cqAekWT+WvMon5rK3wA9j4Kq5fnkL/r5XJIUcD453qqOzJY0xepeosxvK9UEJmscNG6OqmQ3o8W+sJJG4w3RqAhVfbby5nZPV3jVJLQEfCr7XUxR5ooo573/CzrJCMH/GUwF3s5B5h4XUZMOvQEgoTk3lU7e4m2T1eCkCh3A/wv0+Ik3215ALzP527TcEG2MyUtKC8llqpwy+GynSQFRSiyL+Y9dut3A0R/JYbz4ERlDWoiaEvfIPgm999x+OyVRcLVVu6oq3Z+TVuN6sKjaHv/9hf+BOIqeXMaFCgI6AvfwdY/jrwcGEL3+//oB2ISc0n/qecwGLX0mznwlIlEgGaI0v79g8IjoNgyORk0nUthVSdwd71L1OFp6FpS4Bwz7tXcp/C26TxexKp/mQPDH0d+S1sbe1FW8oYquVUvIMBaQkdujfInUTvJNtQIrTz7ZiLp8WUpoS1zLNzGmwQcurBnDZRIvPj4HRn3ue7at0N604K+fa1TH8hs7HUIK8sba+mgZqyOKfXwmvi5AUqZb7h464TOflhZNKKjgTHcDYX8/caXIDRFeIO51rv09jAU9BfPrd6ViZcjh7eZDLy8D23FODIBYjFY+aqbsx+MiPf7zFIBb6ctdfWW8lSa9Aup6uLBbnOZgLE8l8KsqWvd4aB5AgZHX+HFzy/oVTcwm5ENmo4cHkSOX7hvAsKaabv4qTzd8XamhQPxo1/PlxRllBI0RZBjRsw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199015)(4326008)(66946007)(66556008)(8676002)(66446008)(66476007)(122000001)(64756008)(76116006)(41300700001)(53546011)(7696005)(6506007)(38100700002)(2906002)(71200400001)(186003)(55016003)(5660300002)(9686003)(26005)(86362001)(52536014)(8936002)(38070700005)(478600001)(83380400001)(316002)(33656002)(54906003)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6644
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9827e66-0abf-4fa6-1c3d-08dab30596fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LVE2T7bcK1co9Fsil3o5HS0e5rwLXPtm3bN7KW6JN0EIYlkhCClR647u2kQCY2FD1VCHfkvpyjSevphkYyj7Km3NQ4TOU75SyIfCIejJ11kmTkjEljhk9SqUzAjZfff5FvzajIpGIyKdQMlmI8O0YQjRwXlRu/rR4IBfBCmnqWaRfsvYBBLodLqJu9bynRSNp9yvKq0CrBAwlnkt/9TBB5Jsh0UT+ZfuVWRVwARofyFK/Z+YZDgBMIhAxBIuQmnhrmaBEV0ax2aobUWS2G8oWER5e/GOg/dzhFkxrNPu9vwFUhGJL562wYFo4LiUD1cZw99Mev13EcOLp4xXDWQoQ/xPurkjTXO7MGv9vHi6p1E+j6EetJKuSmTRthv/Q6DsR5ne1h341NKi7IX0IHXOfszL6+nopl/rSZVvRiaLz5+7YeVD3BVaJGs/G8ENixwDg7YRGUBH55SfwNhHIthxRaEi75q29JIiFAOGzLI5GCttmKrDlu3VLBMhGkTTvkg3AwaHuPA/MBw3o208xvy+f9DqIf0D6moTfUOrokP2ljiMsRcv570Tz4rbNRSvp/r5634rOG5Y/7bGqQeR4HWxyY8+Oj+Fael71SucLJ914UapEgPy+7tW2ogRNrp+cDDdXGA3baWfdAH60Tx5X+vDTz6CMB2PmJIIargqinc4IGmyUHCri1M5ZjAa4bM4lb7qFlaqGbdC8hbU54i0RoK8JnpN5nO5ToSiv+VRaOih8dL+iL6s5ySaZ2+70scOIvRQXbzds0yMORu6HJnfs1AgSA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(46966006)(36840700001)(40470700004)(478600001)(9686003)(53546011)(26005)(110136005)(336012)(83380400001)(2906002)(107886003)(7696005)(6506007)(5660300002)(186003)(40480700001)(40460700003)(82310400005)(316002)(54906003)(8936002)(8676002)(41300700001)(52536014)(4326008)(70206006)(70586007)(36860700001)(47076005)(86362001)(55016003)(33656002)(81166007)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 01:43:09.7885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df4324c2-a8f3-4147-4f19-08dab3059bec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5450

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHhlbi9h
cm06IG1hcmsgaGFuZGxlX2xpbnV4X3BjaV9kb21haW4oKSBfX2luaXQNCj4gDQo+IEhpIFN0ZXdh
cnQsDQo+IA0KPiBJIG5lYXJseSBtaXNzZWQgdGhpcyBvbmUgYmVjYXVzZSBpdCB3YXMgdGhyZWFk
ZWQgdW5kZXIgdjEuIEluIHRoZQ0KPiBmdXR1cmUsIHdvdWxkIHlvdSBiZSBhYmxlIHRvIHNlbmQg
bmV3IHZlcnNpb24gaW4gYSBzZXBhcmF0ZSB0aHJlYWQ/IFRoaXMNCj4gbWFrZXMgZWFzaWVyIHRv
IHRyYWNrIGl0Lg0KPiANCj4gT24gMTQvMTAvMjAyMiAyMTowOSwgU3Rld2FydCBIaWxkZWJyYW5k
IHdyb3RlOg0KPiA+IEFsbCBmdW5jdGlvbnMgaW4gZG9tYWluX2J1aWxkLmMgc2hvdWxkIGJlIG1h
cmtlZCBfX2luaXQuIFRoaXMgd2FzDQo+ID4gc3BvdHRlZCB3aGVuIGJ1aWxkaW5nIHRoZSBoeXBl
cnZpc29yIHdpdGggLU9nLg0KPiA+DQo+ID4gRml4ZXM6IDEwNTBhN2I5MWMgeGVuL2FybTogYWRk
IHBjaS1kb21haW4gZm9yIGRpc2FibGVkIGRldmljZXMNCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGV3
YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29tPg0KPiANCj4gQWNrZWQt
Ynk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IA0KPiBIZW5yeSwgdGhpcyBw
YXRjaCBpcyBmaXhpbmcgYSBwb3RlbnRpYWwgYnVpbGQgZmFpbHVyZSBvbiBzb21lIGNvbXBpbGVy
DQo+IChhdCB0aGUgbW9tZW50IHdlIGFyZSByZWx5aW5nIG9uIHRoZSBjb21waWxlciB0byBpbmxp
bmUNCj4gaGFuZGxlX2xpbnV4X3BjaV9kb21haW4pLiBBRkFJVSwgdGhlIHByb2JsZW0gd2FzIGlu
dHJvZHVjZWQgaW4gWGVuIDQuMTcuDQo+IFdvdWxkIHlvdSBiZSBoYXBweSBpZiB3ZSBpbmNsdWRl
IGl0IGluIHRoZSByZWxlYXNlPw0KDQpPZiBjb3Vyc2UuIFRoYW5rcyBmb3IgdGhlIHBpbmcgOikN
Cg0KUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQpL
aW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiA+DQo+ID4gLS0tDQo+
ID4gdjEgLT4gdjI6DQo+ID4gICAgQWRkIEZpeGVzOiB0YWcNCj4gPiAgICBBZGQgcGF0Y2ggZGVz
Y3JpcHRpb24NCj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDQg
KystLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPiBpbmRleCA2MWNkYThlODQzLi5mYzI5NjE4
OTViIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+ICsr
KyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+IEBAIC0xMDUxLDggKzEwNTEsOCBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgYXNzaWduX3N0YXRpY19tZW1vcnlfMTEoc3RydWN0DQo+IGRv
bWFpbiAqZCwNCj4gPiAgICAqIFRoZSBjdXJyZW50IGhldXJpc3RpYyBhc3N1bWVzIHRoYXQgYSBk
ZXZpY2UgaXMgYSBob3N0IGJyaWRnZQ0KPiA+ICAgICogaWYgdGhlIHR5cGUgaXMgInBjaSIgYW5k
IHRoZW4gcGFyZW50IHR5cGUgaXMgbm90ICJwY2kiLg0KPiA+ICAgICovDQo+ID4gLXN0YXRpYyBp
bnQgaGFuZGxlX2xpbnV4X3BjaV9kb21haW4oc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywNCj4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZHRfZGV2
aWNlX25vZGUgKm5vZGUpDQo+ID4gK3N0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9saW51eF9wY2lf
ZG9tYWluKHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbm9k
ZSkNCj4gPiAgIHsNCj4gPiAgICAgICB1aW50MTZfdCBzZWdtZW50Ow0KPiA+ICAgICAgIGludCBy
ZXM7DQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

