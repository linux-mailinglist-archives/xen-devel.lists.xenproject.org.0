Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514B95B30C3
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 09:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403877.646138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWYi8-0005ie-0u; Fri, 09 Sep 2022 07:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403877.646138; Fri, 09 Sep 2022 07:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWYi7-0005fj-TO; Fri, 09 Sep 2022 07:45:59 +0000
Received: by outflank-mailman (input) for mailman id 403877;
 Fri, 09 Sep 2022 07:45:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uksk=ZM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oWYi6-0005fd-Bu
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 07:45:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2076.outbound.protection.outlook.com [40.107.21.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70575b33-3013-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 09:45:56 +0200 (CEST)
Received: from AS4P189CA0008.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::9)
 by VE1PR08MB5805.eurprd08.prod.outlook.com (2603:10a6:800:1aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 07:45:54 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d7:cafe::89) by AS4P189CA0008.outlook.office365.com
 (2603:10a6:20b:5d7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Fri, 9 Sep 2022 07:45:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 07:45:53 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Fri, 09 Sep 2022 07:45:52 +0000
Received: from 131b74ff6a5c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6FDC9709-7DA5-4F34-939F-092243842D3D.1; 
 Fri, 09 Sep 2022 07:45:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 131b74ff6a5c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Sep 2022 07:45:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VE1PR08MB5855.eurprd08.prod.outlook.com (2603:10a6:800:1a2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 07:45:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5612.018; Fri, 9 Sep 2022
 07:45:38 +0000
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
X-Inumbo-ID: 70575b33-3013-11ed-9760-273f2230c3a0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Rfmr+fOP1aA2E0tALu+R9/3FNrgkwMFw3fUoCV0WJ7XCGoBrHA5VhKttjpu0EUBNNgSD9qbLjnBEHMquRXRFcmZva9BRJYu/NZhEzKKZwQBXhfeomA0xM+PEW2Dt+OYN2nChUteeubktcHvjv2t6Tl0vFC2dshxGFQK+RCNZLI97DtCGfnGR3f9DVMB041NgKVSrJbT8Rqu18ABmth8XCfTqEquax7Ghq7zhfBQ1k+HbZXl9/eeuLVusa2eFYHVDinPwOG4LqTCM+pj5SH5o5fWTEqQkDe7LqrB+WLTxU8HbVeGrvgyXo846Mqfc977SCzkT2C+aoLSZMUpE3ntqVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXt4kVSuEpfxHb14MhuNQJPImZ00n0rGtImUxG5RhRQ=;
 b=NMn719LV4FkLhrU7zEr5BuauwSKqEoCSxMPWGM4A0hQ8qCoJ2lYs5qzus3RVriiGgdkYfub/2/UsFvu1PguOqU7+8h+R277Ws/d8wHYXOPlwEgX1MqX3wWGF6iolQ8EeohXrxkOb5wAdRIzEQvF0OCYrBsma6PhFoeiQg5pCLtsa7lZe2mZsy0uyk2NROw1GsGaoqeUqO7rKjWe+tm409PXgPtNWBDjKtRi4X0G9BcNlhYjqQ9KCCsb9toDCzY78SZfLPsn39jP+VxgIqRv/QQUJmKm8RRL/FzJN0z/vsJTA1zeUxga8X7Y+N6570hv5OgAkWO/w2LOGMpjvbxl4mQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXt4kVSuEpfxHb14MhuNQJPImZ00n0rGtImUxG5RhRQ=;
 b=2FB8OOeUAuGXbxg1L1FgAc4gzIVdi7ARhcsDQhMyLCPo9Tvq2M0ms+IZ8bfqa7pAr03oPS+IsOvL+gAEnXqoEaAmubqlp5Tr5b264We7lu5Uzv/Srjyp36l99RxARiMJA/3bOWATZTtD+lTHrBcbSlly9AJYbIr5lb3hrd7QSFw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 32ead1e3471c7cef
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCFdMJo9KAPTnhhZbOwQRa7Y2jgGaBowBTE7XLI81q04TzdZdCCVhXDNRRK+V865z+Z6W0MN7qiAFPGa5FxXIacQ85EU9EKhJ8a+c1V/AYphz36SGDbLEtYKSf5ttjpI+Mlywz5L2eRkz4zxBqk0PvSWPNRt0KvSWf4ZbAMCuA9YtQHhE1DWArjyVerRzDWBvnFMQH0LX+a1UQK1zjpu0dvSeFtKTB8Tufu7gjEdewrGIC7o6r4FkzlIVhAOxTp4pvFqkpmm6zG0Fb/Fbunlf+jxQRRbWIoeAaet38uocGcpAnmefKmEOJ+9cTa8mCdSU0wjWHu1NSl88IIj0BSC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXt4kVSuEpfxHb14MhuNQJPImZ00n0rGtImUxG5RhRQ=;
 b=MKfg5d9cgPGzP7pnefEnmNsPph65P8kqjFzhyDF70VL/pimBEGByUQB1ML3piR2PWXCz33uBRkjinDCOexPuDDWyPBlbOxwL5/DhAqlzFvhXUYZZZlx7sq+mAKGeC/Ik33eaiJ1oba4sAFGgsu3RxKwk17bXU3XDlxvbhQNS3+Cb0GJ+8uSwiQwCwjlpcKOleut8kya2Rq9ml4lam258YgRO9aiwneAMpuEO4MC4qi7pPpL5Xxv2JooPGqyc1Duv6y0GlFMH6JV0qC5ImTHNjrOBDPA/lAxh0KR1mZ/+ACLeBVd20+mkQBHz1omfjQkn/9hE8oKyV5ZCsxQ57FNpxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXt4kVSuEpfxHb14MhuNQJPImZ00n0rGtImUxG5RhRQ=;
 b=2FB8OOeUAuGXbxg1L1FgAc4gzIVdi7ARhcsDQhMyLCPo9Tvq2M0ms+IZ8bfqa7pAr03oPS+IsOvL+gAEnXqoEaAmubqlp5Tr5b264We7lu5Uzv/Srjyp36l99RxARiMJA/3bOWATZTtD+lTHrBcbSlly9AJYbIr5lb3hrd7QSFw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 7/9] xen/arm: create shared memory nodes in guest
 device tree
Thread-Topic: [PATCH v8 7/9] xen/arm: create shared memory nodes in guest
 device tree
Thread-Index: AQHYw4q6erckyWfXI0qMZ5bjaFqTVq3WBmMAgACy1QA=
Date: Fri, 9 Sep 2022 07:45:38 +0000
Message-ID: <0DD9A3DA-4677-46F4-A454-3EAC335443AB@arm.com>
References: <20220908135513.1800511-1-Penny.Zheng@arm.com>
 <20220908135513.1800511-8-Penny.Zheng@arm.com>
 <alpine.DEB.2.22.394.2209081404000.157835@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209081404000.157835@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|VE1PR08MB5855:EE_|VE1EUR03FT059:EE_|VE1PR08MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 929ee10a-2ef9-4834-019a-08da923752b7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UvBCOSwWoGXBIcpC/FnfM7Pb/roEsynOFs+HgDwmFoCuOT/z3SUBlg0eE6TR7zpW0yRL5/zAcLuRQAo+1PP3kOOpuAPh9eHYpszv+sOPKF3tVfMAbMDPljQnsAUSuhpEUznPsSiNcUjtu5Yx2M6oup0+7XRzt5p/AYCZiszMBCEXV0IzEdXg3Yaoa9ElhKyh6ekdVrVnv/SCmJ2MCA+//JthJQv9/rkU8Y1OergCOagGswKiqqagzqQYrcQtS/pHwuBYj9l+4G35/OYtGSLvOTlfRfY3WOJteIiD2w9NAtv1MISOowOFfr844Vup7sxpN7YmVkDuRaE3YsVJe2wtqEEk5ZT0vbgtcKfLlIBjcqPT0VdKO+tB+vfdiG6ByQojm2BQkkMBh/qneE1lqB1/6eVYNzj13VEQndq90St2CeWJ2Qu8Nxu2uWRGR5jLBYR5fhMQgVOSt03nx7mPgIsGgVvRYBz+S8t/4otCMBJIB7QXaM0Q47QUEuwH+BUdUnSlfFY+A+daBtyIvganIiOBfGC2c6NXI7DcqFBaHnbOR8alfrsjPJNZN+0eqZKmH62VS/gI7MLlDmJo+KhdIgSgKZc76Ze8A1EpHPrZi1eKTqABkxjtaNb+UpvPsaZB/dTUus0t9F3RlLGwMdrEmlGOxYgRmrda28uFeIckd4RzArvN5iRaz3m1umD/LM5G0JG/a//fu3glEsHKGu4pe0tgMXdFGjRo96WRq4NJxeoPZEh/geix/4X73EEwox31FL4E3VcSCEId4O9ogjotol+K0KgDFJNhBJbeohFLzZ9pDhM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(38100700002)(86362001)(36756003)(122000001)(4326008)(66446008)(64756008)(76116006)(8676002)(91956017)(66946007)(66476007)(66556008)(38070700005)(33656002)(41300700001)(83380400001)(6512007)(6506007)(26005)(53546011)(478600001)(71200400001)(6486002)(54906003)(6916009)(316002)(186003)(2906002)(2616005)(5660300002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A1462C45E083AA468BF0AEE4D14C46A3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5855
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dbb3c942-86a2-43fe-8d25-08da923749e6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e+vI/e7R2QTz/pgrqgumzNO3fKsqMqPZMr+IOEjU+j/Gaiu7DEaVZRZTEGFJojIOhOW0GpIIZeOHiI837/H2WkgMEeOAWZjA5I5BMXVBUuL4OA/aoFIKo4NWKdquCFfr/Sd7A9jm1qspYMQAtcbJ/13PjsNxO/Ft4YVJfntmjzil3KkysV8556DVlUDtmrNwQwv8Io+qEptiVUT+RYjJ6g50Kw+u3uNkhy+DfD1t5gmxrcm8D3DvYlUvG49RWvVRPmB2amkuzCuaLBaep/0mOUGAtMXjGj/75VN/Z7GjnY1UVBlcyIHfpz2yhjYd0fzoboCRcxMxKgUGobY3UH8jcnpAL9ABSq95F3eoVUaprxRi+t01+WskDGcNIid1e3kKvHU6CYg2HnJBwN24GdZScsYLnNnXXZKYKGBqFojjLn9uL/zz5vNcR92pXSz8N1NwIJdhs+6mpzPurbNbfd5d/vMlC9/fj1FwS4y2g8bZcNsYmPy9Zc8xGhJhamIPR2HCu/UiaLKSyq4EZMzjLelVUjcW+V87WWK+nZE/C5XR6aVBbim83uUxu2F7H9jNdiwWSSLEzy7NpyGVohuH2cgsjrXo1UpRNbVjDpFGLgdTzl9XFtuqkzgSY5M/lpQaXCzSjh887WMFGpbc6GWJkYCyuH9JT9OZ1VBCEoY2yPvNfh2NgaNUIA3C1apQYA+HCHaxR0Lh6PcJ9ThYKbHKqaqoZZArjZC6rfDqm0Y1eG/l5neZix0jPDY9526lmUCfJg8Qo1B52xrpiUzOhZdLxf+BRw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(40470700004)(46966006)(54906003)(82310400005)(83380400001)(86362001)(186003)(316002)(2616005)(336012)(36756003)(36860700001)(47076005)(70586007)(6486002)(107886003)(5660300002)(8936002)(70206006)(356005)(6862004)(478600001)(8676002)(41300700001)(4326008)(40460700003)(40480700001)(82740400003)(81166007)(6512007)(2906002)(26005)(33656002)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 07:45:53.3276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 929ee10a-2ef9-4834-019a-08da923752b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5805

Hi,

> On 8 Sep 2022, at 22:05, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Thu, 8 Sep 2022, Penny Zheng wrote:
>> We expose the shared memory to the domU using the "xen,shared-memory-v1"
>> reserved-memory binding. See
>> Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
>> in Linux for the corresponding device tree binding.
>>=20
>> To save the cost of re-parsing shared memory device tree configuration w=
hen
>> creating shared memory nodes in guest device tree, this commit adds new =
field
>> "shm_mem" to store shm-info per domain.
>>=20
>> For each shared memory region, a range is exposed under
>> the /reserved-memory node as a child node. Each range sub-node is
>> named xen-shmem@<address> and has the following properties:
>> - compatible:
>>        compatible =3D "xen,shared-memory-v1"
>> - reg:
>>        the base guest physical address and size of the shared memory reg=
ion
>> - xen,id:
>>        a string that identifies the shared memory region.
>> - xen,offset: (borrower VMs only)
>>        64 bit integer offset within the owner virtual machine's shared
>>        memory region used for the mapping in the borrower VM.
>> Currently, we provide "xen,offset=3D<0x0>" as a temprary placeholder.
>                                                ^ temporary
>=20
> Another minor style issue below
>=20
>=20
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> ---
>> v8 changes:
>> - Fix missing property "xen,offset" for borrower VMs by temporarily
>> adding "xen,offset=3D<0x0>"
>> - use >=3D to avoid thinking about the overflow case for nr_banks
>> - check the return value of dt_property_read_string() for parsing
>> shm_id
>> - struct meminfo *mem and char resvbuf[16] =3D "reserved-memory" could b=
e
>> const
>> - change "__be32 reg[4]" to "__be32 reg[GUEST_ROOT_ADDRESS_CELLS +
>> GUEST_ROOT_SIZE_CELLS]"
>> ---
>> v7 changes:
>> - allocate reg for worst case addrcells + sizecells
>> - replace assert() with BUG_ON() since it is init code
>> ---
>> v6 change:
>> - change "struct meminfo *mem" to "const struct meminfo *mem"
>> - change "unsigned long i" to "unsigned int i" to match the type of nr_b=
anks.
>> - accroding to the Linux binding, "xen,id" is meant to be a string, not
>> an integer
>> ---
>> v5 change:
>> - no change
>> ---
>> v4 change:
>> - no change
>> ---
>> v3 change:
>> - move field "shm_mem" to kernel_info
>> ---
>> v2 change:
>> - using xzalloc
>> - shm_id should be uint8_t
>> - make reg a local variable
>> - add #address-cells and #size-cells properties
>> - fix alignment
>> ---
>> xen/arch/arm/domain_build.c       | 160 +++++++++++++++++++++++++++++-
>> xen/arch/arm/include/asm/kernel.h |   1 +
>> 2 files changed, 159 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index a10d07266b..cd03370b38 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -914,7 +914,22 @@ static int __init assign_shared_memory(struct domai=
n *d,
>>     return ret;
>> }
>>=20
>> -static int __init process_shm(struct domain *d,
>> +static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
>> +                                            paddr_t start, paddr_t size=
,
>> +                                            const char *shm_id)
>> +{
>> +    if ( kinfo->shm_mem.nr_banks >=3D NR_MEM_BANKS )
>> +        return -ENOMEM;
>> +
>> +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start =3D start;
>> +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size =3D size;
>> +    safe_strcpy(kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id, sh=
m_id);
>> +    kinfo->shm_mem.nr_banks++;
>> +
>> +    return 0;
>> +}
>> +
>> +static int __init process_shm(struct domain *d, struct kernel_info *kin=
fo,
>>                               const struct dt_device_node *node)
>> {
>>     struct dt_device_node *shm_node;
>> @@ -928,6 +943,7 @@ static int __init process_shm(struct domain *d,
>>         int ret =3D 0;
>>         unsigned int i;
>>         const char *role_str;
>> +        const char *shm_id;
>>         bool owner_dom_io =3D true;
>>=20
>>         if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memor=
y-v1") )
>> @@ -972,6 +988,13 @@ static int __init process_shm(struct domain *d,
>>         if ( dt_property_read_string(shm_node, "role", &role_str) =3D=3D=
 0 )
>>             owner_dom_io =3D false;
>>=20
>> +        if ( dt_property_read_string(shm_node, "xen,shm-id", &shm_id) )
>> +        {
>> +            printk("%pd: invalid \"xen,shm-id\" property", d);
>> +            return -EINVAL;
>> +        }
>> +        BUG_ON((strlen(shm_id) <=3D 0) || (strlen(shm_id) >=3D MAX_SHM_=
ID_LENGTH));
>> +
>>         /*
>>          * DOMID_IO is a fake domain and is not described in the Device-=
Tree.
>>          * Therefore when the owner of the shared region is DOMID_IO, we=
 will
>> @@ -999,6 +1022,14 @@ static int __init process_shm(struct domain *d,
>>             if ( ret )
>>                 return ret;
>>         }
>> +
>> +        /*
>> +         * Record static shared memory region info for later setting
>> +         * up shm-node in guest device tree.
>> +         */
>> +        ret =3D append_shm_bank_to_domain(kinfo, gbase, psize, shm_id);
>> +        if ( ret )
>> +            return ret;
>>     }
>>=20
>>     return 0;
>> @@ -1331,6 +1362,126 @@ static int __init make_memory_node(const struct =
domain *d,
>>     return res;
>> }
>>=20
>> +#ifdef CONFIG_STATIC_SHM
>> +static int __init make_shm_memory_node(const struct domain *d,
>> +                                       void *fdt,
>> +                                       int addrcells, int sizecells,
>> +                                       const struct meminfo *mem)
>> +{
>> +    unsigned int i =3D 0;
>> +    int res =3D 0;
>> +
>> +    if ( mem->nr_banks =3D=3D 0 )
>> +        return -ENOENT;
>> +
>> +    /*
>> +     * For each shared memory region, a range is exposed under
>> +     * the /reserved-memory node as a child node. Each range sub-node i=
s
>> +     * named xen-shmem@<address>.
>> +     */
>> +    dt_dprintk("Create xen-shmem node\n");
>> +
>> +    for ( ; i < mem->nr_banks; i++ )
>> +    {
>> +        uint64_t start =3D mem->bank[i].start;
>> +        uint64_t size =3D mem->bank[i].size;
>> +        /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
>> +        char buf[27];
>> +        const char compat[] =3D "xen,shared-memory-v1";
>> +        /* Worst case addrcells + sizecells */
>> +        __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
>> +        __be32 *cells;
>> +        unsigned int len =3D (addrcells + sizecells) * sizeof(__be32);
>> +
>> +        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64, mem->bank[i].st=
art);
>> +        res =3D fdt_begin_node(fdt, buf);
>> +        if ( res )
>> +            return res;
>> +
>> +        res =3D fdt_property(fdt, "compatible", compat, sizeof(compat))=
;
>> +        if ( res )
>> +            return res;
>> +
>> +        cells =3D reg;
>> +        dt_child_set_range(&cells, addrcells, sizecells, start, size);
>> +
>> +        res =3D fdt_property(fdt, "reg", reg, len);
>> +        if ( res )
>> +            return res;
>> +
>> +        dt_dprintk("Shared memory bank %u: %#"PRIx64"->%#"PRIx64"\n",
>> +                   i, start, start + size);
>> +
>> +        res =3D fdt_property_string(fdt, "xen,id", mem->bank[i].shm_id)=
;
>> +        if ( res )
>> +            return res;
>> +
>> +        /* TODO:
>=20
> It should be:
>=20
> /*
> * TODO:
> *
>=20
> I think this is good to go. The two minor style issues could be fixed on
> commit. I haven't committed to give Julien & Bertrand another chance to
> have a look.

I think that it is ok to fix those on commit and I am ok with the rest so:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
>=20
>=20
>> +         * - xen,offset: (borrower VMs only)
>> +         *   64 bit integer offset within the owner virtual machine's s=
hared
>> +         *   memory region used for the mapping in the borrower VM
>> +         */
>> +        res =3D fdt_property_u64(fdt, "xen,offset", 0);
>> +        if ( res )
>> +            return res;
>> +
>> +        res =3D fdt_end_node(fdt);
>> +        if ( res )
>> +            return res;
>> +    }
>> +
>> +    return res;
>> +}
>> +#else
>> +static int __init make_shm_memory_node(const struct domain *d,
>> +                                       void *fdt,
>> +                                       int addrcells, int sizecells,
>> +                                       const struct meminfo *mem)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +}
>> +#endif
>> +
>> +static int __init make_resv_memory_node(const struct domain *d,
>> +                                        void *fdt,
>> +                                        int addrcells, int sizecells,
>> +                                        const struct meminfo *mem)
>> +{
>> +    int res =3D 0;
>> +    /* Placeholder for reserved-memory\0 */
>> +    const char resvbuf[16] =3D "reserved-memory";
>> +
>> +    if ( mem->nr_banks =3D=3D 0 )
>> +        /* No shared memory provided. */
>> +        return 0;
>> +
>> +    dt_dprintk("Create reserved-memory node\n");
>> +
>> +    res =3D fdt_begin_node(fdt, resvbuf);
>> +    if ( res )
>> +        return res;
>> +
>> +    res =3D fdt_property(fdt, "ranges", NULL, 0);
>> +    if ( res )
>> +        return res;
>> +
>> +    res =3D fdt_property_cell(fdt, "#address-cells", addrcells);
>> +    if ( res )
>> +        return res;
>> +
>> +    res =3D fdt_property_cell(fdt, "#size-cells", sizecells);
>> +    if ( res )
>> +        return res;
>> +
>> +    res =3D make_shm_memory_node(d, fdt, addrcells, sizecells, mem);
>> +    if ( res )
>> +        return res;
>> +
>> +    res =3D fdt_end_node(fdt);
>> +
>> +    return res;
>> +}
>> +
>> static int __init add_ext_regions(unsigned long s, unsigned long e, void=
 *data)
