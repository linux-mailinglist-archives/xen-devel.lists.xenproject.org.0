Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD40C6058F5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 09:47:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426251.674569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olQHA-0001BL-Ef; Thu, 20 Oct 2022 07:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426251.674569; Thu, 20 Oct 2022 07:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olQHA-00017s-BW; Thu, 20 Oct 2022 07:47:36 +0000
Received: by outflank-mailman (input) for mailman id 426251;
 Thu, 20 Oct 2022 07:47:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvbq=2V=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1olQH8-00017T-WB
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 07:47:35 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2042.outbound.protection.outlook.com [40.107.247.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7544f823-504b-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 09:47:34 +0200 (CEST)
Received: from DB6PR07CA0163.eurprd07.prod.outlook.com (2603:10a6:6:43::17) by
 PA4PR08MB5934.eurprd08.prod.outlook.com (2603:10a6:102:e8::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.35; Thu, 20 Oct 2022 07:47:29 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::5) by DB6PR07CA0163.outlook.office365.com
 (2603:10a6:6:43::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.17 via Frontend
 Transport; Thu, 20 Oct 2022 07:47:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 20 Oct 2022 07:47:29 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Thu, 20 Oct 2022 07:47:29 +0000
Received: from 96a632a00542.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D3D51E56-07EC-425A-B14E-D63DFA3B8583.1; 
 Thu, 20 Oct 2022 07:47:22 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 96a632a00542.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Oct 2022 07:47:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB5665.eurprd08.prod.outlook.com (2603:10a6:20b:1da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 07:47:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5723.035; Thu, 20 Oct 2022
 07:47:20 +0000
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
X-Inumbo-ID: 7544f823-504b-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=G2tPXq+ez6njSrreOuvIuhspYO7G8cTmHHRKzG5uRrdu4Zb4TuWqOfBmPkyloCAANtVhqZBPcExCrdBmMqOMqox0SHA+CY3IHhAZzg3WqoxrRxTFxzYwmcwzD1Mih4BzV61wS+pP3i0iySzUxJNAIIPcXfTCprnhntWsJxIdcLss/K1dlzyq1yqvsDjmFtSubudwJBkKsnio0YSIpFPG/TKZtElr7knO2RIwai2fzWGNv7c/plOUM5OePZF185Q1vMIlz1H0aLkRAxjGew18cLqx6O114OPmR1Rqsp4lAlz6W9mLK3NXarRsCY2KnltkWgTkpeJh3HeCZwLqj2O2RQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/9fjoKKQESXKbjfAlAqcf2n3pNx0eJda1SPUTQJUFk=;
 b=PrKNS9TMKkjOstRPkVjxzkGMoVsrtWbFNK63VSrXuzyf3mFyh3fgHgRAukbTaIeP/tJlfzvlG7hPkfW2OZCV+Q1P7MRdZjV59ps88lsiRvDVzAA3XyXwqwAyXI0jEmX+gOhy6JScmbekcMM7JxjUMMOlI1s6ym1C9teutDtlnkoCR5II8baEysLioCIFUc1RgpsUwaVO4HvjA5C5vnuDpGQ26jtAIMIeMRKCCfjFyvK5ObbI696pYX7URw0dAu8SeZWu9ehx6Qn0D3QMWaITJiYInDKDplyHZkXk/zCfWu++3k7LM+xdm0IRLBLgLrJUb0bk2yJLV8v0+iFf0JF2Ag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/9fjoKKQESXKbjfAlAqcf2n3pNx0eJda1SPUTQJUFk=;
 b=o6iJNDHft2wEbLP+dXOtRNcRwq2GENsHCnGEoEXhU2dXWsgsP8K+m9HM6HPN0xpr6NeL/WGjBiSR2M002ss9O2qo6uPvr/v7YLtYh5UQKGcdQhrSN9+KxtGrB2IZnCRAXrsuwdjMJJed+TUlj40uQs/nsmOPHFtIBxEdRWgJjZk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 51d1f9afc0eecefc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+vNj4jqGgpefreX3r/dP6rYSoPUlFMpM6p4DTgZ4RVy7Vh43Q14/pcZjHF16LgKZiorp+SpGvTtAGXckEmDo7oEm5z9P2vj6AROsN2Z/HwFUP8KG7syAw4io5uUBLngJsBp32iOyQAAp2s/T35q1HYsk/eHRFzbQNsemxs2zkH34rJqgABzSORkMQGj8lOdZvl/wGh5kRUyfCj1SBrYhKb5QG7s+DZAcYoTZdz2mtyN9s1c1GusGc+p4hyPwvF+z5OjsOvUKjQdvLECCAj+IM0xnIqzuEDZA4ht3w4Gczl3SnyU2NpMVh6GFoCfLfVxYr9h6uH7NE+MAnBlek17ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/9fjoKKQESXKbjfAlAqcf2n3pNx0eJda1SPUTQJUFk=;
 b=mBVoe+zV+UYQdCuj8qC8WL76FzwffxBW9ZlE2OOftF/XMcYRwOzINYizQXVH8+SCEYwOZ7zaLj8QOwzx7R7F9obzdsIugB5x0QKK/mPGJzI2jctybj/bJmqM81iO7ybnPyaw2ET5WW5c/AO6PKiq9UMRXSoXUqpbCyMWZYEpeQ8sXnOV/KJxb1xe8Oodmyk6CsfLGVNfQ3D3RD3vBy0HH77wxnVhW3Pu7zerbATyGs+qsjSdhHwz/+H8y7lFUjV3DQEWilg2uCsLCzHibIAGWclKyNFwg+jXUnxc1JCB673t2W0bPOl9MrJsW/whyhP3KKj24H/0IN3/evOQA4SJHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/9fjoKKQESXKbjfAlAqcf2n3pNx0eJda1SPUTQJUFk=;
 b=o6iJNDHft2wEbLP+dXOtRNcRwq2GENsHCnGEoEXhU2dXWsgsP8K+m9HM6HPN0xpr6NeL/WGjBiSR2M002ss9O2qo6uPvr/v7YLtYh5UQKGcdQhrSN9+KxtGrB2IZnCRAXrsuwdjMJJed+TUlj40uQs/nsmOPHFtIBxEdRWgJjZk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in
 p2m_init()
Thread-Topic: [PATCH v5 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in
 p2m_init()
Thread-Index: AQHY4v1UNTDexmHkFU+TbVAEitUu+q4W6mIA
Date: Thu, 20 Oct 2022 07:47:20 +0000
Message-ID: <DD601A86-C7C6-42AF-965F-A9759245E241@arm.com>
References: <20221018142346.52272-1-Henry.Wang@arm.com>
 <20221018142346.52272-3-Henry.Wang@arm.com>
In-Reply-To: <20221018142346.52272-3-Henry.Wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM8PR08MB5665:EE_|DBAEUR03FT010:EE_|PA4PR08MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 071f54ec-7999-4b25-0d3d-08dab26f56b0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FUSgC85CRKgZuLzyztp7J/LPPeT0XZgbS6KwtTeq2cXj5lD723/8ebuV93d9gyBXKLxHdE6iYlrsbv6KHsdu/OSzf8qDFNf1Oxu9A46sb5lWoVkp/VvkWeAXMVh0IuuWeaof3bz2d9ZGTA9n/FUBaIXcTK1zQqFcB7L7g/6QyNszQ0lg68x7UwV7l5p6OR2qpHLmUCA/XpkQCIyR0RPS19e9CD+SyxhiXJBWL+lBLRJubdD8suxAqwkvy+PCnmKBTVs5dRfL8v4K8o5IVaN9SIyaQqCAHo+DjZAnrjUFs8v5Ia/GNILtze3e0POCCenqBbCGx6F84yBUbgHV5+wHX9+BvPrMTztMlEGr3zqgGG/GDFcmn37CutoPWAl+mNRqi4ff5jYevS6NrwO/qnbcTzYKQeqa53hQCzINBBhvd85sF1i3XtI2Xb5LddLb78ZWOBLx1/fjIzJfZyf+oMdKc5ZGqZD0hw5nH6ISTLzIEel8xnE6Oy6AJtBOvVGOdsTzCKx5+iF4Ev4AOWabDKKlt2jQdxjEeFyTxazus3BpWV6mTMjITlbZivbsbYYClC4dzA3bwPTJYxLGPmDOePgcv0vmg1R3McYFBW5E0yl+Lqkedk9nia1NV1UeLTYTZYAdIY3DqmR0DbpGW2/qBr3VViPSOOfaomQ6R4YMbqOQLg/JTkmglziUsPJ5qBLfVmymz8yXsDNxVyUjWcxjH7Xn0fLRPPw2FL0QZSnFsghmTHxwT+YhnVds3k3l+Q+GQqqtpotFqydhSxvqVLjOgVOdgUMmvQKi948oMecSQbeLvkw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199015)(36756003)(86362001)(33656002)(122000001)(66476007)(37006003)(41300700001)(66556008)(38100700002)(66446008)(66946007)(2616005)(38070700005)(83380400001)(64756008)(6506007)(186003)(478600001)(5660300002)(53546011)(2906002)(316002)(76116006)(6636002)(6862004)(91956017)(8676002)(4326008)(8936002)(6486002)(26005)(71200400001)(54906003)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <35185F8B985F714BBB43DDAC8740045F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5665
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0246be49-fe8e-4d20-26aa-08dab26f51cb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KaTaWP8CN0XbafEofCVXcqXFKqKlV9MS7zvM7iQvLIr0rf4nJNuro9dlO7tKY8fFaOb2j4xOl+ZkbhPGYZ4Stsr1DklxDgd1XTihymEOYYtAiG/MUypNehLEYr/4Qe0y3ZaRDL3Ef0tp2sLp9+oP/jYIDr8a2karUSYp30/hMHkoC4NT/uRWmdEvcKax0noA4vcZb8UIWLzv6BI8olZQRtkr8IdV8iYNNmK4V/dNyOt4bu9ZPcUig+F/WlijskRYHFmOGRPjljKeUFRa888OsqQDawrMwzekr39yMd0G8Apu09+Z6nG229/CiMZTpyH9+xzpigZoBm671Wai+qU59hWG51ztpC6E1dUsncYIx1V2bCEMEhrkp6ELrwoGY+nbX1TawR0UWcoMujRtczMErbHJgTO9AY8UNFeU1IbiIUfM4G4d9H7qNENCHVztaW6ulapA0v/jq8MyMt7TXz7syt4iF0vZ+r3Mcy135oEUCikd/hiJJsd62MNea/Up2cf937323m49sw2/sBbFZJde1PQkMZ6grvLKNeBcTALP9qlQXwqt71+EW3YQJrXW/tciTyj221/wzdEX6Z7DNquZc3G3c0ki7otK1FyB1rjO90uTFdk/xCKhu2vnrB+gVc1dR5r5xRVbKA49kGdSM2NfXS3A92RB+Xc3L4uClK/dPEWdfpuMUzqsFD6fNdFJZZg14zpFSn6XZH06AP4hM2Fm2xsBexpvRdGulj2CyRTCGxxJspfiOAGThKdqHBGQxTJH9FCZaX0937EGQl4DBciUcA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199015)(36840700001)(40470700004)(46966006)(2616005)(336012)(107886003)(186003)(6512007)(53546011)(26005)(6506007)(36860700001)(83380400001)(2906002)(40460700003)(40480700001)(5660300002)(47076005)(6862004)(82310400005)(316002)(478600001)(6486002)(70206006)(8936002)(41300700001)(37006003)(70586007)(4326008)(8676002)(6636002)(54906003)(33656002)(36756003)(86362001)(82740400003)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 07:47:29.1838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 071f54ec-7999-4b25-0d3d-08dab26f56b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5934

Hi Henry,

> On 18 Oct 2022, at 15:23, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
> when the domain is created. Considering the worst case of page tables
> which requires 6 P2M pages as the two pages will be consecutive but not
> necessarily in the same L3 page table and keep a buffer, populate 16
> pages as the default value to the P2M pages pool in p2m_init() at the
> domain creation stage to satisfy the GICv2 requirement. For GICv3, the
> above-mentioned P2M mapping is not necessary, but since the allocated
> 16 pages here would not be lost, hence populate these pages
> unconditionally.
>=20
> With the default 16 P2M pages populated, there would be a case that
> failures would happen in the domain creation with P2M pages already in
> use. To properly free the P2M for this case, firstly support the
> optionally preemption of p2m_teardown(), then call p2m_teardown() and
> p2m_set_allocation(d, 0, NULL) non-preemptively in p2m_final_teardown().
> As non-preemptive p2m_teardown() should only return 0, use a
> BUG_ON to confirm that.
>=20
> Since p2m_final_teardown() is called either after
> domain_relinquish_resources() where relinquish_p2m_mapping() has been
> called, or from failure path of domain_create()/arch_domain_create()
> where mappings that require p2m_put_l3_page() should never be created,
> relinquish_p2m_mapping() is not added in p2m_final_teardown(), add
> in-code comments to refer this.
>=20
> Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M p=
ool")
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> This should also be backported to 4.13, 4.14, 4.15 and 4.16.
> v5 changes:
> - Rebase on top of Andrew's patch, update commit message accordingly.
> v4 changes:
> - Move the initial population of 16 default pages to the end of
>  p2m_init(), add if(rc) return rc; after p2m_alloc_table()
> v3 changes:
> - Move the population of default pages to p2m_init().
> - Use a loop over p2m_teardown_allocation() to implement the
>  non-preemptive p2m_teardown_allocation() and avoid open-coding.
> - Reorder assertions in p2m_final_teardown().
> - Add p2m_teardown() will always return 0 if called non-preemptively in
>  doc, move the page_list_empty(&p2m->pages) check to p2m_teardown()
>  and use a BUG_ON to confirm p2m_teardown() will return 0 in
>  p2m_final_teardown().
> - Add a comment in p2m_final_teardown() to mention relinquish_p2m_mapping=
()
>  does not need to be called, also update commit message.
> v2 changes:
> - Move the p2m_set_allocation(d, 0, NULL); to p2m_final_teardown().
> - Support optionally preemption of p2m_teardown(), and make the calling o=
f
>  p2m_teardown() preemptively when relinquish the resources, non-preemptiv=
ely
>  in p2m_final_teardown().
> - Refactor the error handling to make the code use less spin_unlock.
> - Explain the worst case of page tables and the unconditional population
>  of pages in commit message.
> - Mention the unconditional population of pages in in-code comment.
> ---
> xen/arch/arm/domain.c          |  2 +-
> xen/arch/arm/include/asm/p2m.h | 14 ++++++++++----
> xen/arch/arm/p2m.c             | 34 ++++++++++++++++++++++++++++++++--
> 3 files changed, 43 insertions(+), 7 deletions(-)
>=20
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 2c84e6dbbb..38e22f12af 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -1064,7 +1064,7 @@ int domain_relinquish_resources(struct domain *d)
>             return ret;
>=20
>     PROGRESS(p2m):
> -        ret =3D p2m_teardown(d);
> +        ret =3D p2m_teardown(d, true);
>         if ( ret )
>             return ret;
>=20
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2=
m.h
> index 42bfd548c4..c8f14d13c2 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -194,14 +194,18 @@ int p2m_init(struct domain *d);
>=20
> /*
>  * The P2M resources are freed in two parts:
> - *  - p2m_teardown() will be called when relinquish the resources. It
> - *    will free large resources (e.g. intermediate page-tables) that
> - *    requires preemption.
> + *  - p2m_teardown() will be called preemptively when relinquish the
> + *    resources, in which case it will free large resources (e.g. interm=
ediate
> + *    page-tables) that requires preemption.
>  *  - p2m_final_teardown() will be called when domain struct is been
>  *    freed. This *cannot* be preempted and therefore one small
>  *    resources should be freed here.
> + *  Note that p2m_final_teardown() will also call p2m_teardown(), to pro=
perly
> + *  free the P2M when failures happen in the domain creation with P2M pa=
ges
> + *  already in use. In this case p2m_teardown() is called non-preemptive=
ly and
> + *  p2m_teardown() will always return 0.
>  */
> -int p2m_teardown(struct domain *d);
> +int p2m_teardown(struct domain *d, bool allow_preemption);
> void p2m_final_teardown(struct domain *d);
>=20
> /*
> @@ -266,6 +270,8 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn=
,
> /*
>  * Direct set a p2m entry: only for use by the P2M code.
>  * The P2M write lock should be taken.
> + * TODO: Add a check in __p2m_set_entry() to avoid creating a mapping in
> + * arch_domain_create() that requires p2m_put_l3_page() to be called.
>  */
> int p2m_set_entry(struct p2m_domain *p2m,
>                   gfn_t sgfn,
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 6826f63150..00d05bb708 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1685,7 +1685,7 @@ static void p2m_free_vmid(struct domain *d)
>     spin_unlock(&vmid_alloc_lock);
> }
>=20
> -int p2m_teardown(struct domain *d)
> +int p2m_teardown(struct domain *d, bool allow_preemption)
> {
>     struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
>     unsigned long count =3D 0;
> @@ -1693,6 +1693,9 @@ int p2m_teardown(struct domain *d)
>     unsigned int i;
>     int rc =3D 0;
>=20
> +    if ( page_list_empty(&p2m->pages) )
> +        return 0;
> +
>     p2m_write_lock(p2m);
>=20
>     /*
> @@ -1716,7 +1719,7 @@ int p2m_teardown(struct domain *d)
>         p2m_free_page(p2m->domain, pg);
>         count++;
>         /* Arbitrarily preempt every 512 iterations */
> -        if ( !(count % 512) && hypercall_preempt_check() )
> +        if ( allow_preemption && !(count % 512) && hypercall_preempt_che=
ck() )
>         {
>             rc =3D -ERESTART;
>             break;
> @@ -1736,7 +1739,20 @@ void p2m_final_teardown(struct domain *d)
>     if ( !p2m->domain )
>         return;
>=20
> +    /*
> +     * No need to call relinquish_p2m_mapping() here because
> +     * p2m_final_teardown() is called either after domain_relinquish_res=
ources()
> +     * where relinquish_p2m_mapping() has been called, or from failure p=
ath of
> +     * domain_create()/arch_domain_create() where mappings that require
> +     * p2m_put_l3_page() should never be created. For the latter case, a=
lso see
> +     * comment on top of the p2m_set_entry() for more info.
> +     */
> +
> +    BUG_ON(p2m_teardown(d, false));
>     ASSERT(page_list_empty(&p2m->pages));
> +
> +    while ( p2m_teardown_allocation(d) =3D=3D -ERESTART )
> +        continue; /* No preemption support here */
>     ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
>=20
>     if ( p2m->root )
> @@ -1803,6 +1819,20 @@ int p2m_init(struct domain *d)
>     if ( rc )
>         return rc;
>=20
> +    /*
> +     * Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 a=
rea
> +     * when the domain is created. Considering the worst case for page
> +     * tables and keep a buffer, populate 16 pages to the P2M pages pool=
 here.
> +     * For GICv3, the above-mentioned P2M mapping is not necessary, but =
since
> +     * the allocated 16 pages here would not be lost, hence populate the=
se
> +     * pages unconditionally.
> +     */
> +    spin_lock(&d->arch.paging.lock);
> +    rc =3D p2m_set_allocation(d, 16, NULL);
> +    spin_unlock(&d->arch.paging.lock);
> +    if ( rc )
> +        return rc;
> +
>     return 0;
> }
>=20
> --=20
> 2.17.1
>=20


