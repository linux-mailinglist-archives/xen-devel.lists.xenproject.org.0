Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BB33F2BE4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 14:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169512.309655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH3Uv-00053i-6W; Fri, 20 Aug 2021 12:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169512.309655; Fri, 20 Aug 2021 12:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH3Uv-000516-2j; Fri, 20 Aug 2021 12:19:45 +0000
Received: by outflank-mailman (input) for mailman id 169512;
 Fri, 20 Aug 2021 12:19:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+ZW=NL=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mH3Ut-00050y-Tu
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 12:19:43 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.64]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5199564-01b0-11ec-a6a6-12813bfff9fa;
 Fri, 20 Aug 2021 12:19:42 +0000 (UTC)
Received: from AS8P189CA0029.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::15)
 by AM0PR08MB5043.eurprd08.prod.outlook.com (2603:10a6:208:166::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Fri, 20 Aug
 2021 12:19:40 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::7e) by AS8P189CA0029.outlook.office365.com
 (2603:10a6:20b:31f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 12:19:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 12:19:39 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Fri, 20 Aug 2021 12:19:39 +0000
Received: from 90e5503778f5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 57431FF5-79E7-4EF0-B564-0B174AAE754E.1; 
 Fri, 20 Aug 2021 12:19:29 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 90e5503778f5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 12:19:29 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB3829.eurprd08.prod.outlook.com (2603:10a6:20b:85::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 20 Aug
 2021 12:19:27 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea%3]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 12:19:27 +0000
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
X-Inumbo-ID: e5199564-01b0-11ec-a6a6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jDM9W5p0EmNb8fTDvb8b8rIFFo/atxGhDoAPxeuvsE=;
 b=hQZFVqMF28EutuhmFse+V8w3ehUZMQNKFgIIr+Iz9IVh69a9GAZuy5JYObhjmsZ9T5Hik7rLZOl1MEf+PKi1Nir3SWbtXd+6fv/Ecz0tBNUTkHk00aAjzEP7vJAZfQ0W0Ca78Sz7GZxa36JbJowGnWrDHVU/sSs6/vDS/PpcZ0U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1d649c994b041dce
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Foq9z1k4q7asC9HodmsV9N6ydIeT8OlDuAm5lp2OUl9AfoMJfu510KqU3e366DNus6bdC7HXJt0R3ScMsP8odFdmDfIryUi1E0YYHALx4u02Xs4SOQltpqV+7+bRi54uVoMiFh47wttOKCGn7ogSyIGX1K1YbRUMke4EEgHJhwhSqByes4sbAI5nvudG4S0GjfPlaB/bjQEKM0/QaSoEIZGGNquSEZpPj/wfcCIXsrkzjrWx1qzi7g6YwheZ4knpOWx8I0lm77jGiql302WCljXvnadwU03I7xGfiMZu21vqd2UzG5CxA2pQgfcufhNmG8s/hPSsWpVYBudUDpdjRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jDM9W5p0EmNb8fTDvb8b8rIFFo/atxGhDoAPxeuvsE=;
 b=Hgy2tiThF3Haa2JruTszRO8FoCP/8saVQ1ZK/3Rzx/+cHz8IB4c7EkC4d+Qubp2Zqm4Mp+5UBF+daD0zjZRIJvrgzpxpagrwbBfQFFajnxfXDbGrZqEVmOwmZ55t25q9PFhQTai+5ayeYOMQbOnJdkFgYPaAc0Y58zMxxFUwTRL+SXr7cmujU3iEWND65hqMpLcaYiYwX2fnoh6W0yRWqkEZGIL0AhJOERaBWHZAR6/9cgXIe3a4F57s43cwoB8bMvyWxMcPTC6v7jZhkdQZhdzKjZImQeVpNPl/MDv+2iagGHruQKhQSoDQnOJPOda2MsU3Xnz9VgYFfJS/I4V31A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jDM9W5p0EmNb8fTDvb8b8rIFFo/atxGhDoAPxeuvsE=;
 b=hQZFVqMF28EutuhmFse+V8w3ehUZMQNKFgIIr+Iz9IVh69a9GAZuy5JYObhjmsZ9T5Hik7rLZOl1MEf+PKi1Nir3SWbtXd+6fv/Ecz0tBNUTkHk00aAjzEP7vJAZfQ0W0Ca78Sz7GZxa36JbJowGnWrDHVU/sSs6/vDS/PpcZ0U=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 09/14] xen/arm: Add cmdline boot option "pci=on"
Thread-Topic: [PATCH v1 09/14] xen/arm: Add cmdline boot option "pci=on"
Thread-Index: AQHXlPLhtufH+Y7V4UGOnj5QL/fazat6wkEAgAGPFAA=
Date: Fri, 20 Aug 2021 12:19:27 +0000
Message-ID: <DBFA6CEF-F8BC-4516-B609-99985F0C4698@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <e279636ea47b7d06056c2f70e76900b8d0b30ee9.1629366665.git.rahul.singh@arm.com>
 <731afb80-bb68-0c66-4f0f-341a46118770@xen.org>
