Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79982620F9A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 12:56:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440033.694091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osNCy-0005xt-Mk; Tue, 08 Nov 2022 11:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440033.694091; Tue, 08 Nov 2022 11:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osNCy-0005vG-JH; Tue, 08 Nov 2022 11:56:00 +0000
Received: by outflank-mailman (input) for mailman id 440033;
 Tue, 08 Nov 2022 11:55:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RwHN=3I=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1osNCx-0005vA-9s
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 11:55:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e6d701c-5f5c-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 12:55:58 +0100 (CET)
Received: from FR0P281CA0148.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:96::9) by
 DB9PR08MB7723.eurprd08.prod.outlook.com (2603:10a6:10:392::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11; Tue, 8 Nov 2022 11:55:51 +0000
Received: from VI1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:96:cafe::30) by FR0P281CA0148.outlook.office365.com
 (2603:10a6:d10:96::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12 via Frontend
 Transport; Tue, 8 Nov 2022 11:55:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT048.mail.protection.outlook.com (100.127.144.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 11:55:51 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Tue, 08 Nov 2022 11:55:50 +0000
Received: from 0337f39036b3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0399524E-D462-49A0-B3BE-4C6DD6070416.1; 
 Tue, 08 Nov 2022 11:55:38 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0337f39036b3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Nov 2022 11:55:38 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by PAVPR08MB8845.eurprd08.prod.outlook.com (2603:10a6:102:2ff::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 11:55:35 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::a504:d47b:217:4893]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::a504:d47b:217:4893%4]) with mapi id 15.20.5813.011; Tue, 8 Nov 2022
 11:55:35 +0000
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
X-Inumbo-ID: 4e6d701c-5f5c-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hmfRwb9/9UABLOp70w4jZAoUh1xmGYhFJ8OUnfVloOtrh/cjoUy04mafoMtWSN5qsHCOTPri2BeN3ESF958xEoQ1G3GZ5sxx0pprpxEXpfx5jjDC4uldAAWSDpenyvgsK0rRYewCWemRaOoWBw6FeczHkxjMK9aS3k38ovUkr/bhO7erw4LHOxj0dRAWhUHFY1u1z/f1yemFjwJBO/Hy4SxsAT5b1bNwCb+XODfg/gzWuVsVq+1RBaS7yvyfAwDJ1DW/ucMQj+dMovXTohh+3CZGU8wuBT5PYPCTkTWaWQvP5ayxEtZu6n4iKYmwr5FQBGLA7kl3gXv81AaZ/Vnwfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPnmmNcE0q5JSy4R/IM++aACalAYSwaWxYInSHjiE0k=;
 b=NR8T7fYq5Vc4WVUhM0zdAku+eqrhXNhv2cSv91mF/YeUpF7JFWtRxsRabMJm2fb12qo/priDJZabnjucKOPei905bN8HyM15nRsKSOAn5j/zTkTP75xWrguX6TO+6Y8QdF+/7dshEq/9N1NPCLb9zUFv7pCSNl7mgb+avxWd0/T3/CG2sqwrk/DjaZFrwI2Cle+SlM3lo4AcUGwp9GzB4mPJlN+YVk5mHdInkSbEyMe33dI7rzwdxEZ5uMOGM2AH1XvcFOrZkGU97An/cOOQWGjQvncsamGFcqUxPJY+NlWM33yDBxwKuvp3twY6Oh8KaCImnQSd2jWDxjV2yaVI6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPnmmNcE0q5JSy4R/IM++aACalAYSwaWxYInSHjiE0k=;
 b=crVzMP+mMEEl4ZaWzdpgc9UED1ng+/M0tYAdLla9qTH+hZA4M0Tj8M1FIMeVq8nKZx1n3D1GiKqXwIaJ5Atq7oaAPfJOU6MAPhP9qz8Bw/ASP/Kl2qf9ie/l1MH1FhQHMwNfRGI/wV93kUVFR+2/uaC2Eo7dYKZBh06DKbPBssk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 501408f604d410b4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnOMFk4Pd+MMNsUOD/ifnm3QJES1yM0C8p8T1XYm3W7mu5GOcRk7JkKx18t52KqG0sCtcsrksq/IB6G2uBXrQxQJvewKJkabYygb+MbkfpUh7Jhtpev9QmoyIG9qQGEmN3FGDfV9ILvilIz0gWJ4vQa9FLtWW1CWHejpxgULxWO/3m6j9YseoesyNFVvODc1pTHPgz8RbGqPId1xMkIUiGriBU7wwFs0f52q5Em44CDCNns4CQKqN6q8BJNrXBXQa/GP84LvPTQ12vMTuIMzTn85cS5PdXs7shcWTzf7uLq9sn4qddorpVXidlGHknJc5qNomT0+Nh4mGIJRLXnAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPnmmNcE0q5JSy4R/IM++aACalAYSwaWxYInSHjiE0k=;
 b=Yt5Pne/b2BIAHl+cbUe4GPf8Yw+mZ2Vbty/zOxx7+JBF1k2Y3ts4xGJ2G96H43NR1XCnEgSr1sk01w4r3XgMPJt1iWPgweK2cbJPJuHlfhDhG/JugDYvF3uW8PhphbjMqkLnvHW3otOYdFybDCl5vAEc+/17zl8wCtp3ypBv5C1f4VLBcw2LWpDZeUZ/0qqbN312NoQUG0ov0rNVDFxeR4EUQhG5zR4mFy2KvnTumpozNhc7f+XttMT6POcCJ8rKNsm6hnToCVVEZ2VHkqJzxjagaffbt7nZCz4X1c0/Zbhdt4bUu0gmIJTLQIEhmMAcHXkJbytfONB64u07z6Qz8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPnmmNcE0q5JSy4R/IM++aACalAYSwaWxYInSHjiE0k=;
 b=crVzMP+mMEEl4ZaWzdpgc9UED1ng+/M0tYAdLla9qTH+hZA4M0Tj8M1FIMeVq8nKZx1n3D1GiKqXwIaJ5Atq7oaAPfJOU6MAPhP9qz8Bw/ASP/Kl2qf9ie/l1MH1FhQHMwNfRGI/wV93kUVFR+2/uaC2Eo7dYKZBh06DKbPBssk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 4/4] xen: Justify linker script defined symbols in
 include/xen/kernel.h
Thread-Topic: [RFC PATCH 4/4] xen: Justify linker script defined symbols in
 include/xen/kernel.h
Thread-Index:
 AQHY8pZ4QA3C9Pi6Y066NaE9A9ULoK4zWNUAgAABAICAABGdgIAAZ3AAgAEKpoCAAAjCgIAABo0A
Date: Tue, 8 Nov 2022 11:55:35 +0000
Message-ID: <6AAE9AFC-E54A-4C24-BCB0-5C4B84967B20@arm.com>
References: <20221107104739.10404-1-luca.fancellu@arm.com>
 <20221107104739.10404-5-luca.fancellu@arm.com>
 <5caf911d-e96d-39e4-d945-db6537412f60@suse.com>
 <3925276F-8B6E-4B19-9EC2-C085FE88A637@arm.com>
 <933c4227-5839-312e-3996-693a7d8f7706@suse.com>
 <f338e43f-d77d-06e9-ee50-7fc691848bb0@xen.org>
 <5B9130CD-BC40-42E3-8D79-DABC321AFF13@arm.com>
 <d4ceb892-7265-f23f-7785-9368e18edf6e@xen.org>
In-Reply-To: <d4ceb892-7265-f23f-7785-9368e18edf6e@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|PAVPR08MB8845:EE_|VI1EUR03FT048:EE_|DB9PR08MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: db1bdf9d-272b-474c-d03e-08dac1802ee1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0UgBztlhlv9aWh+yj+mFYotRUirOuCeLp/p3o7y194IfZMHaZC3aD34T0c9FIjSJxMnvpR4bLzDRHXRhjrczGeSwef7FzhAkev2ljqL91MN6fLtxq70kXaytZddkZ/IWlGOdbMjs1LVu7I5o53TpO9zitGKGqjpJ0BLnznVIehwa8C7Qy0N+rBTCb/1ComGJ4t1QYvVaJVxS6bSSJPUIWsHv0A+/gd/pvDa0GqouUAIbynKfu/0ndiH/T4Uqvn3YiLWgtgO5PL5QR2gSZXxIyYOotE1eq4gm9dEObWnGT3OejtIpSXb8bt7zi8N7syi32V6SfKqP2G5iTuP0CYBzQy9eREPnoGQRl/V3sjhHINT48vhgT6zTQ1WOWCZWjDb6KwM2u23pVgUlTa/J/29e+2rz9FnXRwqjSCUCD22DRYBuebc3rR0sLqN3ao53mbbWPFYjUTuXViKd7iIcA+VPAkYi2yEZAakrWNeHldvnLMgWlanjZLEPPg173pbIxgZvo8Zx7XOoiQlBU/g+OpuGCa/T2GUB+NN5G0erf6LoLFATo3vogb1x2UVt8mFM/n6iD1KN165t1LW6NPLWCfoeHub8U0444CfHMwenpo4I5V3cBWERxL51nfyFFKm+jzH9OGfZz4hUQEUbGivsDZrDYEykKJGNcNy2MuiKiJF9E1B2B3XM6gAVfXQc7UWORJw4iKYw9pinuYXr//ugA2wdEqFm4DIf2dLIQWHvRp6tSyY/083Bv82JegjMzNtu/yTLdI7ponkO7YYPRfDRfL3JjAZrc0EEyoDuHTWGMobkV/8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199015)(53546011)(6512007)(26005)(186003)(6506007)(122000001)(2906002)(2616005)(316002)(54906003)(91956017)(71200400001)(8936002)(76116006)(6486002)(6916009)(5660300002)(38100700002)(41300700001)(478600001)(66446008)(66556008)(64756008)(66946007)(66476007)(8676002)(4326008)(86362001)(33656002)(36756003)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D303C67233793E48838DB769CD18F664@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8845
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b3969dc-9ffb-42bc-31a8-08dac18025a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D08/fQ8wLOYO7m6C1gq2QTg2aIZcPUE/HMjSO/a3/aux0zxs6pFPbDcM/w6RQ+tNLh8gtti2gVZwD8r2cVuH4tIwQIUGmfGS+x3xyihktcN6ZqF1KlK7DCKYTpiDDP+Jqv2B1By/FVXFMezvnl32VPgYnY3ZKKB5zHqybr1DZXCZDK4ea+MmaOgfXiEoR3OCteCrM5gWCf+wVJL7oF0K4oYUL1x0tUPIcavtbfq+RJNFG5j184QTahQY5rxefjHq5gh9ZTl5F62H4GitX9/yik9kL52gVkqGYBGNO0kkCse7++Hm/KymIoGXgpoRvLB7m9X6LRy1iJaZCKKUZ+jZExH5w4PaikgRyUWQhxX14hCcAFbPbfBrUw15Ml0fXZEp5HjhFLJ78KBQbVDFtyYd9VDsspnLS2qDwirOGinvmQZ9+8BtrG2t2+IDSCKuS/uXHWKY0/ao/INqV2SDHYmAVhjrpmVpeX2LZWMqklzbAvhoXt59VI2pN7RuFHPkhBNUD7tTVnPKYoJ8ucx1nZVGqa12gygFCd40lmBmBqg9mgA+h8ezFeAECjAHAgGH98XOZSdX9c9tAPhlh65vMFvcf1JpnX2y23Me8UQ1PiMUvo72kRBEoGr0v1gxcnrltwmRzBo+Juhvmlrl5BVcwtjl+BLmuBoaWLyVOznpwK0C6OG8oJmlr99bk2pFhXAyJczaGJpLPEKcEjgDfRp8wkbTw4Iq47i1M6unoUzdxH+4NhRGzl/kWnbqLoiq8SCiyFQJFM7WyVr2Ek97/fe1wUrOdg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(86362001)(33656002)(36860700001)(356005)(81166007)(8936002)(5660300002)(6862004)(26005)(2906002)(186003)(2616005)(6512007)(336012)(82740400003)(47076005)(316002)(4326008)(70206006)(70586007)(41300700001)(6486002)(8676002)(82310400005)(54906003)(40480700001)(40460700003)(53546011)(6506007)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 11:55:51.1778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db1bdf9d-272b-474c-d03e-08dac1802ee1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7723



