Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 955E5559915
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 14:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355480.583161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4i1B-00078v-PV; Fri, 24 Jun 2022 12:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355480.583161; Fri, 24 Jun 2022 12:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4i1B-000779-ME; Fri, 24 Jun 2022 12:02:33 +0000
Received: by outflank-mailman (input) for mailman id 355480;
 Fri, 24 Jun 2022 12:02:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CwSF=W7=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1o4i19-000773-M5
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 12:02:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85a77ce8-f3b5-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 14:02:30 +0200 (CEST)
Received: from AS9PR0301CA0036.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::14) by AM8PR08MB5761.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 12:02:05 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::71) by AS9PR0301CA0036.outlook.office365.com
 (2603:10a6:20b:469::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Fri, 24 Jun 2022 12:02:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:02:05 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Fri, 24 Jun 2022 12:02:05 +0000
Received: from fc5a2c89d6ef.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8CC24479-B46E-4E48-9BB5-D2C08778F8B0.1; 
 Fri, 24 Jun 2022 12:01:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fc5a2c89d6ef.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Jun 2022 12:01:58 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM6PR08MB3992.eurprd08.prod.outlook.com (2603:10a6:20b:a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 12:01:56 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 12:01:56 +0000
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
X-Inumbo-ID: 85a77ce8-f3b5-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OMMOtuHJE1JkuYl77yrA+O57DDZCTw9z5W+gk2S+w3hTcs1Ll49ThYC0EKJV+mDI0Yz07RPeHsOP+BxQfxtITgyDjMnFR3u9vck7f9QrR0oVgTTMm8l7hJlxic6jG/PsjAGoGVy+nRjAvEJ5SSFRrWpG7+ihGy+vwXFHiyYZTWkgWiI/qJ6WRmKNqGNrBe8OjtWqqFK2lqwgY4xYPHaE6sVUVTa6Sos6qhtuTE7EvTmjvBFja/8XAQ0FKaJIIZgY/pi/yEIHVZuGRPCWUfGQmCPdI8yEBLTQ2ORHJ5QHL4b4I5tVw6HpH7Xm4aS8XZo5KUpo9zjNOZAJIodPAYRJ3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jd8//NOB/wkSRvn3P02c9SAujR4bW0+bEv8An+j39g=;
 b=Juv1i2nFd8aRyWI3pYYlY3W6N/ritwrj2MJmogBZe05/m2+XLhR1JYfOrmv8/N2AgCytWcjJ8cq3H5stTmg1Qjk0UZBO+Qt45BU2QsploUYdNhLxxDu6kjRJhrMHu2jb3aPJEHLZ74BtvXUjYryqn+vOQWy1ljHT5URLH4KCkgvFYZ/VVNdRIjPcPnGN+zA/x2xz46ku3+ImtkoXliBx3owgAMx4FdIctkr+BmcTQHEFswXzJrPKpooOv9ZtSccCpIahlLcfFOjeptOEl77E+RLfoMydPBELXF9pzDKJ7MS/dmNy8jdIOfBPlVLpiXfhBVj/Xo3mLksvWwtu47W0eQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jd8//NOB/wkSRvn3P02c9SAujR4bW0+bEv8An+j39g=;
 b=2anxpS1PlrpGlj4Jbw6Y3rL/sbgrorCyV0vrt1khYU8mZ2ulAukfqdjHOxtJIcYRyG+OD7VTiXERqLa1eX8UnS3RG6OqJNlVs3NGbEsrgRkglHlU3GmgLpT+pZ6ovM1nUBiGrwebbf5k/H+phb4eHwN6W8sSnWDhIE3PqCTWfts=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8de32a8313e73a71
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ew5lWkZ9yaH1+6W5g8RrbOG4KEzX+IK8povoTQDWxHhPnmp5LwYALEy4vp804iwt/a0XISdYgyS+8Xg76ZWSKpVgY9Qkb5J1n+SgB3aokD11kxi5+v/Y4OjX+xQh/cuUx1pP8IGxCqG20tp1g8ur4nqonCc8qIYY45pNB5TNM211N0bf/+26rtZdqvw7h8rXTZD3Cf48rloA/8e1YfXw0Nj+lGxj5lthszC1Sh8Erob97MBUpHhBe3yHNr/89AO8W7GInocn1wvylTDlW/A1fsD3PUb87zejvvYmJ8GSJ0Bop9SjP6YayDWLkR7zM2LblhG+cK8GLjosfWttJNksQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jd8//NOB/wkSRvn3P02c9SAujR4bW0+bEv8An+j39g=;
 b=f0t3lFusfjVdCbPyK2nPwhV+ZDAe4PVKhZfiVcdHxe5alpl/7DVaoltu4SuZ0u0WElQ2HziuxJw0el9ShjC2v3sBQqOalY5V3r19xj6p+o2H+hH12Yw8/3Y1VkfQPzRLD9wIMj234ONY050KV5Qr7iqYVGwcfwvccL4zT3PV2B8r8qFNw3x1nCiU7c9mfIPAfXjp6lq6rzlgAhxUyps98FZspY+OpWZRfC9gP71AYEYiN5SJImlWdBIoNB7A98ltg9naDRy4VNyjOMYCW4iWnveGfKVwDV4dRqpyU+WbuupLTzx/hCV++CmgGFGVKKsjISldUXJiTp8s98aKWBM/bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jd8//NOB/wkSRvn3P02c9SAujR4bW0+bEv8An+j39g=;
 b=2anxpS1PlrpGlj4Jbw6Y3rL/sbgrorCyV0vrt1khYU8mZ2ulAukfqdjHOxtJIcYRyG+OD7VTiXERqLa1eX8UnS3RG6OqJNlVs3NGbEsrgRkglHlU3GmgLpT+pZ6ovM1nUBiGrwebbf5k/H+phb4eHwN6W8sSnWDhIE3PqCTWfts=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH] docs/misra: Add instructions for cppcheck
Thread-Topic: [PATCH] docs/misra: Add instructions for cppcheck
Thread-Index: AQHYh7nJHM8+T3fZ/0Gr0RGCgDxGeq1eaYGAgAALcIA=
Date: Fri, 24 Jun 2022 12:01:55 +0000
Message-ID: <15F23829-3693-47CC-A9D6-3D7A3B44EB64@arm.com>
References: <20220624105311.21057-1-luca.fancellu@arm.com>
 <692d09fa-5513-132a-6b5b-4bc62e46a443@xen.org>
In-Reply-To: <692d09fa-5513-132a-6b5b-4bc62e46a443@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: be4f7cda-d4c9-4a29-e266-08da55d95b5c
x-ms-traffictypediagnostic:
	AM6PR08MB3992:EE_|AM5EUR03FT056:EE_|AM8PR08MB5761:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bsg5as5t+ikukSEt59nZ77hssicLjdoyHoQbz3puEfE07QNaOPXsSaAvMf/oVilT5btPgd9GTZji8UVcQ1RGqXTw2XK4b9zpuLmgSERZNy6VjjLlAR5Y3lGHr5+CpR4LgVoeuV1vVZTQRlbTePbIDiEZ8vIzNiNU1IcpKHz+1GhlGMhCvpWWQKyh8AY9dxv3cyUEGuC7UbM6wyJg+2hEBGwhtLedpJfmGzB7HRCPo0URoDewe3xCEgwQjW7CBSRHSw1MXKmBA6oaTYmOdloST4WR5/y0Zv+TNVB+l/4R8P6VcNdAvvLZ35ZNvTVpS3IYoDE4nWWKeeMLyq+Kc3ITueAY5o6pP1e6mZpgIa9BCLGLvjcwmwiEbSCFFKnVjiHh3nCYzUehQcUfVbqNGyYFRvHtOwuAULsv4PSOVhgJrFutfDHiaSouu4GYj/1su/PGBRhcgjPxR197YLOZEzzFeDfHt3pkfEeeFrICLCy3s/qTrWwHJw7//g80AaPpu3q+iTAXf5Et9BfF4mU1/+52jjlOeN4Zv936Tbh0mCs2WKCI6TmgWqB74m+oHaBBj11Zwvs2bfiyxL6hS2glJuDdffkMHw22jhNX7RFm3XKyxUCeJSPHBBRrkJ1CyF3fz/HBWbTj+xYCl9+0SpDK2ZdXT0T5niREzqC8CzU3NYOjyQX6TQN0YdfWnrTffTqulbQauioB3JDSvc3S7j+Bh365OjYKTHsIgJZnHmVVZNiRncmc78JtgRhycfIVScpiD2Zr1K1v8da+XnpPas/3AMDHmdJYevy3MFFLxlBzftT/fnOWEAV4WeQbQA3KTeSnrdZhu9OOftIzvfZx5P2wpwtCzioDCW7VYCLbN69qm529PeIJnTtuBjRWXid7LLEzdHJiVzDpfzE3qkbhbFc/Zig0MA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(41300700001)(26005)(6512007)(86362001)(38070700005)(6486002)(122000001)(38100700002)(2616005)(186003)(33656002)(8676002)(6506007)(66556008)(4326008)(66446008)(66476007)(316002)(76116006)(5660300002)(83380400001)(54906003)(36756003)(8936002)(71200400001)(2906002)(6916009)(64756008)(91956017)(478600001)(66946007)(966005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE574BDAF919594C8497C66708B5CD9C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3992
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d5370780-772d-4b08-1abd-08da55d955ae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e7uja1bi0+pTDhMgXu2WmiJO82GChobCCRJg1CnrtmqyOaCvOmnuodLOtpprQmTW26OZ0/aWuglqwmnwKb96HnCE1/OM7OWb7n3jC2PBLDz91jBA6E+pnttndvZ0r7efa4uzRYGKVmNllR17jPojCGsJaN4PHrpcbfdgAPuqQQmYgaB1IybLef+w+EfsmM+QvRWcVdcqu8YLZTxw3LXrG5OrrCTevsgr2Le7nbP24zhgpjyp7gSAzcRh4jK/ld2bUnYeQS3BK5G+o6cPkLZIduiEdRm01I6qrbdDC6F5z2L/kAFedlVcRV0FCB+JEGmVj1fjtuNii5HfaL+iNKiJ+VL2fZv3RwuieiKEb5o3x//wd55BfZ0VABgnmRSsJixs1LOG5wlb/3VNmKbFhCQup7Qto0JjRb4Yi8dFmD9kiBpYXTICQ1csqAVEw/ThwUyXG1jCeBISqTUcMQTExImaREBUXlPBumGBqwiLSp9evKXkEC1uvcBW8JhUKkyS5Bwg1t2NswT1n/hlzJdYVME9fdfaa4NXZJ9RrkeFyvyjF33xwVfNDDPcRFwT8kk34SJJB06BwhYlwiFLnfC7mQQmhLSRYa63hDxVHQrhgGHlhTA55yhwaFEoyEddU6wmRRdhwx5AFZoxLEyKpgBMMwsCvpAAMjmf2lH0hJ0WLftPzi0AUcIa+YDcfcumudwpeQRC6U+K6LLvogvAarSzFV21AjLEYUxeJlAzBjpI3HRu3mtyo8KJt9rBPSXry5SObGdf+i/nqVrhkh3mJRbS/OE1Ft+4YKdFVB79iWhBxjsSnFwqa15uaw/i4zP21p/OZbFSi/Hv/+cgEi4h+2Olcp23ukO1PEcRmBN3lS8QYsQiKtLXUXbf7S75QU5o3Cco+8PP
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(376002)(136003)(40470700004)(46966006)(36840700001)(5660300002)(86362001)(6862004)(8936002)(82310400005)(36756003)(36860700001)(2906002)(54906003)(70586007)(70206006)(4326008)(8676002)(40460700003)(316002)(33656002)(40480700001)(6486002)(966005)(356005)(82740400003)(6506007)(81166007)(478600001)(336012)(47076005)(186003)(26005)(6512007)(41300700001)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:02:05.4800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be4f7cda-d4c9-4a29-e266-08da55d95b5c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

SGkgSnVsaWVuLA0KDQo+PiArRmlyc3QgcmVjb21tZW5kYXRpb24gaXMgdG8gdXNlIGV4YWN0bHkg
dGhlIHNhbWUgdmVyc2lvbiBpbiB0aGlzIHBhZ2UgYW5kIHByb3ZpZGUNCj4+ICt0aGUgc2FtZSBv
cHRpb24gdG8gdGhlIGJ1aWxkIHN5c3RlbSwgc28gdGhhdCBldmVyeSBYZW4gZGV2ZWxvcGVyIGNh
biByZXByb2R1Y2UNCj4+ICt0aGUgc2FtZSBmaW5kaW5ncy4NCj4gDQo+IEkgYW0gbm90IHN1cmUg
SSBhZ3JlZS4gSSB0aGluayBpdCBpcyBnb29kIHRoYXQgZWFjaCBkZXZlbG9wcGVyIHVzZSB0aGVp
ciBvd24gdmVyc2lvbiAoc28gbG9uZyBpdCBpcyBzdXBwb3J0ZWQpLCBzbyB0aGV5IG1heSBiZSBh
YmxlIHRvIGZpbmQgaXNzdWVzIHRoYXQgbWF5IG5vdCBhcHBlYXIgd2l0aCAyLjcuDQoNClllcyBJ
IHVuZGVyc3RhbmQsIGJ1dCBhcyBCZXJ0cmFuZCBzYXlzLCBvdGhlciB2ZXJzaW9uIG9mIHRoaXMg
dG9vbCBkb2VzbuKAmXQgd29yayBxdWl0ZSB3ZWxsLiBJIGFncmVlIHRoYXQgZXZlcnlvbmUgc2hv
dWxkIHVzZSB0aGVpciBvd24gdmVyc2lvbiwgYnV0IGZvciB0aGUgc2FrZSBvZiByZXByb2R1Y2li
aWxpdHkNCm9mIHRoZSBmaW5kaW5ncywgSSB0aGluayB3ZSBzaG91bGQgaGF2ZSBhIGNvbW1vbiBn
cm91bmQuIFRoZSBjb21tdW5pdHkgY2FuIGhvd2V2ZXIgcHJvcG9zZSBmcm9tIHRpbWUgdG8gdGlt
ZSB0byBidW1wIHRoZSB2ZXJzaW9uIGFzIGxvbmcgYXMgd2UgY2FuIHNheSBpdCB3b3JrcyAobWF5
YmUNCmNyb3NzaW5nIHRoZSByZXBvcnRzIGJldHdlZW4gY3BwY2hlY2ssIGVjbGFpciwgb3RoZXIg
cHJvcHJpZXRhcnkgdG9vbHMpLg0KDQo+IA0KPj4gKw0KPj4gK0luc3RhbGwgY3BwY2hlY2sgaW4g
dGhlIHN5c3RlbQ0KPiANCj4gTklUOiBzL2luL29uLyBJIHRoaW5rLg0KDQpTdXJlIHdpbGwgZml4
DQo+IA0KPj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPj4gKw0KPj4gK0NwcGNo
ZWNrIGNhbiBiZSByZXRyaWV2ZWQgZnJvbSB0aGUgZ2l0aHViIHJlcG9zaXRvcnkgb3IgYnkgZG93
bmxvYWRpbmcgdGhlDQo+PiArdGFyYmFsbCwgdGhlIHZlcnNpb24gdGVzdGVkIHNvIGZhciBpcyB0
aGUgMi43Og0KPj4gKw0KPj4gKyAtIGh0dHBzOi8vZ2l0aHViLmNvbS9kYW5tYXIvY3BwY2hlY2sv
dHJlZS8yLjcNCj4+ICsgLSBodHRwczovL2dpdGh1Yi5jb20vZGFubWFyL2NwcGNoZWNrL2FyY2hp
dmUvMi43LnRhci5neg0KPj4gKw0KPj4gK1RvIGNvbXBpbGUgYW5kIGluc3RhbGwgaXQsIGhlcmUg
dGhlIGNvbXBsZXRlIGNvbW1hbmQgbGluZToNCj4+ICsNCj4+ICttYWtlIE1BVENIQ09NUElMRVI9
eWVzIFwNCj4+ICsgRklMRVNESVI9L3Vzci9zaGFyZS9jcHBjaGVjayBcDQo+PiArIENGR0RJUj0v
dXNyL3NoYXJlL2NwcGNoZWNrL2NmZyBcDQo+PiArIEhBVkVfUlVMRVM9eWVzIFwNCj4+ICsgQ1hY
RkxBR1M9Ii1PMiAtRE5ERUJVRyAtV2FsbCAtV25vLXNpZ24tY29tcGFyZSAtV25vLXVudXNlZC1m
dW5jdGlvbiIgXA0KPj4gKyBpbnN0YWxsDQo+IA0KPiBMZXQgbWUgc3RhcnQgdGhhdCBJIGFtIG5v
dCBjb252aW5jZWQgdGhhdCBvdXIgZG9jdW1lbnRhdGlvbiBzaG91bGQgZXhwbGFpbiBob3cgdG8g
YnVpbGQgY3BwY2hlY2suDQo+IA0KPiBCdXQgaWYgdGhhdCdzIGRlc2lyZSwgdGhlbiBJIHRoaW5r
IHlvdSBvdWdodCB0byBleHBsYWluIHdoeSB3ZSBuZWVkIHRvIHVwZGF0ZSBDWFhGTEFHUyAoSSB3
b3VsZCBleHBlY3QgY3BwY2hlY2sgdG8gYnVpbGQgZXZlcnl3aGVyZSB3aXRob3V0IHNwZWNpZnlp
bmcgYWRkaXRpb25hbCBmbGFncykuDQoNClllcyB5b3UgYXJlIHJpZ2h0LCB0aGlzIGlzIHRoZSBy
ZWNvbW1lbmRlZCBjb21tYW5kIGxpbmUgZm9yIGJ1aWxkaW5nIGFzIGluIGh0dHBzOi8vZ2l0aHVi
LmNvbS9kYW5tYXIvY3BwY2hlY2svYmxvYi9tYWluL3JlYWRtZS5tZCBzZWN0aW9uIEdOVSBtYWtl
LCBJIGNhbiBhZGQgdGhlIHNvdXJjZS4NCg0KTXkgaW50ZW50aW9uIHdoZW4gd3JpdGluZyB0aGlz
IHBhZ2Ugd2FzIHRvIGhhdmUgYSBjb21tb24gZ3JvdW5kIGJldHdlZW4gWGVuIGRldmVsb3BlcnMs
IHNvIHRoYXQgaWYgb25lIGRheSBzb21lb25lIGNhbWUgdXAgd2l0aCBhIGZpeCBmb3Igc29tZXRo
aW5nLCB3ZSBhcmUgYWJsZSB0byByZXByb2R1Y2UNCnRoZSBmaW5kaW5nIGFsbCB0b2dldGhlci4N
Cg0KQ2hlZXJzLA0KTHVjYQ0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdy
YWxsDQoNCg==

