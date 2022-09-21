Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31FC5C01B1
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 17:33:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409840.652821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob1iC-0003Jb-2l; Wed, 21 Sep 2022 15:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409840.652821; Wed, 21 Sep 2022 15:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob1iB-0003Gg-VZ; Wed, 21 Sep 2022 15:32:31 +0000
Received: by outflank-mailman (input) for mailman id 409840;
 Wed, 21 Sep 2022 15:32:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYoM=ZY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ob1iA-0003Ga-EN
 for xen-devel@lists.xenproject.org; Wed, 21 Sep 2022 15:32:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9997fe12-39c2-11ed-9374-c1cf23e5d27e;
 Wed, 21 Sep 2022 17:32:28 +0200 (CEST)
Received: from AS8PR04CA0119.eurprd04.prod.outlook.com (2603:10a6:20b:31e::34)
 by PAXPR08MB7335.eurprd08.prod.outlook.com (2603:10a6:102:220::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 15:32:18 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::d1) by AS8PR04CA0119.outlook.office365.com
 (2603:10a6:20b:31e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16 via Frontend
 Transport; Wed, 21 Sep 2022 15:32:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Wed, 21 Sep 2022 15:32:17 +0000
Received: ("Tessian outbound 0a0431bdcdb4:v124");
 Wed, 21 Sep 2022 15:32:17 +0000
Received: from f2b5ca3ae22a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 48DCA39E-4BF2-4A68-9C4F-FB2787F54250.1; 
 Wed, 21 Sep 2022 15:32:10 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2b5ca3ae22a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Sep 2022 15:32:10 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB8642.eurprd08.prod.outlook.com (2603:10a6:150:83::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 15:32:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 15:32:07 +0000
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
X-Inumbo-ID: 9997fe12-39c2-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Yfplw0K3rSiuC+qPz7xNDPvFHe2qt6GmrKnO1/R3HAubLkTReq2bTXoWc12xaVtNWcXHzau+Tul6CeXrs5yaQAl742CckWztYXAhxL8gI3iSeOlm3JhBXIsl6NYbUhNnjoSiWDFbwzZKczwZkIzVrS+zesx0eagKanNiz5qohdmIt4ueJLOdg6TnaSCVre5ETA6Sk9YZXvc/WdoYl+Q3ZBKvXhAsELQd2ev3LPnVpT/e95zcTDA/yLF9c6mrsKSwZmnqgeiL7AYI/36ZQ+n5/XRX+kmk2+J60sOFjOaMCUVhehbk11QdRlwb1amx5s09jemgS1/8HdLwh5OU8b0ykA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRDo78G4PfJw+4DXqcUnT6xHLfTRuKR5iO8Bj15DWuk=;
 b=FNYHnRU542ztgF+Ek97HW33/vMuCelTnIF70/SFdQcJGrVJRhMUJKKTLyKZmpW471ccmAWyvE+/YLeL90vbWYXj59CnUv4CDx7/+cIaQZLOPeIrWBKucVOlz0x1KY1u2c+ouMNxHFWXHyFgbuWBg3lfbl4xdFV3cK/+NW/MYVp6qgpNN+tcOxKROozBMSlqP3CPpssFlcrKA9525z/Vqlmn1gyYuIwVXG5gq0buVD7LInVqW9pfZm7p9ILrEZIwJRlaQ7KJVzH/RmzFhWsFytpbyyeUY6vBJFoJyEdtuoXF37VZJT09PCW9NgTdwbnqlmWzUJOZzpOc75kS6TR85gw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRDo78G4PfJw+4DXqcUnT6xHLfTRuKR5iO8Bj15DWuk=;
 b=6pFFFp4RJ0q3j5Icg0vdmFW1bGolg3I0bKRBpVIbtOf+I2+sdSZX1SQoMcpIwWSy41J8R2mm+i9zJyDmFt2DGjta8JMS+WZJtVp4J616BEXgLTHoIJNzGjEBoR+/T7iejtieMI0UIfte9TkE9nYi5EZ9P6+pAJ7zM7wGArpsKP8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dcad597ef16742b9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqp7PystVYa/ZKkestB3s5hzsdD7Vcf8QeNWjfWe9CHzyjo8AgBdZdh2eWPveulr9qDlDYMnGwmWC3XO8ysgbmRszB57akxYY4uHbhl9rdmWYneGlfpWN1NeyG39z1y4Ly/OusvkV9bG95C1M00zbKdzUratctLTV6NLGKwai4rz5UyKIyv87tBQtb1FzVAk6diA9z2wtr5pag+3dIyj01cWO2bvKrMgjco5NF+YmbmEnDBSfAMdVV9wCTygBC+s50GldBTo3HAUrnR4DugyJod/EXGk1S2SGwPoc4TIyYxFTZ/qQ5cLq4ykze1nZVNUFrAbSKZbC59CrGNSRl2yBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRDo78G4PfJw+4DXqcUnT6xHLfTRuKR5iO8Bj15DWuk=;
 b=h0Cpb7BavVpCCiUFiDKShJeUEo3sLuIj4nazNEq/konrzOek8bsec+UGUmANbuDkmw8SSzNeg0CIKqD/kr5FXxDavo18ky9EKYoe77yJmB95hCGfqRdjf83MO3MYYmY5eseWU8kaLnyDPLFO4YVXry1+2gCZrhQGxHXEM3FRunDx6P1dHeXQHKjVHj+AqwpKgb9Tl2S++G5zc78iegiiDpkqTkmkZygzp2cq8g42WmBrAF3tJaKPYiPs4mX7zpRvQ51lloAcN+rLGUrKobSHeb22NrZXd0SeYvulkyAv8e1HzTcdVegrGqiKEGEodUkN3hS+Qm1rVd5nRWPDvaqVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRDo78G4PfJw+4DXqcUnT6xHLfTRuKR5iO8Bj15DWuk=;
 b=6pFFFp4RJ0q3j5Icg0vdmFW1bGolg3I0bKRBpVIbtOf+I2+sdSZX1SQoMcpIwWSy41J8R2mm+i9zJyDmFt2DGjta8JMS+WZJtVp4J616BEXgLTHoIJNzGjEBoR+/T7iejtieMI0UIfte9TkE9nYi5EZ9P6+pAJ7zM7wGArpsKP8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] build: correct cppcheck-misra make rule
Thread-Topic: [PATCH v2] build: correct cppcheck-misra make rule
Thread-Index: AQHYxnN181ZyqpP7MEOQ4AIPrjEu+K3qEbaA
Date: Wed, 21 Sep 2022 15:32:07 +0000
Message-ID: <1ABAE409-7419-4F3F-AC7D-EE71AB0ACCD4@arm.com>
References: <bae52ede-aa23-4bba-56ae-1c503625cbe6@suse.com>
In-Reply-To: <bae52ede-aa23-4bba-56ae-1c503625cbe6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV1PR08MB8642:EE_|VE1EUR03FT043:EE_|PAXPR08MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: eb68b2ef-a1ca-437d-88fa-08da9be67794
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zvJQyka/gL+Eduog0Fdz9VNaE78X3zvrM/T73JpEYb1HEdtJedlpipD9tXNDrpIeleV4N3GwDQcrm+LQbjokM+6f92O4lp0TAz8USs0Za93cUR8igXBvsslVq+N9NILJn02z3HQxyxd/w+XBepGpAWmFR+eZw3qN3Wum/V85JjD7eHCUMQtlwFo6zT25APD+s4qKj0ZZagf4217zXuqq9C/DF6bQ+Rm3qOnHkgywCd/RI+fT5qfx0wbFqCbcJ32WQ/xS4vPH/kEFiEpcfRKlNQGsZxK2eJaiSweWd20jHTnnx1Xz76uIjv/69CMaQHsFY8kNRLhc7sxCfHAW3IIcyjPZTG/ihvfP2ZvAhc4u/BfcvvafYYOoeyGaQ/OGYjrDI5s0IGkgIHWsyFWoqs9vuprJ7+5WjR2mAy5hKv0PKLTridgZXu2P/d/s5NlYtyjtMW6yjI1IUWM0mQZ9Oz4Zh14i7SwKvu8fY0876iKp9hkvEI3fTlzLKKzrOa609xMG7j/JQdIesF+L7byNp1O1B2+HDnYZLZxXBBOhC158SwLV7oiwzG3EOK4zdljbR2/gtjez24p6FbY2vSQlkI8o1MyybM4rRSLU+Hws/OsuXGkZGvc4vJWP712DCEuTKnjJZk0F0uowjVVPaxP6nZXSibgyhnnu2iILyDZ7OTJGiWmB8W80bXFZxRjvve59/8gb66unsBXaNlO8oyOx6zSfs0ijE4NcnX0yp2b4p5Cyufp9296rKQKcbPmPJqFV34ietU9quz0fudoAOTrQXMH/izNxpe9asRmPWwk3FpBSg6Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199015)(2906002)(86362001)(38070700005)(122000001)(38100700002)(6486002)(478600001)(41300700001)(71200400001)(83380400001)(66446008)(54906003)(316002)(6916009)(91956017)(4326008)(8676002)(66476007)(64756008)(76116006)(66556008)(8936002)(66946007)(6512007)(26005)(53546011)(5660300002)(6506007)(2616005)(186003)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6C7E9814DC802A4DB16B28107899EB09@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8642
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e66e3f44-c155-4a7a-02c1-08da9be671a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fgqg6801M6vvfubXT4tE+ADoCwQT3KULoQ3nHDQgJ+gRE8tFJeCVLGou9KFKis40XURi8XgBmgIewu2cgLxWx1J5wsuynJHgdKZPxCiN/faTHS4w5oG6iEPu7LVCBNGxcOpJIc6GolcE85r+RZmnPTxCWunXtl8YLqJNzJ/cyJNLN6YOGMjFLfKA59tIPhWRVbHG6cqNJSwkka5z3X9glG7s1UyYyMbqXc09JIBk3iibzsWmHrp8WRekZbm35dTi7Z09UKLRbhH63v4fCyFWwcI3mNS6Zczd8utk4kR+i2UlBJ/Z06FxZPIveBxtCajiEfNNb6UNdluN0xdf6FgamYPj+mCFSoBhRXrW6wzGkRpb1lqnOuUuhyqA8+4MHKILfsnHISVq8kjZetdpu6TAHlCzCIiA/AYuGELfBoJF/3xcyMHyI2lNh21EGNHOBCB7n6Emu2G0v0rj/5mLzEiAmPzdiuw86Q+eqq2iIh2372DaZBdp/yPUQXLUFMD4IjkY6V/zmj0Aea+SxKMHSOesQhhWBvakPmXQ7x4/y12g63yFjc+LaFNZRpV0GyyaDvQWIsVu/p/fEKnAz5qUKadYoYUE63EMuIsNA2AsqqKdfHwzLJEFPpZhISdWDzxhXHsavujR+djdhhcpan8eDtLBLoLfcJCkse0a6QkFRGIKVHB6yKulLT4gka/E1cUZPz8GRHc/nrBcR0Hqld0T67iGz0Qf9JwwvcgJJ5lE/GI5Wm+b4aqZ73WnDA4qOvtbTHlUSbpXVtTltGFeEORyOSPNJQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(2906002)(6512007)(26005)(82740400003)(53546011)(40460700003)(86362001)(5660300002)(47076005)(8676002)(4326008)(316002)(70586007)(33656002)(186003)(36756003)(54906003)(70206006)(6862004)(8936002)(336012)(478600001)(6486002)(356005)(40480700001)(107886003)(6506007)(82310400005)(81166007)(41300700001)(2616005)(36860700001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 15:32:17.6274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb68b2ef-a1ca-437d-88fa-08da9be67794
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7335

Hi Jan,

> On 12 Sep 2022, at 07:46, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Having cppcheck-misra.json depend on cppcheck-misra.txt does not
> properly address the multiple targets problem. If cppcheck-misra.json
> is deleted from the build tree but cppcheck-misra.txt is still there,
> nothing will re-generate cppcheck-misra.json.
>=20
> With GNU make 4.3 or newer we could use the &: grouped target separator,
> but since we support older make as well we need to use some other
> mechanism. Convert the rule to a pattern one (with "cppcheck" kind of
> arbitrarily chosen as the stem), thus making known to make that both
> files are created by a single command invocation. Since, as a result,
> the JSON file is now "intermediate" from make's perspective, prevent it
> being deleted again by making it a prereq of .PRECIOUS.
>=20
> Fixes: 57caa5375321 ("xen: Add MISRA support to cppcheck make rule")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> v2: Add comment. Add Fixes: tag.
> ---
> It has been bothering me for a while that I made a bad suggestion during
> review; I'm sorry for that.
>=20
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -746,11 +746,12 @@ cppcheck-version:
> # documentation file. Also generate a json file with the right arguments =
for
> # cppcheck in json format including the list of rules to ignore.
> #
> -cppcheck-misra.txt: $(XEN_ROOT)/docs/misra/rules.rst $(srctree)/tools/co=
nvert_misra_doc.py
> -	$(Q)$(PYTHON) $(srctree)/tools/convert_misra_doc.py -i $< -o $@ -j $(@:=
.txt=3D.json)
> -
> -# convert_misra_doc is generating both files.
> -cppcheck-misra.json: cppcheck-misra.txt
> +# convert_misra_doc.py, producing both targets at the same time, should =
be
> +# executed only once. Utilize a pattern rule to achieve this effect, wit=
h the
> +# stem kind of arbitrarily chosen to be "cppcheck".
> +.PRECIOUS: %-misra.json
> +%-misra.txt %-misra.json: $(XEN_ROOT)/docs/misra/rules.rst $(srctree)/to=
ols/convert_misra_doc.py
> +	$(Q)$(PYTHON) $(srctree)/tools/convert_misra_doc.py -i $< -o $*-misra.t=
xt -j $*-misra.json
>=20
> # Put this in generated headers this way it is cleaned by include/Makefil=
e
> $(objtree)/include/generated/compiler-def.h:


