Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AC15B342E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:40:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404066.646391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaUp-0008R6-Ne; Fri, 09 Sep 2022 09:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404066.646391; Fri, 09 Sep 2022 09:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaUp-0008Oy-IS; Fri, 09 Sep 2022 09:40:23 +0000
Received: by outflank-mailman (input) for mailman id 404066;
 Fri, 09 Sep 2022 09:40:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uksk=ZM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oWaUn-0008Mp-VT
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:40:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63260d58-3023-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 11:40:06 +0200 (CEST)
Received: from DB7PR03CA0093.eurprd03.prod.outlook.com (2603:10a6:10:72::34)
 by DB9PR08MB9634.eurprd08.prod.outlook.com (2603:10a6:10:461::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 09:40:19 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::d2) by DB7PR03CA0093.outlook.office365.com
 (2603:10a6:10:72::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19 via Frontend
 Transport; Fri, 9 Sep 2022 09:40:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 09:40:19 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Fri, 09 Sep 2022 09:40:19 +0000
Received: from 135d6e078c0a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1AD8D72B-A131-4FF2-A794-7C83BE4B5B36.1; 
 Fri, 09 Sep 2022 09:40:08 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 135d6e078c0a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Sep 2022 09:40:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6672.eurprd08.prod.outlook.com (2603:10a6:102:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Fri, 9 Sep
 2022 09:40:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5612.018; Fri, 9 Sep 2022
 09:40:06 +0000
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
X-Inumbo-ID: 63260d58-3023-11ed-9760-273f2230c3a0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iPxL6SOvSm2/gU6IU6jNFvS9uBZypQ3sEpL/mZQBhFO7CXNrCVWcWpiQCl1dbSI1X6KnjUi7eIxIu1TdN/nN+g7mgxhEGUxAlm4Hb6eq4huEhRMK2p7stFB+Qf53jqFpU4PLDDAnUN8oWoL5m5WbL967ItiK9jd0hPGbbIELn7DAFpVhrhK/OLC+S4BnHMz3XDv/7m8f50Gn7v1y5pG6VWp5a5xv6Z+oJ3C9JFXBUeArGf2LbwNKs5x83zDop83Jg4Fj0cR5JNNWprV8kts0KkigdmUQU+IF0W8AUbS5lRUHBOUkrLPYxoe1hkaAraYckCQXAW74HboUDWtUL2D1aQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+GUpoA+0IYWwf1mxytoEU/YggCxr4iM9t5BXeRjwvs=;
 b=SZTPg9WAgIlC2VXU1HrAfwovmTwfRzr4L3r6nV7zseOFyMoR40RQzOtTkWDlX+HztyX9cPJE2UK7fuNLE9/IWKw9ulzHsQppZ7OAd8tFTMNk4R0Dbf6AA9H2jIfVF3sDMi7MNW1yHsTzpEFDUFDiTUqccanKEpQBZn3UHEjRze5O4bxdyfDUPDODmxggYdfROYmP6FGzhWTmHsoL7sl776UX+BWst+uyynKGDdMEuaxcFRrSl+m4YY11gAW2FRqbaN1S5U0HqgSpQqr2fs54z/1J3TIaqgFyRL8efBIj++vAqEm4/2mZqU3V6qPyw+bgS5QACP204jDvJWFR8T2Q7w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+GUpoA+0IYWwf1mxytoEU/YggCxr4iM9t5BXeRjwvs=;
 b=7mp1J+thizoeeahT8VqL8qlqrFHNEEYa7dm3LeN7198b6O4jTmFnz4eybP6CC+HvwRJClL/YStqszlO43zqVi4Vb/BYB2tN3WLxXXjmSxQuzmVAkaPSuL6CLZJstC7gHtv+AMiDrszj9a/gnRN2FcyZGyCqZ8BXtQHcKi9lZrvo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 913eb5b7f542c10f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYigJ89/ELgbP54cu5LVq3V0kOVUNMs2fQMgbvC3O4S8ZGdzixo2k+e+kMq1U7x/EhNMIAW5hiyVmFgtRN6wOiN/sng8F5XCypUNKVnLaYRvI533ERNVPjAxD9ThXrP/smr0XdxOeaUj+4XlGA/46gyjsF+9X5sdudYwiAgapBJVaLOcSNFYlm4PV9wD12B0pYukLhq3htbvAPmOFb/IvulGxFqwmKmBQVFofqjLcoxCPJnI1kiWIbAzStqzd4hC/fbiN13nrwujajL13CnS0CbIbJujK01cOIeYhkfMPR0z7Vcz9TEWr2KKXhPFOhlAqG6mMIeeMuhiriiQTSb/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+GUpoA+0IYWwf1mxytoEU/YggCxr4iM9t5BXeRjwvs=;
 b=jFV0qN42ZH6Xg7/vZgeOvoBidhEj1w79UmqhzbT73r7evwsxDVqWBRQ+Lmf+BrH0OGcukGlYWy8+9hwbmi/jSu89jwFMpLbl5gsoxfShwu6egh0QGl4tK7YA2xXbEMXWvHgQ2OtSJ/xNhU1Ey7SFj7FpdlRo/aOFmAOz1ZIcTAiPphjjKhUR5ggs7IyBT72e+g++aJzV2pYw1EbSE6eZ3Psydm1kpMppKrbjTlJsR27AgiUNvmOy1vIuVzmPfc+jKVME6Y4hNqkjArXQlNq78e1j4gndMTX7bXsMOUOE0ndgsbF/g5g+t4suCwKxaos/1535w1wiv/gw/L1f/f3VBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+GUpoA+0IYWwf1mxytoEU/YggCxr4iM9t5BXeRjwvs=;
 b=7mp1J+thizoeeahT8VqL8qlqrFHNEEYa7dm3LeN7198b6O4jTmFnz4eybP6CC+HvwRJClL/YStqszlO43zqVi4Vb/BYB2tN3WLxXXjmSxQuzmVAkaPSuL6CLZJstC7gHtv+AMiDrszj9a/gnRN2FcyZGyCqZ8BXtQHcKi9lZrvo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Penny Zheng
	<Penny.Zheng@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 7/9] xen/arm: create shared memory nodes in guest
 device tree
Thread-Topic: [PATCH v8 7/9] xen/arm: create shared memory nodes in guest
 device tree
Thread-Index: AQHYw4q6erckyWfXI0qMZ5bjaFqTVq3WBmMAgACy1QCAABxvAIAAA4uA
Date: Fri, 9 Sep 2022 09:40:06 +0000
Message-ID: <CE6F0EC6-0DB9-47BE-90DC-09011D308FF2@arm.com>
References: <20220908135513.1800511-1-Penny.Zheng@arm.com>
 <20220908135513.1800511-8-Penny.Zheng@arm.com>
 <alpine.DEB.2.22.394.2209081404000.157835@ubuntu-linux-20-04-desktop>
 <0DD9A3DA-4677-46F4-A454-3EAC335443AB@arm.com>
 <34ae5402-799e-1c43-7ab2-6e8935471cc2@xen.org>
In-Reply-To: <34ae5402-799e-1c43-7ab2-6e8935471cc2@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAXPR08MB6672:EE_|DBAEUR03FT062:EE_|DB9PR08MB9634:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a924c0e-3db4-42c3-501d-08da92474eff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SYcrYfBZ/IbXrCNSeXijloBmevlrPGGOLl9l2fXmfu90y71F2RGHBG3s5Vy9nZvNomjsmrYb649qgPlIdYOmGCZHbMS2FNAshYI4KXc1q2KP8V7n1UsQJXpafkVk8wOyqnQEjq0KsM4Q8YmhGUROZkQg7xmBIjVpMJ9w3LMVxZ++jo2394TTnnUwms03FBhDfzUPs5h9OIOnJaeuc8ECWLCyt1JsZ8y8pz5T6/y7/2OBqK0taLvKPjPUe6CewboVX/DXXzXkkxAIQOfNPzIcZ+38bsExsibsXZSPvTix3orIPORJp5sVKPRAkzAbR0FOlEqiwBw0agZj8WYwrqV5ag9VGpyiwyEcaiBJWqrTvaSHgOW4X+8SoChhGRfV8qVjQL4HMBLdSe5CaHRrLPnjhgU1qoZGk5o2++sRHpoUMm1sATtOckjeVVKq+1ZN2wi1s8LbBLxj84B83SM0F74m4kqrZ8FPqBoPnhPA2b5+TiGxmkDZRhrfY4FEWQTDB7YlElkd25x6WDxIMdopgd4tPZjDNMm2eCMozCNn/00FQjjYR6P0jlHnDlP9ddEc8oxjt1VlPLQx5/AJgWEuIUGI97TGlL8qI6kNK0pxzWk/XtkbJzKI5lPqKegn7V6g19RlrMWUfTo8zaMnHnJVZkwBVTqEJEQNDE+/u0d3RBspgc4FSpRP80H8+9S+bLqmHCwrld6PHKz/kPIQptnjUNzWYypPFeD3QlQJp+oPpuCyR3JqcuNezpxvjsp1vgxpvCCZz2Mk50omdvlkMNC70ejtbfEo347WObZfgU1ZovTkVe8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(6512007)(53546011)(41300700001)(478600001)(71200400001)(26005)(6506007)(6486002)(83380400001)(186003)(2616005)(2906002)(8936002)(5660300002)(316002)(54906003)(6916009)(8676002)(91956017)(66446008)(64756008)(66946007)(76116006)(66476007)(4326008)(66556008)(38100700002)(122000001)(38070700005)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B2D8A365DBC394CA63541C984A3A6B9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6672
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f74936ae-ca96-4d7a-1b9a-08da92474742
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nUi2pAmn7RqooayOckNzIXhr3PeZAzOOlbio3q5/rNQgSb6qMNZGrFQ1Shx4NIqBB1uiHprbqiguP8lC4wN5aE3Oae/gxPnHSSc4TKa7N9EpprIUnqe9qQYfnEMQGi0BDJC1FmK68KkomqD19MaeDpOEww8MI1z0MNrpaZ5VspEuaIdHEvUmQ7mwpaSKt8B49ta26dnTksXRysGhlx0+p2V8iUzSluGsS6ULMVF8WUbTsd8KStS6AWiaqIrzKosD8yBCA/jxcUFx8k/JeAzGyzpVXuV3K83RUtzQgSU/LCEYpxrBdIcgKX/YD/3cGMI3MbDSDLG/ZXVfDGgsxhkNzH+57Ntk1CFs2lt5yMVwAX0C1s+tjomDzPnsYhuLDTl9Kz5hbUFFz4ZmIBBq7a0OL4+54dXDW6Q4a5i6oHREZHTGlS9hcR/SCNoX4jUanWBgYl5NkGffT8EmjaoXsv+Mu5Ca4gO1d9aYR4r4807RrKATzOwHREu+ZE7pvxR/vyjxeO5ON3yGOO2KcID+YV43dSCc91UZJ1SjQ6uWlxqR9UYn0T13KeXg9haG5dVKlY8PNkHGPBHitJNKz51zCWYy/wk5R92CZ+elgch1M50vzBzHrFCsgNVOnwVqWuYipVPwokvwIenE/5D3DKAx5uSoYChsHZDmZoizJiY1XrwghVEVMkpZAUxCqrWHCBHDKULGqxe3DCoNUrvC3Duy51X62FMGSPx7NNm4lbJgspEVJK2ptm2pvU1mG7Tz/82P1v5sJhEGc75q67IWEDMHK6h1Rg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(376002)(136003)(40470700004)(36840700001)(46966006)(82740400003)(40480700001)(8676002)(356005)(36860700001)(316002)(54906003)(4326008)(107886003)(6486002)(41300700001)(70586007)(36756003)(70206006)(478600001)(40460700003)(6512007)(33656002)(6862004)(26005)(83380400001)(5660300002)(6506007)(47076005)(336012)(86362001)(81166007)(53546011)(2906002)(8936002)(186003)(2616005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 09:40:19.1878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a924c0e-3db4-42c3-501d-08da92474eff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9634

SGkgSnVsaWVuLA0KDQo+IE9uIDkgU2VwIDIwMjIsIGF0IDEwOjI3LCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMDkvMDkvMjAyMiAwODo0
NSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+PiANCj4+PiBJdCBzaG91bGQgYmU6DQo+Pj4g
DQo+Pj4gLyoNCj4+PiAqIFRPRE86DQo+Pj4gKg0KPj4+IA0KPj4+IEkgdGhpbmsgdGhpcyBpcyBn
b29kIHRvIGdvLiBUaGUgdHdvIG1pbm9yIHN0eWxlIGlzc3VlcyBjb3VsZCBiZSBmaXhlZCBvbg0K
Pj4+IGNvbW1pdC4gSSBoYXZlbid0IGNvbW1pdHRlZCB0byBnaXZlIEp1bGllbiAmIEJlcnRyYW5k
IGFub3RoZXIgY2hhbmNlIHRvDQo+Pj4gaGF2ZSBhIGxvb2suDQo+PiBJIHRoaW5rIHRoYXQgaXQg
aXMgb2sgdG8gZml4IHRob3NlIG9uIGNvbW1pdCBhbmQgSSBhbSBvayB3aXRoIHRoZSByZXN0IHNv
Og0KPj4gUmV2aWV3ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJt
LmNvbT4NCj4gDQo+IFRoaXMgc2VyaWVzIGRvZXNuJ3QgYnVpbGQgd2l0aG91dCAhQ09ORklHX1NU
QVRJQ19TSE06DQo+IA0KPiAgVVBEICAgICBpbmNsdWRlL3hlbi9jb21waWxlLmgNCj4gWGVuIDQu
MTctdW5zdGFibGUNCj4gbWFrZVsxXTogTm90aGluZyB0byBiZSBkb25lIGZvciBgaW5jbHVkZScu
DQo+IG1ha2VbMV06IGBhcmNoL2FybS9pbmNsdWRlL2FzbS9hc20tb2Zmc2V0cy5oJyBpcyB1cCB0
byBkYXRlLg0KPiAgQ0MgICAgICBjb21tb24vdmVyc2lvbi5vDQo+ICBMRCAgICAgIGNvbW1vbi9i
dWlsdF9pbi5vDQo+ICBDQyAgICAgIGFyY2gvYXJtL2RvbWFpbl9idWlsZC5vDQo+IGFyY2gvYXJt
L2RvbWFpbl9idWlsZC5jOiBJbiBmdW5jdGlvbiDigJhtYWtlX3NobV9tZW1vcnlfbm9kZeKAmToN
Cj4gYXJjaC9hcm0vZG9tYWluX2J1aWxkLmM6MTQ0NToxOiBlcnJvcjogbm8gcmV0dXJuIHN0YXRl
bWVudCBpbiBmdW5jdGlvbiByZXR1cm5pbmcgbm9uLXZvaWQgWy1XZXJyb3I9cmV0dXJuLXR5cGVd
DQo+IH0NCj4gXg0KPiBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycw0K
PiBtYWtlWzJdOiAqKiogW2FyY2gvYXJtL2RvbWFpbl9idWlsZC5vXSBFcnJvciAxDQo+IG1ha2Vb
MV06ICoqKiBbYXJjaC9hcm1dIEVycm9yIDINCj4gbWFrZTogKioqIFt4ZW5dIEVycm9yIDINCj4g
DQo+IFRoaXMgaXMgYmVjYXVzZS4uLg0KPiANCj4+Pj4gKyAgICAgICAgICogLSB4ZW4sb2Zmc2V0
OiAoYm9ycm93ZXIgVk1zIG9ubHkpDQo+Pj4+ICsgICAgICAgICAqICAgNjQgYml0IGludGVnZXIg
b2Zmc2V0IHdpdGhpbiB0aGUgb3duZXIgdmlydHVhbCBtYWNoaW5lJ3Mgc2hhcmVkDQo+Pj4+ICsg
ICAgICAgICAqICAgbWVtb3J5IHJlZ2lvbiB1c2VkIGZvciB0aGUgbWFwcGluZyBpbiB0aGUgYm9y
cm93ZXIgVk0NCj4+Pj4gKyAgICAgICAgICovDQo+Pj4+ICsgICAgICAgIHJlcyA9IGZkdF9wcm9w
ZXJ0eV91NjQoZmR0LCAieGVuLG9mZnNldCIsIDApOw0KPj4+PiArICAgICAgICBpZiAoIHJlcyAp
DQo+Pj4+ICsgICAgICAgICAgICByZXR1cm4gcmVzOw0KPj4+PiArDQo+Pj4+ICsgICAgICAgIHJl
cyA9IGZkdF9lbmRfbm9kZShmZHQpOw0KPj4+PiArICAgICAgICBpZiAoIHJlcyApDQo+Pj4+ICsg
ICAgICAgICAgICByZXR1cm4gcmVzOw0KPj4+PiArICAgIH0NCj4+Pj4gKw0KPj4+PiArICAgIHJl
dHVybiByZXM7DQo+Pj4+ICt9DQo+Pj4+ICsjZWxzZQ0KPj4+PiArc3RhdGljIGludCBfX2luaXQg
bWFrZV9zaG1fbWVtb3J5X25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwNCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmZkdCwNCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBhZGRyY2VsbHMsIGludCBzaXpl
Y2VsbHMsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBzdHJ1Y3QgbWVtaW5mbyAqbWVtKQ0KPj4+PiArew0KPj4+PiArICAgIEFTU0VSVF9VTlJFQUNI
QUJMRSgpOw0KPiANCj4gLi4uIHRoZXJlIGlzIGEgbWlzc2luZyAncmV0dXJuIC1FTk9UU1VQUCcg
aGVyZS4gV2hpbGUgdGhpcyBpcyBzaW1wbGUgZW5vdWdoIHRvIGZpeCwgdGhpcyBpbmRpY2F0ZXMg
dG8gbWUgdGhhdCB0aGlzIHZlcnNpb24gd2FzIG5vdCB0ZXN0ZWQgd2l0aCAhQ09ORklHX1NUQVRJ
Q19TSE0uDQo+IA0KPiBBcyB0aGlzIGlzIHRoZSBkZWZhdWx0IG9wdGlvbiwgSSB3aWxsIG5vdCBj
b21taXQgdW50aWwgSSBnZXQgY29uZmlybWF0aW9uIHRoYXQgc29tZSBzbW9rZSB3YXMgZG9uZS4N
Cg0KVGhpcyBpcyBhIGNhc2Ugb3VyIGludGVybmFsIENJIHNob3VsZCBoYXZlIGdvbmUgdGhyb3Vn
aC4NCkxldCBtZSBjaGVjayBhbmQgY29tZSBiYWNrIHRvIHlvdS4NCg0KUmVnYXJkcw0KQmVydHJh
bmQNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