> On 8 Nov 2022, at 11:32, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 08/11/2022 11:00, Luca Fancellu wrote:
>>> On 7 Nov 2022, at 19:06, Julien Grall <julien@xen.org> wrote:
>>>=20
>>>=20
>>>=20
>>> On 07/11/2022 12:56, Jan Beulich wrote:
>>>> On 07.11.2022 12:53, Luca Fancellu wrote:
>>>>>> On 7 Nov 2022, at 11:49, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 07.11.2022 11:47, Luca Fancellu wrote:
>>>>>>> --- a/xen/include/xen/kernel.h
>>>>>>> +++ b/xen/include/xen/kernel.h
>>>>>>> @@ -65,24 +65,28 @@
>>>>>>> 	1;                                      \
>>>>>>> })
>>>>>>>=20
>>>>>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>>>>>> extern char _start[], _end[], start[];
>>>>>>> #define is_kernel(p) ({                         \
>>>>>>>     char *__p =3D (char *)(unsigned long)(p);     \
>>>>>>>     (__p >=3D _start) && (__p < _end);            \
>>>>>>> })
>>>>>>>=20
>>>>>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>>>>>> extern char _stext[], _etext[];
>>>>>>> #define is_kernel_text(p) ({                    \
>>>>>>>     char *__p =3D (char *)(unsigned long)(p);     \
>>>>>>>     (__p >=3D _stext) && (__p < _etext);          \
>>>>>>> })
>>>>>>>=20
>>>>>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>>>>>> extern const char _srodata[], _erodata[];
>>>>>>> #define is_kernel_rodata(p) ({                  \
>>>>>>>     const char *__p =3D (const char *)(unsigned long)(p);     \
>>>>>>>     (__p >=3D _srodata) && (__p < _erodata);      \
>>>>>>> })
>>>>>>>=20
>>>>>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>>>>>> extern char _sinittext[], _einittext[];
>>>>>>> #define is_kernel_inittext(p) ({                \
>>>>>>>     char *__p =3D (char *)(unsigned long)(p);     \
>>>>>>=20
>>>>>> Why the "R8.6" everywhere here? Didn't we agree that the in-code
>>>>>> comments should be tool-agnostic?
>>>>>=20
>>>>> The R8.6 is not tool specific, it is to give the quick hint that we a=
re deviating
>>>>> from MISRA Rule 8.6.
>>>> Well, yes, "tool" was wrong for me to write. Imo references to a speci=
fic
>>>> spec should equally be avoided in in-code comments, as other specs may
>>>> turn up.
>>>=20
>>> +1. The comment duplication is not great and sometimes even a short exp=
lanation it may not fit in 80 characters (AFAICT the justification should b=
e a one line comment).
>>>=20
>> Ok we can remove the R8.6 from the comments, is the remaining part ok?
>=20
> I am afraid no. The comment should only be /* SAF-0-safe */.

Ok I will go for that in the next serie

>=20
> Cheers,
>=20
> --=20
> Julien Grall


