Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 764485AD13B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 13:13:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398735.639666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVA2N-0004VZ-G6; Mon, 05 Sep 2022 11:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398735.639666; Mon, 05 Sep 2022 11:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVA2N-0004TC-DF; Mon, 05 Sep 2022 11:13:07 +0000
Received: by outflank-mailman (input) for mailman id 398735;
 Mon, 05 Sep 2022 11:13:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkdn=ZI=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oVA2L-0004T6-Qt
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 11:13:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b52c80c5-2d0b-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 13:13:03 +0200 (CEST)
Received: from DU2PR04CA0278.eurprd04.prod.outlook.com (2603:10a6:10:28c::13)
 by DB9PR08MB7795.eurprd08.prod.outlook.com (2603:10a6:10:39a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Mon, 5 Sep
 2022 11:13:01 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::a7) by DU2PR04CA0278.outlook.office365.com
 (2603:10a6:10:28c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Mon, 5 Sep 2022 11:13:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 11:13:00 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Mon, 05 Sep 2022 11:13:00 +0000
Received: from bf622aec953d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FE03FF8C-D3E2-45A3-8E6F-A6CAC38B6864.1; 
 Mon, 05 Sep 2022 11:12:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf622aec953d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Sep 2022 11:12:50 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by VE1PR08MB5871.eurprd08.prod.outlook.com (2603:10a6:800:1ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Mon, 5 Sep
 2022 11:12:47 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 11:12:47 +0000
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
X-Inumbo-ID: b52c80c5-2d0b-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bI8y0hFSwpiPQ18l4W3mITeQFmZF3ZaL9rZyXL4AsQ7XY6a5+zUyzP2HR+SKKJ01ZKBGFjBJlz2ewtT3HuG36+Ym/kQgU0RxvMDJBYIgPr7WiVwjqBiLRWFGZXD8qdwXGA4JIeEY96ptLpNbKYk8UPS2RV8fDVZCqPok6AvHIJqyph4/hOWc34yhh063KSF4Mnri8/Gw12WDX2VbsKWVMSEcUpb4n4Hm6sdO3aYZkKosK/EyGQu4G62Fbdxb9ttFqkXvtFboalKror/SbU33f74OU430hNGEXAV3di83MtRfhSGic+66pmb6QKg1FeZNe7sPQp7tfHNwo2SzmNwAHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfCop8JFo+U16ITqf9+5QrgRFfTvtTJT7PypKA86ri0=;
 b=khYszJVT5b0scdgr1K5xBaoKr6+dpuPcmD9xhe7PURSFPoC6fP+Kzt3ogIaf2xZyHKVRrGP/ewN1pRfpbKT0WE7bZP2OZrdC3eglziHA5cteVdlbdisbLRXFuvxGY6niu8EyDtl5OizHyJvKHLVrT1sel8U97P6MFdqFtjiZ+34YRxILj9z3l9fInSsBzIwlxjMZcSfQj9BYqYA7l7LHNdikmCKzwm1dfK7wvgVcpBfNdWBcxtBJFoavYXHfx+SXTR9p8XBWRm3KSR9iroKB7ESW+2qX0lGpIeeyYvZUPT5gINeFkxVnLj6pIPUdQAI0HJTtVelBESqaHZiBlAMzig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfCop8JFo+U16ITqf9+5QrgRFfTvtTJT7PypKA86ri0=;
 b=PWktcbuSX7QV1V9EdgoUsRRUjOjlF+P85UXdkPOx3U6nNveMCN3gXWTKkhPJG3z1SfmW2RYnQVBBnOVJOctahL0B9n0/Wf5M5d1H/6vpoYkvL2tyZTm1HaAw/MV1IS6rnWWL4y45qzMf85AmTiRBxVs3+L/1WSa09hjCoVQeRKA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9d2471f83f4dd4ca
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asYmtwP6rYlRe1EmdUwYYfO6gC/RI1CtRURpH7+Z3WsE5gMd6oV9xr4YAjgUIRlNxK3TxeS35sI7rdY4lH0RhzJrh59MiI5aHMcWujSQcwxh+5E1gYzIMwRkta7fNhzhBgJpZpBfUt2vtuprG8m5jKKp8w9bB2yClEu1EiuPbYkYEhghFYH0w5T0Bu/PPUeiGd6cB1Rb2YqHec3AbMBXrMVjg35UZ/bDSCS6OjtwpnFUY4SEnrtXcmgL9KO7jvcrVECZgcMrdRCU9Q85hwXAunb8cX81XRHWupGynrlh1/8CvzqASFKwetiL4CMdWZ7Yuunma2rXIixdPu7WjPYV8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfCop8JFo+U16ITqf9+5QrgRFfTvtTJT7PypKA86ri0=;
 b=T0xauWHPDk53m2d27RnDpmYDkRhXOLVevhOTC2pmKmxR93TQywsGK2MSM166EqIYhtoHVIIFM52MDKc/Kx6sZTdXUipild4mr3DSQBS0h9A6KVZV8RkyHFwB4R7FpGd0z5Z4EXRUpJtPoCPNcPKvivPHMc4OJTS3Dt4hRrqsYgk8p53tuUqE67/itkM7wibx/LdFsYixUxepke9QyvH3q7ZOWwMkgFS4Q18lt0s+XhaOLSUAYlo9Qq5YyYUfRPFPqK6FkviR/29rL6hrqqGzPAXzlD3JKCakSDPNVqobUmF2kvuTyDjH+Pa10pvXKdiKiivZnSdjU071WdaoG5YDXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfCop8JFo+U16ITqf9+5QrgRFfTvtTJT7PypKA86ri0=;
 b=PWktcbuSX7QV1V9EdgoUsRRUjOjlF+P85UXdkPOx3U6nNveMCN3gXWTKkhPJG3z1SfmW2RYnQVBBnOVJOctahL0B9n0/Wf5M5d1H/6vpoYkvL2tyZTm1HaAw/MV1IS6rnWWL4y45qzMf85AmTiRBxVs3+L/1WSa09hjCoVQeRKA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index:
 AQHYveOA33HU3e+ak0GIRMMly1Yth63K4ewAgAFZKoCAAAQmAIAADY6AgAAHOICABGESgA==
Date: Mon, 5 Sep 2022 11:12:47 +0000
Message-ID: <C27FD0DE-D8FA-4A67-AE0B-DF4030A65127@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
 <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
 <36A408C8-36C5-4A39-80B4-F564445635C7@arm.com>
 <616b36ec-5a42-cb9a-2131-3aea1bec7c67@xen.org>
 <46897765-5063-49CE-8A8A-F4DA50570A08@arm.com>
 <a669182c-dab1-35b7-9bf7-caac1813e3ad@xen.org>
In-Reply-To: <a669182c-dab1-35b7-9bf7-caac1813e3ad@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8783ff28-5d94-467d-97ca-08da8f2f9831
x-ms-traffictypediagnostic:
	VE1PR08MB5871:EE_|DBAEUR03FT039:EE_|DB9PR08MB7795:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2ZRRaily/0cFq+iD6flwmLTtGfQZehJvMKF8NW6GPuLCTb6YdS1ihkf8YsGSjrTJV3mPOQ9sP2Eyx61Sq/u64wVJVEe4ILJDficQXkzK07CTyuotyy80NiHu7nBdoie4axwUy/ChfI1sfg6/0ZM5qw7xG/Seyy8YdQK0mFs/rIXp5cPTHRg1WAZpZhBxiFcj1ju1ZiO768yaaIfz9dgt0UpDM2NAMKNeUYoyAJe9gfMsd4GTrUa76an1KjQqSaHq9+CODHZGEMz+W22+/2zAs+1v8B9aCrFLYcsmnNhHamiIZCSgoW2tlGQuyvgBmYXIyYpff/yEsNaBwZ69FblttUH5UhN9B5sIonex4NaX4NKsW5Rf2HK7NYEc0YPNjCMggPfft4x+Le0FBqn3x0CIeZvb59LVJWDEqPr5Nj9EezCCNwnbBEw62R+M8H2U1CVQ6QbspMypiJgZiYSA1F29fr19OMC6l+cwmz3L1ke2Bi3SswQi6zqxuciBjQbaBCxhj/L23s00MEm3BVB+Eekyej2JrnFp7ToZ7h4a9czqxBD/+73lgqj5zoElarzA/dCH10VqJ81t7m7aIw73KkucAD9dm1hkAPsZQvYCmOvcwzuzmimty4QdKlgVk1J0QeoeWlr9FVyFejCfY2TtSY+P/NvHzoVw8GZc2iVrjTJuICt4SKQ/9fBerye64D5de+woZp2JOWUQAeb9Lf3fcZyaU5a7AVrRqtPuI/4D0M2u8Gy1dL2smMeUIcecMccArz+16LlHWY2Tn0lOsmCVScAwDAGdcOetTTdwkPS3RUdI7Dc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39850400004)(396003)(366004)(346002)(376002)(33656002)(5660300002)(316002)(83380400001)(4326008)(8676002)(66556008)(91956017)(66476007)(8936002)(6916009)(54906003)(36756003)(66946007)(76116006)(64756008)(66446008)(2906002)(41300700001)(71200400001)(6486002)(478600001)(26005)(6512007)(86362001)(186003)(2616005)(53546011)(6506007)(38070700005)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8DB64CB2AA8B724D8E5BCD153137C281@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5871
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	61c4ca99-1d68-4612-542a-08da8f2f906e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cmwRaoHM8dgRlKdtgSZWNZZwrMYXMimWscs8SNCEQXzsQxAPhsSiF+JpiO3uLlHZEGREXjqPWTYGhAlmz4WUrTHpuXcM81UH365NHozFqLzUciWEBoppyooqrib3n3IaTuy6eQ2uQiFqD4RRxYrPS5Fs5h1lLFHU9oH0JpX03OGMxVuAecOcMNFxOlJ84rpqYvainoA8d2Fyj9UKWlZtVQALfFQ1DPId7lg7k0lDeyyHd6lndsgUVaDVAM8/Y2mUyfUkq1datq2bgTa3xciTAsPmHob6ahcbJunHURR3obz1VwVKMt39HBzXB85UTRvata5zkRH+xJ4w+L8fKQ+6LohQ0o33tMSfdTn5Kb5wxL3A6hLiYeEeNYxZfcbudBjTRbbCUX51TKH/uJtbpmCuXd1m2jJHvQwCOorWdXhPmvoXzyKQGIAU3HLyziZiJ5QSk9WIi5AH/MrExcQ3ZoXoQu+3ZpTQACxBRC4IfNLgctvdqvtDEKHtWSdVgvpfQim6FJfc+Yowz1RI1SxEfJgp+9tRCZ5mE28ZUVAvAI4kTAyhejNbqm4xFVdiNu667sLChX8pPe8maroT0Si+TJBgi1SHlWAJHOjdJPFemJyHMoo2/emMbdkFo9opkF39BNd5C6r1Q0AqsK2q4y09mG1m5RR+QFcire8ecBF8r8N7buAeHEI3RMGSnXJVXlo9LdShpwr7k8AXZJHyf1tIim0DZNdi1VPogKYEhmFajRAIYyEaKdcwomzxon3Fvo3XPNWh1nXrJhcRCrAbqK3ctZ4GLA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(40470700004)(36840700001)(46966006)(356005)(2616005)(336012)(47076005)(41300700001)(26005)(6506007)(107886003)(6512007)(53546011)(36860700001)(83380400001)(8936002)(40460700003)(5660300002)(82310400005)(8676002)(40480700001)(6862004)(186003)(4326008)(2906002)(6486002)(478600001)(316002)(54906003)(82740400003)(86362001)(70206006)(70586007)(81166007)(33656002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 11:13:00.5968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8783ff28-5d94-467d-97ca-08da8f2f9831
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7795

Hi Julien,

> On 2 Sep 2022, at 5:20 pm, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 02/09/2022 16:54, Rahul Singh wrote:
>> Hi Julien,
>=20
> Hi Rahul,
>=20
>>> On 2 Sep 2022, at 4:05 pm, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On 02/09/2022 15:51, Bertrand Marquis wrote:
>>>>> On 1 Sep 2022, at 19:15, Julien Grall <julien@xen.org> wrote:
>>>>> AFAIU, it is not possible to have *_xenstore =3D true and *_enhanced =
=3D false. I think it would be clearer if ``dom0less_enhanced`` is turned t=
o an enum with 3 values:
>>>>> - None
>>>>> - NOXENSTORE/BASIC
>>>>> - FULLY_ENHANCED
>>>>>=20
>>>>> If we want to be future proof, I would use a field 'flags' where non-=
zero means enhanced. Each bit would indicate which features of Xen is expos=
ed.
>>>> I think that could be a good solution if we do it this way:
>>>> - define a dom0less feature field and have defines like the following:
>>>> #define DOM0LESS_GNTTAB
>>>> #define DOM0LESS_EVENTCHN
>>>> #define DOM0LESS_XENSTORE >
>>>> - define dom0less enhanced as the right combination:
>>>> #define DOM0LESS_ENHANCED =3D (DOM0LESS_GNTTAB| DOM0LESS_EVENTCHN| DOM=
0LESS_XENSTORE)
>>>=20
>>> I would rather introduce DOM0LESS_ENHANCED_BASIC (or similar) instead o=
f defining a bit for gnttab and evtchn. This will avoid the question of why=
 we are introducing bits for both features but not the hypercall...
>>>=20
>>> As this is an internal interface, it would be easier to modify afterwar=
ds.
>> How about this?
>> /*
>>  * List of possible features for dom0less domUs
>>  *
>>  * DOM0LESS_ENHANCED_BASIC: Xen PV interfaces, including grant-table and
>>  *                                                          evtchn, will=
 be enabled for the VM.
>=20
> Technically, the guest can already use the grant-table and evtchn interfa=
ces. This also reads quite odd to me because "including" doesn't tell what'=
s not enabled. So one could assume Xenstored is also enabled. In fact the w=
ording for ``DOM0LESS_ENHANCED`` is what makes it a lot more confusing.
>=20
> So I would suggest the following wording:
>=20
> "Notify the OS it is running on top of Xen. All the default features but =
Xenstore will be available. Note that an OS *must* not rely on the availabi=
lity of Xen features if this is not set.
> "
>=20
> The wording can be updated once we properly disable event channel/grant t=
able when the flag is not set.
>=20
>>  * DOM0LESS_XENSTORE:              Xenstore will be enabled for the VM.
>=20
> I would make clear this can't be used without the first one.
>=20
>>  * DOM0LESS_ENHANCED:              Xen PV interfaces, including grant-ta=
ble xenstore >   *                                                         =
 and=20
> evtchn, will be enabled for the VM.
>=20
> See above about "PV interfaces". So I would suggest to reword to:
>=20
> "Notify the OS it is running on top of Xen. All the default features (inc=
luding Xenstore) will be available".
>=20
>>  */
>> #define DOM0LESS_ENHANCED_BASIC BIT(0, UL)
>> #define DOM0LESS_XENSTORE       BIT(1, UL)
>=20
> Based on the comment above, I would consider to define DOM0LESS_XENSTORE =
as bit 0 and 1 set.
>=20
>> #define DOM0LESS_ENHANCED       (DOM0LESS_ENHANCED_BASIC | DOM0LESS_XENS=
TORE)
=20
Bertrand and I discussed this again we came to the conclusion that DOM0LESS=
_ENHANCED_BASIC is not
the suitable name as this makes the code unclear and does not correspond to=
 DT settings. We propose this
please let me know your thoughts. =20
=20
/*                                                                         =
    =20
 * List of possible features for dom0less domUs                            =
    =20
 *                                                                         =
    =20
 * DOM0LESS_XENSTORE:		Xenstore will be enabled for the VM. This feature  =
=20
 *                                              	can't be enabled without t=
he DOM0LESS_ENHANCED.    =20
 * DOM0LESS_ENHANCED:       	Notify the OS it is running on top of Xen. All=
 the =20
 *                          				default features (including Xenstore) will =
be      =20
 *                          				available. Note that an OS *must* not rely =
on the  =20
 *                          				availability of Xen features if this is not=
 set.   =20
 */                                                                        =
    =20
#define DOM0LESS_XENSTORE       BIT(0, UL)                                 =
    =20
#define DOM0LESS_ENHANCED       BIT(1,UL)                                  =
    =20
#define DOM0LESS_ENHANCED_FULL  (DOM0LESS_XENSTORE | DOM0LESS_ENHANCED)

Regards,
Rahul=

