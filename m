Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF08E554BE7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 15:56:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353915.580917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o40ps-00056J-6y; Wed, 22 Jun 2022 13:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353915.580917; Wed, 22 Jun 2022 13:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o40ps-00053X-43; Wed, 22 Jun 2022 13:56:00 +0000
Received: by outflank-mailman (input) for mailman id 353915;
 Wed, 22 Jun 2022 13:55:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UqP7=W5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o40pq-00053R-Q2
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 13:55:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80044.outbound.protection.outlook.com [40.107.8.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09fe9f7a-f233-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 15:55:57 +0200 (CEST)
Received: from AS9PR06CA0479.eurprd06.prod.outlook.com (2603:10a6:20b:49a::28)
 by AM8PR08MB5697.eurprd08.prod.outlook.com (2603:10a6:20b:1d7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 22 Jun
 2022 13:55:53 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49a:cafe::72) by AS9PR06CA0479.outlook.office365.com
 (2603:10a6:20b:49a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Wed, 22 Jun 2022 13:55:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 22 Jun 2022 13:55:52 +0000
Received: ("Tessian outbound ff2e13d26e0f:v120");
 Wed, 22 Jun 2022 13:55:52 +0000
Received: from b5220959366a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2BE71F05-76EF-4A20-B053-711B6C953C62.1; 
 Wed, 22 Jun 2022 13:55:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b5220959366a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Jun 2022 13:55:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM4PR0802MB2355.eurprd08.prod.outlook.com (2603:10a6:200:60::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 22 Jun
 2022 13:55:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 13:55:44 +0000
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
X-Inumbo-ID: 09fe9f7a-f233-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lUX1B/1h11NPbPpAgpIDcCHUZ9JNHo4Alzei4JwNj02KYUSvlAZDFbJdxXG8g9ItgOXzJz63QRETownE6Y5WarmpUJ6Fgv2XF54uBJq3Br0tepRdl3HXDHrCQWoe7qdVLoqeNriaeNgdLZKPZeBt+9uTBqXfI2d9k/IoowC8NHW4dQ2AK1q9iUAuhCtxClOL5RTMo+klU1uUJPRpK8YIC/0MahvQuwrzYokeeEOUsPKTCwux2sKVmO2SIbP44sq9TxH2xWy0yJC7P+GO52aSuF4A8duVFomQKjVOcbljqdd75/ALYAa7dxyEyobkCaEZX2OdLdhIBj9+mAkGK9wPrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjlE6dYPhNAj0yRoH4imen+v3vVsAivOZq1XwC5ITtE=;
 b=a3DUmxFgyQyci6v4O7XzmqyLEU28tHE43aRD9VjIYi5ZdBNNdkBCF8yTEN0Ea+YcgAEe7qZvT5UuvnlrZd9GxoFo2Ybdeh7Yy60qw+QVl/ejusWAl0LL1TRC5QEO8SvcvfEGBNiWIJ+eZD0OMDzPVjzcZ2yNUdLfPnHLOVUmkHho242Sd7HD40d4lE6KW2aa/HXScPkXvwTIZUtlFBrieffImdDsj1HZJslT27VbIex/Y+WPADZnhNKdrdgbQ7Ei/gSDgwtmEPK0p9hB4UiHl6RgjrwONpy7rDw94XAGOTHrZkfgHIGsoaJPJxXrKSCXKr7hwghlazqpvjSBDtq0vg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjlE6dYPhNAj0yRoH4imen+v3vVsAivOZq1XwC5ITtE=;
 b=kdaRgjiFhqWN7T82dSnah7UgI9ChS6SqL1MdaFYY+X6gyVDaYliKjwr/jII+itgSagtYlVCj25x8bCHJLUIjJtdzFaquF8Dw4hQn6aZeT52tBvHOk5giZ+N2SihxegXGR86AfXooDIIP0QYslc9Wfk8W7xtpw6Lpw0ecGhEZVHY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ab74deaa781876ae
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgWg/DAFY/31kwl6JGRUmHrI+ABeg4Bf9ltiIQxwOervf8aB/EeznLoG0soy5AB6ceie5pqxrsTg8OuQQBJK5qI9WhzQrGQm76Cqr/npl/z/Wp9ojDPps93VXvgB16UlQitTmgkki82PaBF+8dxCYCs2PoYZHqyiddBAiUZtXNmJ/PCWeOmdnnVKq5lsqMJv4KwNEGQmaSJYQJhFsJaOr8ufCNPdGw1bpZbjlVad+P4l/xNh/AXDdnXK9mJQ/GBuGOUhfIngStnxKh8HvbB0YyzbHTx8qKrTNH71gneH2XmH2KyVj9ViPjtw6PwtaqgsFj8l6vCR0nNgWnEmx1EwFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjlE6dYPhNAj0yRoH4imen+v3vVsAivOZq1XwC5ITtE=;
 b=g2JhfwC6DI/EZxVJ5GINVOjF/7vVmUaoUk/2XIwd6lmNXxVj+KZahve7Gnjw19AG7+shzbouHLr7FRTxitzsUo+QBDpmp6zaSECgnoL71qWzfbrUdaReHoioJDLTMm7rN5vxhahigsXtAl+J36ZGLZRPzLcqA5XAleKukg0NELajCXC2JtfmPYLwxselNbdPhSBwtJVrp5rnhHGxQiD+L2TAcJtehQz4JRrWQrZcHh0jIJJkFGMZWvwbVt2+6yxAtG0ZLU4QfSuB157ChkxeufdvScnI1q3iMc8FcWhYgV/FXHPafYlTeDgtxzR4ReW426/qBmbFtLoOdWPUiMfstQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjlE6dYPhNAj0yRoH4imen+v3vVsAivOZq1XwC5ITtE=;
 b=kdaRgjiFhqWN7T82dSnah7UgI9ChS6SqL1MdaFYY+X6gyVDaYliKjwr/jII+itgSagtYlVCj25x8bCHJLUIjJtdzFaquF8Dw4hQn6aZeT52tBvHOk5giZ+N2SihxegXGR86AfXooDIIP0QYslc9Wfk8W7xtpw6Lpw0ecGhEZVHY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Michal Orzel <Michal.Orzel@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/9] MISRA C 2012 8.1 rule fixes
Thread-Topic: [PATCH 0/9] MISRA C 2012 8.1 rule fixes
Thread-Index: AQHYhHPRZL4o3B5WdE6OPtXA3biXiq1bO8sAgAAqE4CAAAG+gIAADwQA
Date: Wed, 22 Jun 2022 13:55:44 +0000
Message-ID: <C45BA6EE-6294-4C6F-ADC4-3DE7C8DA866F@arm.com>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <dd016e82-2480-0e1e-6286-18b2f677dd65@suse.com>
 <74ec2158-3d19-3b2c-1e8c-fb5b30267658@arm.com>
 <d91bb4ea-41be-225e-e2fe-1b03aa06c677@suse.com>
In-Reply-To: <d91bb4ea-41be-225e-e2fe-1b03aa06c677@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5fc8957c-55d6-413d-50d6-08da5456ec03
x-ms-traffictypediagnostic:
	AM4PR0802MB2355:EE_|AM5EUR03FT007:EE_|AM8PR08MB5697:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB56973E7313AF986B9787DAA09DB29@AM8PR08MB5697.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3XefAYPpoY05KXW22pyaq8Io0aortkhotak+G0keugt4bB1LASxBOrYtbUj1gUWTJRd0T/OIn/tGaj39RREVE0iuuVKi5gcdGq88774gb5p0+If5aX+mZrvp6qegPLjQHZ+iMw3ua9oxa7HzyZsq81qqDFsc5uSeOjCF3mDvY1+SCUAAw5rX9mht9TVHYe9XgOFrPah4rQ4A2SuZabj6qZbBoOBiDa3pvnvHf9IV3pCNUseGa4o23lTh2DUWRwawigtzu4TbjBG7Ptn9AIlJl7mFCel791ifdgJglXMuTH84tpVP0TUNWsT/uXJzYQojVOvzfE/6KJWkQuetECyfhxrZwPfRPDmwNHJLwVjxxJHgWAsisZlQ2/wCb+ytwajrh4jg7rzEjCw5eYYPF/1/uqkKb+NnuA0uMgWxhxsdRqP5cxnaFJ7vYsd5Wdr2LKLc5yox4lgoAYqJfOhE9+ylEZGcgr9gbZ7hOt2ZlFcsiP6j8GcIrPn/FBRkeSoy7y0r/tpyX376cVX1+JlS+9tdlhQ1zRcSLh5DmdHrgZt01oWFKRT8vx1ecQfoOtuaCpRRWfA5tHUKRK4eRODYGHXD4qlktZI7fELki6LT1lA8SflnJsqsI5mU48uPkKHyF/qY/3ss21zfLlAUCssA38oZm6DhgBcaPk9toICL11flzb3ShRliTVEw7Kx1O3nVpuiko4KLGY/hqpElw74qMloUi1XdwO5UeYMA30eQ358yOJ4AX2w8HNhbgnqRRfV00DIKYR4YKlsJmyLojWAqaWoNofDjmF+YBctyM3yDJVIEvjc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(186003)(36756003)(66446008)(2616005)(76116006)(71200400001)(478600001)(64756008)(8676002)(33656002)(66476007)(66556008)(7416002)(6486002)(66946007)(53546011)(83380400001)(6506007)(38070700005)(8936002)(316002)(41300700001)(38100700002)(26005)(122000001)(5660300002)(91956017)(2906002)(6916009)(54906003)(6512007)(86362001)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ABB91CA44D040343A31882CB17526891@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2355
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e5f529c6-f34d-4f3f-1589-08da5456e6f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	liPXEJjAYbAg3uAs2GIB8z75rILuCDV9lCMGY9C65mezlv7CiQePRG2m4+ldHBB6lQkrgLRTTFrxdjBAoApFYcOV+bcAM28tNF7N4kyofOz3oM+s5JwCh/TksgDe2Sqf4T+GHGabvhmuI4Jf6X01P4PKddTvG/Cfo3+BFR0xr155+QilBn6VeoBMMnKXtkEe8sm27P5fkxfT6h1Fy6QUyrh0NsdrjDictzs321okBCS97ryN5YlgWq+pWPO5cQ9kyDByZ8bnHhq1t1NwUt9UiikMVm8QttuFVufA+ke17op+CHBdhYZKDVCoL1SmTuoA1yIY2Zb3Rd1WHU6folcf25Df4QxKLef/V+AQUI2IqXzuD0InHie97YQY9LfhN968Cgaqgbc5M6+cRcWo8G9mHrfbDo+GDggHopsZTpySoEew0eqDD6+m5VlW8nSQ7wScH5kQSSTgXZXgv/zyTW4/qpSWoeoxTgh0Ob64JY/JC9FcvghSHUF0PJvu60f3T4cOmcKyp9idYwKJRw7wYKcPDyNSQdbAwd+0iDVP84tTtwHaqqDPDYrTSGtnfqMTgztmiWxSxvlj6RWCWul6rpqJ17YyS+wz1aa3tRp0zu4fynx+7z+ZPyV/LIRJb6OgObiqnX2H9y7YlXRtPdvLj8qiYPOt8e3qeq/ixoIuDZKt+2KFoqJsXVA47pPtKrew+sG2SYOXye7clN2J6p9gOuLGDagJvN8LEoIqye35tRVhhqka/5E3vBLhNUnexHd9wwTE52QVfYWezFfxQUxdg0T5ug==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(376002)(39860400002)(40470700004)(46966006)(36840700001)(4326008)(6486002)(26005)(86362001)(6512007)(336012)(70586007)(70206006)(47076005)(2616005)(33656002)(83380400001)(8676002)(53546011)(2906002)(82310400005)(478600001)(186003)(40460700003)(6506007)(8936002)(41300700001)(5660300002)(6862004)(36860700001)(82740400003)(54906003)(36756003)(316002)(40480700001)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 13:55:52.9282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc8957c-55d6-413d-50d6-08da5456ec03
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5697

Hi Jan,

> On 22 Jun 2022, at 14:01, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 22.06.2022 14:55, Michal Orzel wrote:
>> On 22.06.2022 12:25, Jan Beulich wrote:
>>> On 20.06.2022 09:02, Michal Orzel wrote:
>>>> This series fixes all the findings for MISRA C 2012 8.1 rule, reported=
 by
>>>> cppcheck 2.7 with misra addon, for Arm (arm32/arm64 - target allyescon=
fig).
>>>> Fixing this rule comes down to replacing implicit 'unsigned' with expl=
icit
>>>> 'unsigned int' type as there are no other violations being part of tha=
t rule
>>>> in the Xen codebase.
>>>=20
>>> I'm puzzled, I have to admit. While I agree with all the examples in th=
e
>>> doc, I notice that there's no instance of "signed" or "unsigned" there.
>>> Which matches my understanding that "unsigned" and "signed" on their ow=
n
>>> (just like "long") are proper types, and hence the omission of "int"
>>> there is not an "omission of an explicit type".
>>>=20
>> Cppcheck was choosed as a tool for MISRA checking and it is considering =
it as a violation.
>=20
> Which by no means indicates that the tool pointing out something as a
> violation actually is one.
>=20
>> It treats unsigned as an implicit type. You can see this flag in cppchec=
k source code:
>>=20
>> "fIsImplicitInt          =3D (1U << 31),   // Is "int" token implicitly =
added?"
>=20
> Neither the name of the variable nor the comment clarify that this is abo=
ut
> the specific case of "unsigned". As said there's also the fact that they
> don't appear to point out the lack of "int" when seeing plain "long" (or
> "long long"). I fully agree that "extern x;" or "const y;" lack explicit
> "int".

I am a bit puzzled here trying to understand what you actually want here.

Do you suggest the change is ok but you are not ok with the fact that is fl=
agged
as MISRA fix even though cppcheck is saying otherwise ?

Bertrand


