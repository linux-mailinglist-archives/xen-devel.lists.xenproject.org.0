Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE85A365A71
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 15:46:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113698.216674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYqhL-0006Z8-3B; Tue, 20 Apr 2021 13:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113698.216674; Tue, 20 Apr 2021 13:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYqhL-0006Yj-01; Tue, 20 Apr 2021 13:45:51 +0000
Received: by outflank-mailman (input) for mailman id 113698;
 Tue, 20 Apr 2021 13:45:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iarR=JR=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lYqhJ-0006Ye-3A
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 13:45:49 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.88]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17923fc9-30ae-4106-8347-0cef39f58d05;
 Tue, 20 Apr 2021 13:45:46 +0000 (UTC)
Received: from AM3PR05CA0110.eurprd05.prod.outlook.com (2603:10a6:207:2::12)
 by DBBPR08MB4742.eurprd08.prod.outlook.com (2603:10a6:10:f5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 13:45:43 +0000
Received: from AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:2:cafe::95) by AM3PR05CA0110.outlook.office365.com
 (2603:10a6:207:2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19 via Frontend
 Transport; Tue, 20 Apr 2021 13:45:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT022.mail.protection.outlook.com (10.152.16.79) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 13:45:42 +0000
Received: ("Tessian outbound 9bcb3c8d6cb1:v90");
 Tue, 20 Apr 2021 13:45:42 +0000
Received: from c0a22813eafb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B033A85-174F-4776-88CA-7ABEF1248D98.1; 
 Tue, 20 Apr 2021 13:45:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c0a22813eafb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Apr 2021 13:45:35 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM5PR0801MB1812.eurprd08.prod.outlook.com (2603:10a6:203:3c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Tue, 20 Apr
 2021 13:45:34 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50%4]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 13:45:34 +0000
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
X-Inumbo-ID: 17923fc9-30ae-4106-8347-0cef39f58d05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4gkbQyUEzbcZmHe+RLjkljIj++4qE78MdNjIBqI2Ac=;
 b=MpvphQOMXdT1Z7jQPq+Ua1RIMXqzWTUkEb67m4I0eR59BFrH91OVhnm7vA7s1JCWTivk8MTTrzvIbT3t2hN70tG82O0KPJl0fLfrW7pP5VFkWRZGTEuObZv5LpdpnPgPnQEIUOZeqQYM/jMp7C6Eicb+zbtDCQRv9vExwZpW8v8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc5a91043a9826e3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlR0kPeZvXQdU+0mr4ZeJVmlp3rUy2Sqtta6dEUzx6lMzonJl0PkcJxruwibCyxWC98TfrSlqqvYP3dwFT/g+oYnVhHNB/FO6Qu6vQ+Wuwpo5gnJc8n9ujo686RZph7VFmPmDNjU1Z1sNZ3s6igp8+kHrdzjQ6TohBQ3XgLbRu2fjbCuIs/1NAywyGBdUH0roHQNLRoRG4FjGPSTLnQvMGEKhM3FZUU/hkPHx7IlHXrqFUCe6ekWsT12eyiZf0RYB562vWj1nUhNYsjTTv5FMbVERl5C9XTO/Gi8DfIFajUE09a2ZHi5XSDE7kq2jZwP5C5OB/0Iv9yDgMyMFUMrPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4gkbQyUEzbcZmHe+RLjkljIj++4qE78MdNjIBqI2Ac=;
 b=C/XxCXFizDG80Std9J7yBsacmjRg4V7Bnf3+l5SYwIZK+2eANXev+MYgmAJ8W3OwDU6oAa3WIQtYphTC1Yxu1lZoAyRdQ81H8fIpXoGZL+HsNZjDfyFnp32cN66atqQMmnWgGdKEC/Dt0+ui48qPjDHtg1jnOW9yvxq9tBFYm3UQv3wVK5Nh72M8RIHt4q2F8/bCycsPbraFZd1L0XLlLZPEftO8mdD2fMJWpSEpvoe7J9zvggKrZo3LmOblzeyLhE184Cn3pzrh4cFQpEWe7CNWpbHW6g3qWh0Rlx3zfevhYYB6fDJgs7/Dw+7ouVb50xrbtb7USHMo+m5VYDWEhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4gkbQyUEzbcZmHe+RLjkljIj++4qE78MdNjIBqI2Ac=;
 b=MpvphQOMXdT1Z7jQPq+Ua1RIMXqzWTUkEb67m4I0eR59BFrH91OVhnm7vA7s1JCWTivk8MTTrzvIbT3t2hN70tG82O0KPJl0fLfrW7pP5VFkWRZGTEuObZv5LpdpnPgPnQEIUOZeqQYM/jMp7C6Eicb+zbtDCQRv9vExwZpW8v8=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Thread-Topic: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Thread-Index:
 AQHXLVmJnBz/2T+xZEqfD4R39q2wV6qwuDwAgAH9VwCAAPmtgIAADD+AgAHfkACAAAF1gIAF4LkAgAAXZQCAACuvgIAACpEAgAAKwACAAaaJgA==
Date: Tue, 20 Apr 2021 13:45:34 +0000
Message-ID: <D2D9A348-3B21-47FD-A9C6-4C66C5778F11@arm.com>
References:
 <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
 <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
 <YHaiW4xX0p6ov2Z9@Air-de-Roger>
 <258c91c7-e733-3c40-5e4e-7b107e4d20c3@xen.org>
 <YHg+6rLN0rBWXcTs@Air-de-Roger>
 <788665ad-9815-e3e9-2d5a-851b35c566d0@xen.org>
 <AD2BC1CD-74AF-48FF-8B42-2853C0E7A7BE@arm.com>
 <YH1CBP8At7lVoHCz@Air-de-Roger>
 <a365ffbd-5b88-85c3-9e68-46a9a730a6fa@suse.com>
 <0d5539e3-32e3-8275-f695-351eda49cb29@xen.org>
 <6291effa-1589-1013-e89d-c795bce44d9c@suse.com>
In-Reply-To: <6291effa-1589-1013-e89d-c795bce44d9c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1e75a4b7-b8f3-45df-d58e-08d904029771
x-ms-traffictypediagnostic: AM5PR0801MB1812:|DBBPR08MB4742:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB474263BB43A0E2D7453AB55EFC489@DBBPR08MB4742.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HA6x6Za7242lewPOSWnDw2SNoRPS++8wbFLmKd6ikIs8sFx3b6XlTGphOCfOb+wYMcsre09SIU86u9exUfkiF/Jz2eQExTrvpFmWuyWYmmAe3aduoA+zQBgj9bfHZwat3GEpdG8jojXZoZRvHhSKETR/coHjuYCv7S89QK/SAX/RfOG4bO8GfY+gSN/F7cDRsooghNzxvLvw0/ZjjxPfW03jqV7tR3PnPB5z9PhHwk7on1W0wfJQt6qUrNsECxGbmp2Kgagy76wO1B5ZT6MwnR/1Hqgih6fV2/IMuwkR0anTOxP6FDrvUcQNbcfXkt+PvFEuqy9oXWUITu894r55qBtGkT+4osfK9YfyqGG0/3EgwNm/s6Xg4sHk/odwOa+D0TMyaktHE6zNyKGo5M8ZDKiL3Mz237av5tXwS5WXqO7wnROhdf/BHWZuwK6xyH83frkd1iMFXlZzauN2itUehdvolfFnOn+DZNGx4lGZihYjVkq4OHP1p3j+PMpDRzBjIU88i8i1PJb5qVDsA0WBjKAXWkUxB3zeQ1XcLdBylkc9Ffv4AUDQC+1cfq0qAhzruMWkcHB9VbuuxS9reh3xN6kTdLStqohdDneloTzScWBjGsOSSQkAqualydNMDwPi8OXXq03g5ELUrLzfDJRq1c8bjuZbaEGau5JdZIqtYLU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(376002)(39850400004)(396003)(38100700002)(122000001)(2616005)(36756003)(7416002)(54906003)(316002)(8936002)(8676002)(5660300002)(6916009)(478600001)(6486002)(86362001)(2906002)(4326008)(186003)(64756008)(71200400001)(66446008)(91956017)(53546011)(6506007)(33656002)(66476007)(76116006)(26005)(66946007)(66556008)(4744005)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?iso-8859-1?Q?7OrX7H14LAE0ZxIPY6+7k6IZVYknu7lUDGfmWIMxPgsPtAQgJDi3LArk6W?=
 =?iso-8859-1?Q?8tbmDAaJQ2BG47OmIdTwzu52DlJEUc3LoeHQOm89BQmAqtsHCdsUPG8CPD?=
 =?iso-8859-1?Q?8VZmY4t4/sSix/uUEH6o7W/soMKxD/NmTUQ/2ZKbeMjN/jaQSIK5pr7FVA?=
 =?iso-8859-1?Q?XIscLeSfaizwkX81pP5Yu1wWTOIRixZBazF+5Dak8M3PXqIYvYgKzomCnd?=
 =?iso-8859-1?Q?/Cr2sV9s4YjUd0Wrh3KMUdoVBGGR1M1Sgp6WRYxhS8iQwoTLinmy2NsPpc?=
 =?iso-8859-1?Q?NLwYibX1BSvxXBV+4WFMEY1dN4S4fdw3WeYyQMnhWjpKqX1o0n8oAbcfBc?=
 =?iso-8859-1?Q?eMKSB2NFKeAxi5sXeL8ikfL9QF+oEdHRQ2k6lXZ/MkRpKsw/oMcL0/Ip1n?=
 =?iso-8859-1?Q?DYaD+UX5i+QlZds2234OQd0vGTEn/Sz+qH7hjUMfN23I0MpaXNW+bQRDsI?=
 =?iso-8859-1?Q?K2EbJh7P40ySNGiQ2aZ37FsLhkYdAvl71zIWUZ4qOVPmO6ctf6O1xN39gN?=
 =?iso-8859-1?Q?LBJcBPIjWQc1RJ78W/6UMi958if1BibLQxYRkZGjklDD4Me+F+TkWIYnQ5?=
 =?iso-8859-1?Q?srhyp0WOHfwLihe5x3FzFJ4g2H2QNhS8Y/kRTzGZBQRDOmWKDDNG62RImm?=
 =?iso-8859-1?Q?fPMZuEdJw21eGDGDH+2ab9YOp4hRBpHQ66pNiYF2aR1cf3XUjdV+koWfb1?=
 =?iso-8859-1?Q?S5WDWxPYiafVFpav/wvRrYsYFOK4JZxfeK951PYVyZDhXyyLiFeYcErXFS?=
 =?iso-8859-1?Q?NaKZRJOYEa2r2ASu3sQA/eWozrwN7r3IgDBaD0sCGkpdArNwIJaxQaQWGG?=
 =?iso-8859-1?Q?hPcxNDxX2An9U0QoBqrX3TY42YMjo9pg2mY9syKWZxwtpqJa+GehezjUCz?=
 =?iso-8859-1?Q?B9OSOe3sG82MZ3FLd8zSJEMiC2isCEsznt50LMQ99wLW/XwgmxOZ9hOEi2?=
 =?iso-8859-1?Q?cPMK+OdrSL9ybRIGMTbfHHySxLC1cZWW5iSdarbzg464yT/y09FLHUVLMG?=
 =?iso-8859-1?Q?AyISkgJYIXLuXP7Wj20RSh14KTDx1ZSTzRfBGWnv9cCYdqK+A2Cg1VmMKL?=
 =?iso-8859-1?Q?FrupSPBIZBtB+v5FkLWlWBhJ/kYmSGEbmxOi5VdYfXTBKHePd8CddAvGS6?=
 =?iso-8859-1?Q?IU5CngNhJ2hRCCTbbuUPPiwtFDYaEBlMOWs2KDQTTcvYIIHvN+/PvgAvlQ?=
 =?iso-8859-1?Q?eomrN6RXqaZWZJ6scXiYAYMX7OfUxBmHV0PbZzONxuonO/bSk3tiAhr8Ds?=
 =?iso-8859-1?Q?VpiTPk5Kgt2ZiAeJqKwyW7liE+xB7Lx5k7AcEr44JJoyAwdtqFzeBls5JJ?=
 =?iso-8859-1?Q?INnhSGpufiGNpxiga+qXI6ITqb67ydcf2Dnn1VgkJdaW/7/buEwr/UQMBq?=
 =?iso-8859-1?Q?llJgudss4C?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <24F60E665FBF8845A5067072A17357C2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1812
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8f1069b4-1a91-477e-1e5d-08d90402927d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uD2sxqWgWysvkJAdEVumKt06q9VPKCqC46Srp8ry4PuwMIlToWCDLiSJUGyjk6eZrQ2+pJSr/Ldq7MrmmY5TvSXNzclWGJ5G5HwP7/CX1J318CxE/hk2Vu2sOXpIet8GleyXizrdMaj0z0DCRi7CrgNg+0vuQWSw/XwDSPRwjxRi6JK0iJ5Sbb+AgbgnX6Nr7hgVveKfEflXpFBTNzx7Py9DSecBsw49lAFtHArxpTil+O/QgTmspOHV4mZefKnzGtjC2UrwT4v6dE7552a/Aq9qoxp525vCD1U8VPNPOu/JECsh+71OA8+lwCbQnfwXFCBoYvKQeDG6gJH4NY0UuROYPDvxTGxzwdduAkwUvTQ4iMIzwITGC0Ior9LUbyVTSKdb97dUloc4605F4tDDbjFUSkTpTkfOp3uDPNzX1BCrfpdYMbTgEi8LPO1iEuxxA6m2IKwsepi2hBBgRUNjHDgm8Qc+6p6t/oTNDSwv3pEXuOW6O3squB1Az4f6FJFO3chjtyFe2FYEhOs+m5AkSEeR82LgQr3c+xPYEFBorfRUBGCkvSO1ZttHaJhvqnm72F+/GkMnJ6j4A0hGMYRRKuEri9V0VfV8kmJ9xJLIE4P4WU0iw9nBh4EqDrUq0GyXHlm11I909jXlrj+uM/7mpg3JOdNtWPtoQvQS8s933WQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(53546011)(70586007)(6506007)(4326008)(107886003)(81166007)(6862004)(186003)(498600001)(5660300002)(36860700001)(70206006)(8676002)(4744005)(2616005)(26005)(6512007)(33656002)(336012)(86362001)(54906003)(356005)(47076005)(8936002)(36756003)(2906002)(6486002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 13:45:42.6311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e75a4b7-b8f3-45df-d58e-08d904029771
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4742

Hi Jan

> On 19 Apr 2021, at 1:33 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 19.04.2021 13:54, Julien Grall wrote:
>> For the time being, I think move this code in x86 is a lot better than=20
>> #ifdef or keep the code in common code.
>=20
> Well, I would perhaps agree if it ended up being #ifdef CONFIG_X86.
> I would perhaps not agree if there was a new CONFIG_* which other
> (future) arch-es could select if desired.

I agree with Julien moving the code to x86 file as currently it is referenc=
ed only in x86 code
and as of now we are not sure how other architecture will implement the Int=
errupt remapping
(via IOMMU or any other means). =20

Let me know if you are ok with moving the code to x86.

Regards,
Rahul
>=20
> Jan