>> {
>>     struct meminfo *ext_regions =3D data;
>> @@ -3108,6 +3259,11 @@ static int __init prepare_dtb_domU(struct domain =
*d, struct kernel_info *kinfo)
>>     if ( ret )
>>         goto err;
>>=20
>> +    ret =3D make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
>> +                                &kinfo->shm_mem);
>> +    if ( ret )
>> +        goto err;
>> +
>>     /*
>>      * domain_handle_dtb_bootmodule has to be called before the rest of
>>      * the device tree is generated because it depends on the value of
>> @@ -3484,7 +3640,7 @@ static int __init construct_domU(struct domain *d,
>>         assign_static_memory_11(d, &kinfo, node);
>>=20
>> #ifdef CONFIG_STATIC_SHM
>> -    rc =3D process_shm(d, node);
>> +    rc =3D process_shm(d, &kinfo, node);
>>     if ( rc < 0 )
>>         return rc;
>> #endif
>> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/as=
m/kernel.h
>> index c4dc039b54..2cc506b100 100644
>> --- a/xen/arch/arm/include/asm/kernel.h
>> +++ b/xen/arch/arm/include/asm/kernel.h
>> @@ -19,6 +19,7 @@ struct kernel_info {
>>     void *fdt; /* flat device tree */
>>     paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
>>     struct meminfo mem;
>> +    struct meminfo shm_mem;
>>=20
>>     /* kernel entry point */
>>     paddr_t entry;
>> --=20
>> 2.25.1


