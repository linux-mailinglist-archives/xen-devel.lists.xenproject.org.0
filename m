Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 689885EA5A6
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 14:10:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411744.654789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocmvo-0000wA-IV; Mon, 26 Sep 2022 12:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411744.654789; Mon, 26 Sep 2022 12:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocmvo-0000tY-Fg; Mon, 26 Sep 2022 12:09:52 +0000
Received: by outflank-mailman (input) for mailman id 411744;
 Mon, 26 Sep 2022 12:09:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M8J=Z5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ocmvn-0000tS-Ji
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 12:09:51 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150075.outbound.protection.outlook.com [40.107.15.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ee436e3-3d94-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 14:09:50 +0200 (CEST)
Received: from AS9PR06CA0589.eurprd06.prod.outlook.com (2603:10a6:20b:486::27)
 by AM9PR08MB6257.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:09:45 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:486:cafe::3c) by AS9PR06CA0589.outlook.office365.com
 (2603:10a6:20b:486::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 12:09:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 12:09:44 +0000
Received: ("Tessian outbound ee41cdb23966:v124");
 Mon, 26 Sep 2022 12:09:44 +0000
Received: from cad1c9f1bea6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 52E1779D-C91D-459F-A12B-48B84F1C08CB.1; 
 Mon, 26 Sep 2022 12:09:38 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cad1c9f1bea6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Sep 2022 12:09:38 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DB9PR08MB6522.eurprd08.prod.outlook.com (2603:10a6:10:250::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:09:37 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 12:09:37 +0000
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
X-Inumbo-ID: 1ee436e3-3d94-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=H7gslB03J++KTUk5upAAmvZsVPQF861n+CmEBvMV/QAgzpE7lth3pkqnU/3wW2RfHDYzSf7TowOc+RvklTNXnwDkqh1qf5qvneSTUn8/hKQPLoIOGiRV9/tWyhBxJ8e+5vpcF/0i0I5rs+qkWuk0w5TsePKcdWJaB9fjmhQhbVvaMy+4jN+46WhteqHiN9GbmjefORQcOtILFNYlrIZmjTKgV8TOYeHOI7/DkFTfHtFW8uCKyJ0QYbKF0TtleqRgOY+FBcrQZnXzgwFNyokkBVNdtpRKFLkXq6VLiIH6NmQO6MEdjyMb6vhKHf9k6tA0clLJ+SEGco+bkn8WrWG0nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/wGHFrT9aA3vW2ycND7quldL++YUjWFbQ9rGp8dlFs=;
 b=nt8xr1r0OJOzuajs+Ga6WCh/1t/jbArReGkO3ir2Py9XpEPBszG3HmC2NyEIeUFifRpMlp6yNzDqS2cu6L+eGiJeLFzFPmI4R/6wHZGobMgdAwlGy8N0FoZ16BVF6zuzOlOpKECkFUfJBGVO7lf8fL7MKnr8h1s+GJEunTYxrnvLR0LKBS1xDwyYeSaTPT2//Zmgt+Gy3UJaGKmTfgUXYc+DudRMiIGZbiE92J+o0lMkXhZuoC6FkMF1Vf++tFG8SlpYDqsS0tJS6TMbyOJlGRyYAUHt5xUenHl74iKoMyP/FGIpeLLhk2Rsi+ylbBV9/yHorQ0OKhZPfuAKNluidg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/wGHFrT9aA3vW2ycND7quldL++YUjWFbQ9rGp8dlFs=;
 b=XItrGh0YjnVoZbHqbsU/55GkRi2mHL7wj9D9qX1SjPjbdEKjpo2+0k5z8zttKkOFEx0RlphF0yjOJNeScKJI5z1xkY6DjhC8ahaqhRXeiZXhZbkDMTdaAR4P/00gTGjakRDZdShcLLyV9JdwlIokQDOiyNTdl7C08147MCZPW/w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cc0f3583df04a715
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtKyfFDV2oLOdaZvpioRtAb2adYriIpzWFD8jPu4A6X7XJd9vI0T3N6flYWwjUreIZ/fzO/XASSRmFaHHW5Pppxr1Io6X6wEnjYgmnMEHRZ4tVKhADe13TEe/RhBILwXJD4qGClM4uKvB7AF4Aco3Ozx498/AhAaXJl4ttcF+Oi3gu5psX/g7U2XHDhumNkd9xJ85gD2JZgU1nsxSICd23jEaQGcqbV+g7obu++baoyFI2i3bxAlk0yCv4+3dN9Hf0Kkz3GVPHoGQR7MNqQxWcj5bdPxXyyD3oTuciOhpT/jYRAeVIzR96w38lGt/6HTNgLFxsENG2abCUraEYmIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/wGHFrT9aA3vW2ycND7quldL++YUjWFbQ9rGp8dlFs=;
 b=AGEmJhPJAp2OcaZKiJhKv35QlRiv5fhhjOm5WdThO8I+Qx2iGTGj5Q01NHkzb9KqfUj03FCfezgAyGuMPlFsjlLUPt1fMTj8b5HW+qYr7uTwPsYDUmOdstp7+9EA5lhBnQTnbeZoUIzmIawaSrZAQ6ZaS/8zNy3O2xDLQcMQTaHVQ2Om71U5dxSJEbjJmiKImC37l8IlJulTofQhuYzDCEFrcLDD7VfkJrOcfESrrt/WUXWmzlveTiEE3wjnH64yR/HvS6BCGUIpJgl5W6O6j5+PutCnHAHETdbRZsnvUxhrdFEWew3ICDd5BdgJ4DdClIN4Qpc62xEet0D4SiQ7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/wGHFrT9aA3vW2ycND7quldL++YUjWFbQ9rGp8dlFs=;
 b=XItrGh0YjnVoZbHqbsU/55GkRi2mHL7wj9D9qX1SjPjbdEKjpo2+0k5z8zttKkOFEx0RlphF0yjOJNeScKJI5z1xkY6DjhC8ahaqhRXeiZXhZbkDMTdaAR4P/00gTGjakRDZdShcLLyV9JdwlIokQDOiyNTdl7C08147MCZPW/w=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH] drivers/char: Fix build when CET-IBT is enabled
Thread-Topic: [PATCH] drivers/char: Fix build when CET-IBT is enabled
Thread-Index: AQHY0ZgVj9mKo7NWfUiNnbEhwgR5qq3xnoAA
Date: Mon, 26 Sep 2022 12:09:37 +0000
Message-ID: <6E84757B-2CE2-4C48-AA20-C5D172E4848A@arm.com>
References: <20220926110547.21287-1-andrew.cooper3@citrix.com>
In-Reply-To: <20220926110547.21287-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|DB9PR08MB6522:EE_|VE1EUR03FT014:EE_|AM9PR08MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a38e15-5a60-4f1a-fb0b-08da9fb80007
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8KKHQMjliMdP+Ly1Fcy+m8mP8Ea3K1NH8Qt6tXbG+W4JAX29skk83ksqL0ku2l262xGNn0tHEbDS8j2YMAS3GMJPCG9bm3ypE3+pDqINNpY2qMLVrAbJqYu6XlSt9QlUdUNs8WtowrAg3K99Whda1fZKuh2fdxoVl5gflQCXtN+izXo1dRszee7+YANl+xcwgTI4j0psztdiuWR6Q98C5vJzQoRl2kkKg+mKndIzGivvkDWZPoU9gFsTeFBtQOcm5ZgoNqcpshM0ZfmzlC0oxxl9TqhM9afCaAXis54OnPSp43N6IEQEUbjOTmJ0673rZS8+zHSTxxJlUTudcOBGckdQob3G/I1382YDqepgctFpcKAYltpBVwNfFm/ipCxq0hv6Wg5xg17TOQnOa1DcRH7NSNe6eYUHkc//AqYFfvZj+2MJt5YFBbB5ik/iQJ8YxJmUiihyUxcVkazM8NH66ACDloBuFRBgi+sywxflbR9Ux4f5SgknTwTP4qCmWqxivjhWCVICluawctDLLPfbTKwL9wMHElJXg5GyGpUkcQVDG2hssxp0+aseps1dcHObMan/5nGdjAX2t9AEr1LASsUwz5sp43ceEDEAazM3oe1McCTAMDew8FQMV1AAQFR3X40ewgmHmknAVo7F1nSgv+aJ5KRJ13+1QrAn5fuk2nQWRM0YSyiut525j85PA4ZH14vN57HAhaSRbviPDht36FTS3hVduFhLOpVFQXMuG6QVJ2jFUIACT5C+1a4Bh/UtTZz8moFytbzr70g5JhHjR4EGNdP9Mi06wUMC3hodufa76diCWQy23UKPQBd1X04av52Bv3boV6KY3VkQYET2Vg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(451199015)(5660300002)(6506007)(53546011)(86362001)(41300700001)(66946007)(8936002)(4326008)(76116006)(91956017)(558084003)(2906002)(316002)(6916009)(54906003)(71200400001)(2616005)(26005)(6486002)(966005)(33656002)(478600001)(6512007)(186003)(122000001)(36756003)(83380400001)(38070700005)(38100700002)(66446008)(64756008)(66476007)(66556008)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9D9B326813DEFE4D9DC81DB32D0CE8E1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6522
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1d1cb659-fe54-4a70-0fa0-08da9fb7fb84
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8u6ip+sXds3Txz5bdSuZK2V9dQn7ZX5xLkQNo75Qe1yUApzI7toVwp/wIcMegIMnw2/zPfP51mfEDK6MiKV6oSuPt0XlhGl+prO4obS8RzFNAv5r02I1MTtXkAinTmzMIYDOTEFxv/d0S13Zht15jYJcpR0mpj5QicgOQHbcPiE7DF3PBkCb7g7a1W2Qg82yMI45sElgPXJbsZY+XKWzshdzwdx7csOpxNBRq3v5Ryx/zOUB+QdvBqKEG0So80LsNpFFlc/OO+7k6rmG0O6tyuYCvpt84BLZVwVfkeG3sCPUI8q02bz2gEYHe8PHaAstKinKk7mWxvrQMuyryiLdQKXpKvmeyWD0vOnWsVyWDHxCEmIlIMWdDjE2Gm1v3fxGebAwcZ7OPGkiIICzGqWi6mtQ2aVAConpy8sBiRijIbnRnxFWKONpZrX/7BwjgpCbgp5S/+fwp+afLYbqsMWrX5phPu9fexRLr3ajuL3oIh8FaUopt7cC4sKwUqnby/NF5Go2WtJjhiwJoeksZYKXfCcylhfZnzV7ftK8YXmDkjzAglz+oxft4jS4sCvx4aiNVSCi9kGcgAg/JAL5lXFQo4DYzOgQSrqKs2Fda5AZZz+fADNLL2s70y6rA+NjXnnztIukzylqJp9RRtT7feSObuZYsw5hv8AtR/JuHHvI/FsUliV6hzznyN8Iux5t7USshNggFCqQddwhDO7rIUoSpZRRiNj12HZETCyEHXiYaXv1EHeq9iD4nFpLnCKOKa/DvRW6wArqDxbNOrwQ0g5GvwF0ImMO601uoO5Kdm4X7Q8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(70586007)(70206006)(82740400003)(8936002)(6862004)(5660300002)(36756003)(40460700003)(33656002)(558084003)(86362001)(81166007)(2906002)(356005)(966005)(6506007)(53546011)(2616005)(336012)(6486002)(41300700001)(40480700001)(186003)(478600001)(82310400005)(26005)(83380400001)(8676002)(4326008)(316002)(36860700001)(54906003)(6512007)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 12:09:44.8574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a38e15-5a60-4f1a-fb0b-08da9fb80007
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6257



> On 26 Sep 2022, at 12:05, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> https://gitlab.com/xen-project/xen/-/jobs/3083068950#L1763

Is this link permanent? Otherwise I think we should put just the reason of =
failure
as commit message.

Cheers,
Luca