In-Reply-To: <731afb80-bb68-0c66-4f0f-341a46118770@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fea94e15-6eb8-47c9-e215-08d963d4c899
x-ms-traffictypediagnostic: AM6PR08MB3829:|AM0PR08MB5043:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB50431C7D08A637A09038286CFCC19@AM0PR08MB5043.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 T2qA+K0mEORDS6KN/lezcOUxrwqfKWKRqAaFW1lT49swYc16tGHJ3zty5KIij0VSA9IG3W+XGdAFnlKu8HdhWjx2YXcv+DlGMR6a/rjhlR9WjTNJL5qy/kzuUPCJ5kkZFTryvCAGBxdrRLYnJuRb9qNaU6NtdXnqwHnsiYiLRkkhEmKO68yp9Sy7LVfdHk5ScxtmlHMsx8APadkZeL8JkXtAdpn8MUv5XozILumHQq9rU/XWir+4AetVwFOvfBKh3IHj1zrk13MYp1g7s2XfEWhI7q2eMTcet5E3YSjK6Vl3MTPThdEhZqYz8eW1gCgzYx7zp6T18fFwbveptHKnLBmySjo/QQJdokAk1zoh9YJ6yihLCRJlWdHgL1NTPe5m6YNY5UcLkdilqFvFsviDN5b/Ty7oMsCBarjbzQF56DxcfacJSmdkFwQZ+RsEeJmCdEtgMs+GsadeZ1LFSK/cKcZFJYfd7TwKVQcECbrL/pPOPp3zSo8lzuNw0O8Jtfakxd2caFfvSY2Ntu7WnCwTy7irpuEV0h/IIjH+bsr72ThA6JKLQCkvLFyKTu8eNmAl199rQujuA9GNjXCbr2waSnHAVaLSjXx+Zm8R+GcPpWCjowAAShNpoHuTjOuKNrINfR2KqStWE8CD4ga9ivMZm3gFaeHg6WGOsvtax0R1OkGdmzUAEjN2zZRYZu6yDGz2jeBpPyh8RSrMpmd9SEPlDCz624ilgiyZlZEfFBFwV2lzMeVe8vn07hQYMXGoDH3Z
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(2906002)(6916009)(4744005)(8936002)(186003)(8676002)(4326008)(38100700002)(26005)(6486002)(91956017)(478600001)(33656002)(66446008)(38070700005)(122000001)(6506007)(53546011)(66946007)(54906003)(316002)(2616005)(83380400001)(76116006)(86362001)(6512007)(71200400001)(36756003)(64756008)(5660300002)(66476007)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zluQGrtpbi06m1ScZPLa71OuziP3IjukU2sowAv/zFFOZFSPkzwm+kQgr5Tw?=
 =?us-ascii?Q?apDyPK4r7xrEZgb8mHbcJOCMEenyBT6sJ0WXueLl2wTSTMyAlFqw6g83uXAr?=
 =?us-ascii?Q?XnJ3EvUiFzUjWPnTeJWqV50LZhqog699214Y0aOcVYSuFUPaOZIOVJEvVDt2?=
 =?us-ascii?Q?CeWLBLRUyuGNG1P+DAZ4fJgrj1yyYr+vJOJr5vB+sSJsWzbajDAntVbD3J+k?=
 =?us-ascii?Q?QjxYchr6csLuHtCdc2tHuf3XEJO1YSiJ+cCMcfl+lcRbB6y3oYjzFS52LSIW?=
 =?us-ascii?Q?Ps4zp2LfMvywiPlFasUG/sou0L8weytncsaaFfzF9/UG4+mDLgk0CKkXXz1S?=
 =?us-ascii?Q?D2sbza7q2Mkrw9JnC4a7wDcpUBMmX8oDATThZ4RdaDW/yPNeFRMY8gPEO8tP?=
 =?us-ascii?Q?qOPuDVmCbfGWeQE8eXI4VeqR8mUEFJOSA4RPb1AnuzgJMDjQqqb69P9Bd54p?=
 =?us-ascii?Q?pJE5Raofwj/IafGacXBwgobvU0PqeaPZyCsTQoNNol42epYn1VTlF5gCptXP?=
 =?us-ascii?Q?0DnYmCCofULd0EBVdwVUZ2f8N0NXp0mahID9/Ou+6/H8rMhjXQv0qPTzaacP?=
 =?us-ascii?Q?2gZUrQSf0euUQWCQ3CNSizzagEfxBzJm0+dWCScwVnr4gasYDTjxd3Lzb7jR?=
 =?us-ascii?Q?0IjVZ2Fja+HSQm+N7UvhrjQZqqpU8MHCz/ICiDLmaZUodXlJZkZDG1QP6tmS?=
 =?us-ascii?Q?U5stuUoib0JWsw0JPsOC8zH8zuVBTQwdNB2sRtjwpD0otZJ2VPHxoURB+laP?=
 =?us-ascii?Q?RMJqY3/iU28d171AqprjD3rcaamcdoAU7BhUbSDzc/cIZ86W2Oc8t3f8YnhY?=
 =?us-ascii?Q?0VBhBIy7WBOz7Jk7JsXY3qlrz3OVhMXuKnKt+vHD2+HiQZu1PhhvbzfdggYk?=
 =?us-ascii?Q?lNUNKZjplbpHa4yhommUMZgOXDRiN+ulFWT4OwuTsSBT6C9jpRCnTKDc/R7b?=
 =?us-ascii?Q?Hj3XMqqQgPJ0LJaZ99JFfAwE15HnzjEbrbTrau0Sj/zYZWamdK2yC91la+nh?=
 =?us-ascii?Q?/FlqVM7+/k1SlVzl9rMJda4OAA+PcJxCIjOfYTMp2K3EuYkBxFec3eClYmI9?=
 =?us-ascii?Q?pLl/PZYXbxTcsozXzsSfn6pyppHd5t9tlIRpYfP8EHFM4P/2j0Sh5ccrQuHc?=
 =?us-ascii?Q?EJ/pDmWUNo1s1JWzkNb9x/AsU/+cQReHWrtr5h2og08l++Di1s2FMjY2kQZv?=
 =?us-ascii?Q?FkwmScE7yRJ3d+RWgGmb9rmk3eGCT/A9yOltxlXU9iW6yXTbhEZIFYrLpOf3?=
 =?us-ascii?Q?Sw6yQtU5cDvvY2j0huFGj/GgsQ2MHmuQcc3rBCl2qKcNGYhyi4FDDD+W5qTV?=
 =?us-ascii?Q?1s2hwZ5CfNZh9k9At2IKcjmJ?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B6E23B784F55314BBA20B0540C817666@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3829
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	250d4676-0d1c-4af6-f4c0-08d963d4c138
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DD3HTL3GfdmIrYFVwlkWs/XdX9GVQlpXdap5bwEd7h2W4e8XJKQu2haVESx6Dl+XlfZMbNn1MvuusI/BRv+L5kGKF0A2IjRQZsVxAZBs3Q8UQ0+aL1o9BH7z8lDVcyN0NtclfiNVrkKXSuecg+xVAxTXiPvKJTOyOlxrWmToW4t6gi+LHYwvI4zDlDtNGbTO8eLC0jHamwvRFnMjXW5tuCqNDtCV4I4wEexP0XEOfOGIKYu3SVPaB+vApoqBbAZwFBFxtPdx0zobGm+fGVu8TW+rBjgf9KCOyJi8bRAZWbc0wqPR5KSV82tlAImwjuQ2t9aASvG/U3PPGpS1nkVHMgKNuJwDLd2tqk4A/WoOVCthQ0R1ixNbgHeVvN7uWqG6jCVe+XGs0DABpxDlSr1VK8iDBxYPItotZw1J/Is/V0UXl9ctcZRiTqBUWSlrGIdwzB6z/YdqgUL82sbTgwemlv0OMSLWOJRMCHA9gX/THyMiVdaK8r+ynEcROObh2wrSAoZEj6I3RTUfyUQ4EFgkUe48A3kWsA9Gm+nSUyP72ABPSuAUbwQNCMlJOZO4m7MDBaF8fpT6YRGipfq0jJiWsBQ9h4YXhZoWlqcCD44zpzZZ6kXhL9daeFi+pMXUgUh0gz1YdoXSCH9WsaykhXKn1nnP5NOLNOzbYfoPWWbzVUxm1Jq+RqpugXPzhnC7KUkoGaMlC407BqtERHq4Sddxmg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(36840700001)(46966006)(2616005)(70206006)(356005)(86362001)(36860700001)(26005)(2906002)(4326008)(53546011)(8936002)(5660300002)(336012)(82740400003)(316002)(4744005)(81166007)(83380400001)(70586007)(6486002)(36756003)(54906003)(107886003)(478600001)(8676002)(6506007)(6862004)(47076005)(186003)(82310400003)(33656002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 12:19:39.8820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fea94e15-6eb8-47c9-e215-08d963d4c899
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5043

Hi Julien,

> On 19 Aug 2021, at 1:31 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 19/08/2021 13:02, Rahul Singh wrote:
>> Add cmdline boot option "pci=3Don" to enable/disable the PCI init during
>> boot.
>=20
> I read this as "PCI" will be either disabled/enabled for the platform. Wh=
ereas, I think it will be used to decide whether Xen discover PCI and PCI p=
assthrough is supported or not.

Yes. I will modify the option to "pci-passthrough=3D=3D <boolean>"
>=20
> Can you also clarify why a user would want to select "pci=3Doff"?

As pci-passthrough support emulate the PCI devices for DOM0 also, I thought=
 if someone want to=20
boot the DOM0 without emulating the PCI device in XEN and wants to have dir=
ect access to device.

I am ok to drop this patch if you feel adding the option is not required at=
 all.
=20
Regards,
Rahul=

