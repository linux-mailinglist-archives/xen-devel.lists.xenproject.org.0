Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4329A55BF23
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 09:30:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356996.585388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o65fJ-0008OB-BU; Tue, 28 Jun 2022 07:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356996.585388; Tue, 28 Jun 2022 07:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o65fJ-0008LW-7n; Tue, 28 Jun 2022 07:29:41 +0000
Received: by outflank-mailman (input) for mailman id 356996;
 Tue, 28 Jun 2022 07:29:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pAZO=XD=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o65fH-0008LO-IC
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 07:29:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10c41068-f6b4-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 09:29:38 +0200 (CEST)
Received: from AM7PR02CA0005.eurprd02.prod.outlook.com (2603:10a6:20b:100::15)
 by GV1PR08MB8107.eurprd08.prod.outlook.com (2603:10a6:150:94::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 07:29:31 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::b3) by AM7PR02CA0005.outlook.office365.com
 (2603:10a6:20b:100::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Tue, 28 Jun 2022 07:29:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 07:29:30 +0000
Received: ("Tessian outbound 5b5a41c043d3:v120");
 Tue, 28 Jun 2022 07:29:30 +0000
Received: from 5d84a693d802.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DBBB24ED-8CAC-41D5-8021-83B239905BFF.1; 
 Tue, 28 Jun 2022 07:29:24 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5d84a693d802.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Jun 2022 07:29:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB8244.eurprd08.prod.outlook.com (2603:10a6:20b:51d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 07:29:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5373.017; Tue, 28 Jun 2022
 07:29:22 +0000
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
X-Inumbo-ID: 10c41068-f6b4-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EmT+NiVruQBaT2VZAu24oTlamV+iEIRcEfldtRKoAxcHXnY6K41853kIzOMMkY2UBa/6IaN21dGW8c4441fN+1I6rwv43lexbTkhJqtOXnccRqYBgfGj38C1N7ToaXyRfxSGR+rSHEWUF2fc3QLQoDpszP3zKh+eK1YHcj5PLXAPuL5YJZ35ZXRyMxPx5xaF9GRm/i0skA/rEFrcz586Vp2DadTkOP9zUQ6Ey2q3ufUMJT2PqXQ1e5cJ9wKXhZuD7OxI2/+WjgBWEB7pzFtKnmVyIxHi4QgXGml/ae4qKOwSIHJIYr/dyGRkbNQTHxLqKVmYvAEkjwsJhvXfBRR3vg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XOUgNQhhdpx8lS4C8GrtRkhs9t6JQRMFzK7XI5APXg=;
 b=RmpmpTxvN2mPxGzfMdh8SnEcAKqaGrwzzaz+nEC0slD+qGSWT2tl3ZGWds+ut1bTz+5NrFZGkuFjBULS1tJdZqMhNKEdc1NhYmuMMAbTEOVg9kVJ6khuqdlJOvFmRP2nqdh3oryZuV/68UEVI+HQJkU0ffDBL3HbBOKCeFXQkclS1OKPNQaBT2T9iOcuHBeRWqf+Pam26+nJaHCZ1cl8zxnFpyrQ9dpTnP996ZDiFXaMzYyDQzQlIzziyDm50l7yxpWB612K3qxaFmOCTrzendcRB39HFEiy2mPKwa3sXANDIbJ202yvhd1prUYXzHov1hlp7MCkm2vKWhAYt7jdsQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XOUgNQhhdpx8lS4C8GrtRkhs9t6JQRMFzK7XI5APXg=;
 b=o+Y/GpnMs4Qd7DgrURJfwnblmzrx9P6c22BcB4oWokcLChBg+Wfe3qKI1Cc/Tev7bsPYw0n+iATViwEwAut55XOp9B7YG92KieDExe9Vsl8AJwYRW+oNxetiTFlsa1crR0XxGSqqp+TGRh4DECwfX0Lfzj0bkt7wYYc4C8SqB9o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5d6f6f73bb43da19
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZ5GSMhLuffUNVYJOBkdmgQdV58RP/awwsEn5Sm4+KF3/wSuV27ZRey4XuowGxvHQFZ+HYloxCc+BEU/k1TD3RLRTy87/9JP9wmIlbuXwAA7oYF84GnqnjIEf32PI7mepfaOGw1/4L4iPBLhjOnGu0a2iLN1vI2YSjMXmyzeGp4/oBqCwyHILi/W0epJ7PFe/efbVJQ/SznlH8LCQvyr6ZqY4dy+ZmWeO9PyE/jicSW0/sJweLjSzv0Q2326WqUmXJbYJKDSrT+6KuJ1CmvDxpeWg/UDZ3/iJTklgLjUwovalCXtmFpQqgEPbB6x75PevbSEENGYUU+zRN0Gs2BeZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XOUgNQhhdpx8lS4C8GrtRkhs9t6JQRMFzK7XI5APXg=;
 b=hv3gxJFUWQ9nz/8Ow9+flKjnHf3cP1D85Y/9Hdg4riZcoh26NpXiJP6D5pzOOgGwA2ys8wJJrzs4SltrBflaYN0AROCV1x+9hC9tnvi+Zagnd58M5iB3uuJW0j15H6nr7SDYatPvj+snPY7ajc0c2sd7lYE8B26aTkdmalY96cGpCCXVuwoTcRXr6t9NoYcAFMY7jgCLW/o5Sc+yaH2BL3p7yxBEYoSvj5/EQER+1H8dn9CoByRlON65nLUZjR+Oi/FQNL+Wa+bx/N9LTmqMFYHnUsrNa3RJRIOlmA79g4ojVdNw1me+PTEbAMKDvTaBBnAn9mREWLGGSlPvcPSKgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XOUgNQhhdpx8lS4C8GrtRkhs9t6JQRMFzK7XI5APXg=;
 b=o+Y/GpnMs4Qd7DgrURJfwnblmzrx9P6c22BcB4oWokcLChBg+Wfe3qKI1Cc/Tev7bsPYw0n+iATViwEwAut55XOp9B7YG92KieDExe9Vsl8AJwYRW+oNxetiTFlsa1crR0XxGSqqp+TGRh4DECwfX0Lfzj0bkt7wYYc4C8SqB9o=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jiamei Xie <Jiamei.Xie@arm.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei
 Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH] xen/arm: avoid extra caclulations when setting vtimer in
 context switch
Thread-Topic: [PATCH] xen/arm: avoid extra caclulations when setting vtimer in
 context switch
Thread-Index: AQHYidHe3XYB0asC1UCP3Ythq1qeCq1jD7IAgAFPFoCAAA8lgA==
Date: Tue, 28 Jun 2022 07:29:21 +0000
Message-ID: <983E3136-4388-4249-90DC-FAFF18BC7724@arm.com>
References: <20220627025809.1985720-1-jiamei.xie@arm.com>
 <cbb7a231-0f61-7170-3fc4-d4ae55398f3a@xen.org>
 <AS8PR08MB76964C46AE16A6CEF6DE221892B89@AS8PR08MB7696.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB76964C46AE16A6CEF6DE221892B89@AS8PR08MB7696.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3f7122f0-3385-4bf7-9dcf-08da58d7f0be
x-ms-traffictypediagnostic:
	AS4PR08MB8244:EE_|AM5EUR03FT050:EE_|GV1PR08MB8107:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VRZvSMRcSDy5cB1JXTzKa+sov7V+mRQg/7ZpImwS8vho0WWknTNKggqLMfjGSl/0i1RowccFb59NJij9oVHw1mtY/SUuaGLWIVrvnpIIfV11mrOyKwjQmCuSrD9M+E1WyAISOqPdow0ZBZ6MnadUisSjCr690vL/feUw+RfjdjjYIxJqnadihSSG/pe1HNTWGwHlzBgbNyeG2/U0HokKkYDwbOnevLwYr+u/UdOKoBEjJrSXHKhmtwx/ZcMH77ElQwrEFs2y33rShR+W/172UVhaR7BVwSZZ8rVkKjmaVAeb8YhRMMihNJ56bP3E8YY99z0+dohbxkyxerGBophlaPOtRXVXdmpmLBF409iCNN0aIaGUE1J5r7W68OL+CVAamw3oZSUyFSSwTW8LSQ/P2kFkeAtslr93MtYTL5F3G4LiWL60Z7nQxCIT86SCM8qDz3VjmFrzBT5ZcxbPKYnwKEmLasZE/Sby+fLxwRfmx2a4UVmiT/0k0xIYQ5GkqvVq1P81KwoS9Et/tozeHkowOXIf6/UP0gTjB+yRJU4E2jK1mzuGevY8TP280UL6AH1C3hbfsP/LeU0i+TLhADjGSgO0+lY4gPi6WQoPTUBWQO6yWd1i9pjSFZzs37PosOS0I+EKKh7unmrtG66frJdqkSLhstNCgRP7/9bGkqsPDVsvZCEi7qv/2fZ3LjZaL2WnwOyQSLqaS5CA3r6GA9GKTzZ8NqXXWtUwFQzMygWt14lBG26N2yJLiBIMUN/9JaW1zbPj2gVuqs2qnVsKRPVwcMmr5qWx1+2E9NqyqV3RLSsYbIF0j5L4XTwqQ6QOGq2M1xa02HsqryntZS5TmHJ28HwsCr8NdJmmTV2CAI6MVdJVVt7N1soFyRnheqoponLr3hgwxLk8phJer2gd2mcGNQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(6512007)(36756003)(66446008)(53546011)(316002)(76116006)(41300700001)(38100700002)(66556008)(64756008)(8936002)(86362001)(2616005)(6486002)(83380400001)(33656002)(26005)(478600001)(6506007)(6862004)(2906002)(6636002)(54906003)(966005)(8676002)(66946007)(71200400001)(38070700005)(91956017)(5660300002)(122000001)(4326008)(186003)(37006003)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B61BCA94FDAE2049AF561893C67CD1F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8244
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	430f288d-6241-48da-ee42-08da58d7eb91
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UVYn7RuhpkLF/k85HNoSF6H3wcGDXBNoOKEl701WlwuIXNlm7g9QzwsrjCcfxZ/OzMcMSXp2IyYWHAohXEvlqQuJM1xMp24slMl4Wo2NNTxx4tbJSVZvt2G/pFRshZe4gDRS+J/HR62hj2xoSxxNNvdj4BBEEVSAM3LSjdqA5OJVjRPrtxdURN7+zbktiD926HLNhz4xK6VeTiDkjJ6HKLRllR8JzdwH+wCTQPUgF71AepBwjlAlJl75LA93b0ygmQyOTMVxv6t4Q9/xTuRoqdL8qhzdPUiX1ISNN9sfd7yOQ9mOcIO+zKwXoKgtbi7umF3i8muxWUjYzWJcbsGPE1Aj+liZconAD/EUJTP6e4p2eExWde8tNKIiHFsyvBKildsZvpe4p/5OJi7IUwiWA7+tFzrLZjGGPz2ctLV8N/W7Biz7xWM1GsM3IQcKnvc9JZJgdqsJ0xN/p+VP7jqd8KvvGH5IUeDNlfPnBWou4+TFNBaWCBPguLcaI8n6Q+8dla8oC/uJraRXUGqy7nPxzC8+KLLJ8g+nNCROaX0X47LtyDBwOv3P92zfVOqAivA6W0KQYTgtw3TpGi2sApqRlQBRFs0dHLK3jQtHLnqLH8rc0GMf4KFAevZjRrX8giDrlEcd3AToIR+u++50dYWJ9Af8DLQN2ZQQZVCUdx0/8d8Hd+aJP0wuKwmYwOtc3mTZRZSxiU2RAf3+0UbtNq6EaudJHJjR9PtHjXb7/tWQaij5BNNcCL2rGPAqUs0EpEe+gjQ+TVFGr7WoEzdW2Po6ZtKKsdJ9XhcP7MUy6htWuqdfnFUoq4w47jMOl5LP0QQYVVwV8JjI9cvTDleRb42/qyTehMTBVm3xWjvwTapP1IE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(376002)(36840700001)(46966006)(40470700004)(2906002)(81166007)(83380400001)(82310400005)(82740400003)(47076005)(186003)(54906003)(40480700001)(336012)(36756003)(5660300002)(40460700003)(36860700001)(33656002)(8936002)(70206006)(2616005)(37006003)(70586007)(6862004)(4326008)(41300700001)(6512007)(8676002)(478600001)(6506007)(356005)(6486002)(966005)(6636002)(86362001)(26005)(316002)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 07:29:30.5802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7122f0-3385-4bf7-9dcf-08da58d7f0be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8107

SGkgSmlhbWVpLA0KDQo+IE9uIDI4IEp1biAyMDIyLCBhdCAwNzozNSwgSmlhbWVpIFhpZSA8Smlh
bWVpLlhpZUBhcm0uY29tPiB3cm90ZToNCj4gDQo+IEhpIEp1bGllbiwNCj4gDQo+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz4NCj4+IFNlbnQ6IDIwMjLlubQ25pyIMjfml6UgMTg6MzYNCj4+IFRvOiBKaWFtZWkgWGllIDxK
aWFtZWkuWGllQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4+IENj
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZCBN
YXJxdWlzDQo+PiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsN
Cj4+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0u
Y29tPg0KPj4gU3ViamVjdDogUmU6IFtQQVRDSF0geGVuL2FybTogYXZvaWQgZXh0cmEgY2FjbHVs
YXRpb25zIHdoZW4gc2V0dGluZyB2dGltZXINCj4+IGluIGNvbnRleHQgc3dpdGNoDQo+PiANCj4+
IEhpIEppYW1pDQo+PiANCj4+IFRpdGxlOiBzL2NhY2x1bGF0aW9ucy9jYWxjdWxhdGlvbnMvDQo+
PiANCj4+IEhvd2V2ZXIsIEkgdGhpbmsgdGhlIHRpdGxlIHNob3VsZCBtZW50aW9uIHRoZSBvdmVy
ZmxvdyByYXRoZXIgdGhhbiB0aGUNCj4+IGV4dHJhIGNhbGN1bGF0aW9ucy4gVGhlIGZvcm1lciBp
cyBtb3JlIGltcG9ydGFudCB0aGUgbGF0dGVyLg0KPj4gDQo+IEkgd2lsbCBjaGFuZ2UgdGhlIHRp
dGxlIHRvICIgeGVuL2FybTogYXZvaWQgb3ZlcmZsb3cgd2hlbiBzZXR0aW5nIHZ0aW1lciBpbiBj
b250ZXh0IHN3aXRjaCINCj4gDQo+PiBPbiAyNy8wNi8yMDIyIDAzOjU4LCBKaWFtZWkgWGllIHdy
b3RlOg0KPj4+IHZpcnRfdnRpbWVyX3NhdmUgaXMgY2FsY3VsYXRpbmcgdGhlIG5ldyB0aW1lIGZv
ciB0aGUgdnRpbWVyIGluOg0KPj4+ICJ2LT5hcmNoLnZpcnRfdGltZXIuY3ZhbCArIHYtPmRvbWFp
bi0+YXJjaC52aXJ0X3RpbWVyX2Jhc2Uub2Zmc2V0DQo+Pj4gLSBib290X2NvdW50Ii4NCj4+PiBJ
biB0aGlzIGZvcm11bGEsICJjdmFsICsgb2Zmc2V0IiBtaWdodCBjYXVzZSB1aW50NjRfdCBvdmVy
Zmxvdy4NCj4+PiBDaGFuZ2luZyBpdCB0byAidi0+ZG9tYWluLT5hcmNoLnZpcnRfdGltZXJfYmFz
ZS5vZmZzZXQgLSBib290X2NvdW50ICsNCj4+PiB2LT5hcmNoLnZpcnRfdGltZXIuY3ZhbCIgY2Fu
IHJlZHVjZSB0aGUgcG9zc2liaWxpdHkgb2Ygb3ZlcmZsb3cNCj4+IA0KPj4gVGhpcyByZWFkIHN0
cmFuZ2UgdG8gbWUuIFdlIHdhbnQgdG8gcmVtb3ZlIHRoZSBvdmVyZmxvdyBjb21wbGV0ZWx5IG5v
dA0KPj4gcmVkdWNpbmcgaXQuIFRoZSBvdmVyZmxvdyBpcyBjb21wbGV0ZWx5IHJlbW92ZWQgYnkg
Y29udmVydGluZyB0aGUNCj4+ICJvZmZzZXQgLSBib3VudF9jb3VudCIgdG8gbnMgdXBmcm9udC4N
Cj4+IA0KPj4gQUZBSUNULCB0aGUgY29tbWl0IG1lc3NhZ2UgZG9lc24ndCBleHBsYWluIHRoYXQu
DQo+IFRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoYXQuIEhvdyBhYm91dCBwdXR0aW5nIHRoZSBj
b21taXQgbWVzc2FnZSBsaWtlIHRoZSBiZWxvdzoNCj4geGVuL2FybTogYXZvaWQgb3ZlcmZsb3cg
d2hlbiBzZXR0aW5nIHZ0aW1lciBpbiBjb250ZXh0IHN3aXRjaA0KPiANCj4gdmlydF92dGltZXJf
c2F2ZSBpcyBjYWxjdWxhdGluZyB0aGUgbmV3IHRpbWUgZm9yIHRoZSB2dGltZXIgaW46DQo+ICJ2
LT5hcmNoLnZpcnRfdGltZXIuY3ZhbCArIHYtPmRvbWFpbi0+YXJjaC52aXJ0X3RpbWVyX2Jhc2Uu
b2Zmc2V0DQo+IC0gYm9vdF9jb3VudCIuDQo+IEluIHRoaXMgZm9ybXVsYSwgImN2YWwgKyBvZmZz
ZXQiIG1pZ2h0IGNhdXNlIHVpbnQ2NF90IG92ZXJmbG93Lg0KPiBDaGFuZ2luZyBpdCB0byAidGlj
a3NfdG9fbnModi0+ZG9tYWluLT5hcmNoLnZpcnRfdGltZXJfYmFzZS5vZmZzZXQgLQ0KPiBib290
X2NvdW50KSArIHRpY2tzX3RvX25zKHYtPmFyY2gudmlydF90aW1lci5jdmFsKSIgY2FuIGF2b2lk
IG92ZXJmbG93LA0KPiBhbmQgInRpY2tzX3RvX25zKGFyY2gudmlydF90aW1lcl9iYXNlLm9mZnNl
dCAtIGJvb3RfY291bnQpIiB3aWxsIGJlDQo+IGFsd2F5cyB0aGUgc2FtZSwgd2hpY2ggaGFzIGJl
ZW4gY2FjdWxhdGVkIGluIGRvbWFpbl92dGltZXJfaW5pdC4NCj4gSW50cm9kdWNlIGEgbmV3IGZp
ZWxkIHZpcnRfdGltZXJfYmFzZS5uYW5vc2Vjb25kcyB0byBzdG9yZSB0aGlzIHZhbHVlDQo+IGZv
ciBhcm0gaW4gc3RydWN0IGFyY2hfZG9tYWluLCBzbyB3ZSBjYW4gdXNlIGl0IGRpcmVjdGx5Lg0K
Pj4gDQo+Pj4gLCBhbmQNCj4+PiAiYXJjaC52aXJ0X3RpbWVyX2Jhc2Uub2Zmc2V0IC0gYm9vdF9j
b3VudCIgd2lsbCBiZSBhbHdheXMgdGhlIHNhbWUsDQo+Pj4gd2hpY2ggaGFzIGJlZW4gY2FjdWxh
dGVkIGluIGRvbWFpbl92dGltZXJfaW5pdC4gSW50cm9kdWNlIGEgbmV3IGZpZWxkDQo+Pj4gdnRp
bWVyX29mZnNldC5uYW5vc2Vjb25kcyB0byBzdG9yZSB0aGlzIHZhbHVlIGZvciBhcm0gaW4gc3Ry
dWN0DQo+Pj4gYXJjaF9kb21haW4sIHNvIHdlIGNhbiB1c2UgaXQgZGlyZWN0bHkgYW5kIGV4dHJh
IGNhY2x1bGF0aW9ucyBjYW4gYmUNCj4+PiBhdm9pZGVkLg0KPj4+IA0KPj4+IFRoaXMgcGF0Y2gg
aXMgZW5saWdodGVuZWQgZnJvbSBbMV0uDQo+Pj4gDQo+Pj4gU2lnbmVkLW9mZi1ieTogSmlhbWVp
IFhpZSA8amlhbWVpLnhpZUBhcm0uY29tPg0KPj4+IA0KPj4+IFsxXSBodHRwczovL3d3dy5tYWls
LWFyY2hpdmUuY29tL3hlbi0NCj4+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnL21zZzEyMzEz
OS5odG0NCj4+IA0KPj4gVGhpcyBsaW5rIGRvZXNuJ3Qgd29yay4gQnV0IEkgd291bGQgcGVyc29u
YWxseSByZW1vdmUgaXQgZnJvbSB0aGUgY29tbWl0DQo+PiBtZXNzYWdlIChvciBhZGQgLS0tKSBi
ZWNhdXNlIGl0IGRvZXNuJ3QgYnJpbmcgdmFsdWUgKHRoaXMgcGF0Y2ggbG9va3MNCj4+IGxpa2Ug
YSB2MiB0byBtZSkuDQo+IFNvcnJ5LCBhICdsJyBpcyBtaXNzaW5nIGF0IHRoZSBlbmQgb2YgdGhl
IGxpbmsuIFRoZSBsaW5rIGlzIGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20veGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnL21zZzEyMzEzOS5odG1sIC4NCj4gSSB3aWxsIHB1dCBpdCBh
ZnRlciAtLS0gaW4gdjMuDQo+PiANCj4+PiAtLS0NCj4+PiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vZG9tYWluLmggfCA0ICsrKysNCj4+PiB4ZW4vYXJjaC9hcm0vdnRpbWVyLmMgfCA2ICsrKyst
LQ0KPj4+IDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
Pj4+IA0KPj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tYWluLmgN
Cj4+IGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2RvbWFpbi5oDQo+Pj4gaW5kZXggZWQ2M2My
YjZmOS4uOTRmZTViNjQ0NCAxMDA2NDQNCj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vZG9tYWluLmgNCj4+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tYWluLmgN
Cj4+PiBAQCAtNzMsNiArNzMsMTAgQEAgc3RydWN0IGFyY2hfZG9tYWluDQo+Pj4gdWludDY0X3Qg
b2Zmc2V0Ow0KPj4+IH0gdmlydF90aW1lcl9iYXNlOw0KPj4+IA0KPj4+ICsgc3RydWN0IHsNCj4+
PiArIGludDY0X3QgbmFub3NlY29uZHM7DQo+PiANCj4+IFRoaXMgc2hvdWxkIGJlIHNfdGltZV90
IHRvIG1hdGNoIHRoZSBhcmd1bWVudCBvZiBzZXRfdGltZXIoKSBhbmQgcmV0dXJuDQo+PiBvZiB0
aWNrc190b19ucygpLg0KPj4gDQo+Pj4gKyB9IHZ0aW1lcl9vZmZzZXQ7DQo+PiANCj4+IFdoeSBh
cmUgeW91IGFkZGluZyBhIG5ldyBzdHJ1Y3R1cmUgcmF0aGVyIHRoYW4gcmUtdXNpbmcgdmlydF90
aW1lcl9iYXNlPw0KPiBTdXJlLCBJJ2xsIGFkZCB0aGlzIGZpZWxkIGluIHZpcnRfdGltZXJfYmFz
ZS4NCj4gc3RydWN0IHsNCj4gdWludDY0X3Qgb2Zmc2V0Ow0KPiBzX3RpbWVfdCBuYW5vc2Vjb25k
czsNCj4gfSB2aXJ0X3RpbWVyX2Jhc2U7DQo+PiANCj4+PiArDQo+Pj4gc3RydWN0IHZnaWNfZGlz
dCB2Z2ljOw0KPj4+IA0KPj4+IHN0cnVjdCB2dWFydCB7DQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS92dGltZXIuYyBiL3hlbi9hcmNoL2FybS92dGltZXIuYw0KPj4+IGluZGV4IDZiNzhm
ZWE3N2QuLjU0MTYxZTVmZWEgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3Z0aW1lci5j
DQo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3Z0aW1lci5jDQo+Pj4gQEAgLTY0LDYgKzY0LDcgQEAg
aW50IGRvbWFpbl92dGltZXJfaW5pdChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QNCj4+IHhlbl9h
cmNoX2RvbWFpbmNvbmZpZyAqY29uZmlnKQ0KPj4+IHsNCj4+PiBkLT5hcmNoLnZpcnRfdGltZXJf
YmFzZS5vZmZzZXQgPSBnZXRfY3ljbGVzKCk7DQo+Pj4gZC0+dGltZV9vZmZzZXQuc2Vjb25kcyA9
IHRpY2tzX3RvX25zKGQtPmFyY2gudmlydF90aW1lcl9iYXNlLm9mZnNldCAtDQo+PiBib290X2Nv
dW50KTsNCj4+PiArIGQtPmFyY2gudnRpbWVyX29mZnNldC5uYW5vc2Vjb25kcyA9IGQtPnRpbWVf
b2Zmc2V0LnNlY29uZHM7DQo+PiANCj4+IEhtbW0uLi4gSSBmaW5kIG9kZCB0byBhc3NpZ24gYSBm
aWVsZCAibmFub3NlY29uZHMiIHRvICJzZWNvbmRzIi4gSSB3b3VsZA0KPj4gc3VnZ2VzdCB0byBy
ZS1vcmRlciBzbyB5b3UgZmlyc3Qgc2V0IG5hbm9zZWNvbmRzIGFuZCB0aGVuIHNldCBzZWNvbmRz
Lg0KPj4gDQo+PiBUaGlzIHdpbGwgbWFrZSBtb3JlIG9idmlvdXMgdGhhdCB0aGlzIGlzIG5vdCBh
IG1pc3Rha2UgYW5kICJzZWNvbmRzIg0KPj4gd2lsbCBiZSBjbG9zZXIgdG8gdGhlIGRvX2Rpdigp
IGJlbG93Lg0KPiBJcyBpdCBvayB0byByZW1vdmUgZG9fZGl2IGFuZCB3cml0ZSBsaWtlIGJlbG93
Pw0KPiBkLT5hcmNoLnZpcnRfdGltZXJfYmFzZS5uYW5vc2Vjb25kcyA9DQo+IHRpY2tzX3RvX25z
KGQtPmFyY2gudmlydF90aW1lcl9iYXNlLm9mZnNldCAtIGJvb3RfY291bnQpOw0KPiBkLT50aW1l
X29mZnNldC5zZWNvbmRzID0gZC0+YXJjaC52aXJ0X3RpbWVyX2Jhc2UubmFub3NlY29uZHMgLw0K
PiAxMDAwMDAwMDAwOw0KDQpUaGUgaW1wbGVtZW50YXRpb24gbXVzdCB1c2UgZG9fZGl2IHRvIHBy
b3Blcmx5IGhhbmRsZSB0aGUgZGl2aXNpb24gZnJvbSBhDQo2NGJpdCBieSBhIDMyYml0IG9uIGFy
bTMyIG90aGVyd2lzZSB0aGUgY29kZSB3aWxsIGJlIGEgbG90IHNsb3dlci4NCg0KQ2hlZXJzDQpC
ZXJ0cmFuZA0KDQo=

