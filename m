Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77D7387D21
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 18:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129418.242915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2Kq-0007tg-BI; Tue, 18 May 2021 16:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129418.242915; Tue, 18 May 2021 16:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2Kq-0007qS-6y; Tue, 18 May 2021 16:12:44 +0000
Received: by outflank-mailman (input) for mailman id 129418;
 Tue, 18 May 2021 16:12:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tj/=KN=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lj2Ko-0007qG-Ap
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 16:12:42 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75276f83-fbfb-459c-a245-4907c6cc74b7;
 Tue, 18 May 2021 16:12:40 +0000 (UTC)
Received: from DU2PR04CA0079.eurprd04.prod.outlook.com (2603:10a6:10:232::24)
 by VI1PR08MB3183.eurprd08.prod.outlook.com (2603:10a6:803:47::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 16:12:32 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::b0) by DU2PR04CA0079.outlook.office365.com
 (2603:10a6:10:232::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.32 via Frontend
 Transport; Tue, 18 May 2021 16:12:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 16:12:32 +0000
Received: ("Tessian outbound 3050e7a5b95d:v92");
 Tue, 18 May 2021 16:12:32 +0000
Received: from 91e0cfdcd992.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 18D3F69B-46DB-467F-A563-F17877597127.1; 
 Tue, 18 May 2021 16:12:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 91e0cfdcd992.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 16:12:13 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VE1PR08MB5647.eurprd08.prod.outlook.com (2603:10a6:800:1b2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 16:12:11 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::5ca9:87ed:e959:758a]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::5ca9:87ed:e959:758a%5]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 16:12:11 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0307.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 16:12:10 +0000
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
X-Inumbo-ID: 75276f83-fbfb-459c-a245-4907c6cc74b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiBLi0AFnGNZcNcezd06ehlbAK8xI0EM1EKgwai0JwI=;
 b=6Y/0S6q9dlhOldzsl2hj49RoIycirPcJfCnDZhkeBRAqlSzdC4gPjgXD0TiF0hkA7kYy+EtHcmS3sgXFDP0Cwa5d9Pwd9EZtd8CmZL1l4o5E4LQQ7Fj23HrxYVvLJoe8uTMCmBoL9Mq91NIT3BQzs1d6AjnBfL0QosHLBnY5IDM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3bbd0117cfd6853e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2pC8JJY3aYOqQwRCNW6Sm1Y450hTsrI+OHmcpbjKDoF/NBGF7JwUOnwkfcKQ8jO8uqzdb1XnDRjqaFjlIfWcPyaKAgr51mjZYRAuu799wQd51asGjrt9vnDehlWKif6C5pYxAOBxnm59aDgTHSwHzEfiW/339AcYFocy2Uk2LxCqKhd1Z/+XExYMGTL7+9bBRJVU2BsGZiSaY7ArdUyunCvtWrgT1o5OtfKB4552wefSjwSjNy/NczaVHySR3gXr6I/xjrEifLNGb4X/D7ED6HRnYoIu8BUP5u/Dl44n+p2nM0PNoKzhPsaM7GS4qNyYo2qL5x3V0C6l9luKCBh3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiBLi0AFnGNZcNcezd06ehlbAK8xI0EM1EKgwai0JwI=;
 b=aSE24dozesi7+im1ur1Oh94GYw4WdsarPcUgdPtr4w6atEngOyt3mbuoyvpUViRseCP0VscZRNTjva5SGxKxE7YChInhKKSdZrRlvBCJHryQ5+k2VoEpcaIOo2WSbtiNFAudgxVEOvnJ70zvbT3Xk6eVjgiAmfKI3Sk4GjYToepIIFHTvUoeTAB9JopoDoUcf4jOmceF9QNMc6Un/pZn+IPkLNr17JrO6WPk2XnUCa2Pxu86KmSP+x8ChcUIXmUpPWhYbVZ5a97t4CmWuYC1gDmKif/+nRl3t/aDjvp/OzuIJN9SH1AmnyGpqDlbszd58rYgZXkyeIUAxR+0lJwOIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiBLi0AFnGNZcNcezd06ehlbAK8xI0EM1EKgwai0JwI=;
 b=6Y/0S6q9dlhOldzsl2hj49RoIycirPcJfCnDZhkeBRAqlSzdC4gPjgXD0TiF0hkA7kYy+EtHcmS3sgXFDP0Cwa5d9Pwd9EZtd8CmZL1l4o5E4LQQ7Fj23HrxYVvLJoe8uTMCmBoL9Mq91NIT3BQzs1d6AjnBfL0QosHLBnY5IDM=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH] tools/xenstored: Remove unused parameter in
 check_domains()
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210518152157.6481-1-julien@xen.org>
Date: Tue, 18 May 2021 17:12:04 +0100
Cc: xen-devel@lists.xenproject.org,
 raphning@amazon.co.uk,
 Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <95A0C7AA-4C70-49EB-9DD9-C9AAE987A5B5@arm.com>
References: <20210518152157.6481-1-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0307.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::31) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 704957c8-0caf-45d8-e56d-08d91a17bdcf
X-MS-TrafficTypeDiagnostic: VE1PR08MB5647:|VI1PR08MB3183:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB318368F4E27A21CDCCD92269E42C9@VI1PR08MB3183.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 M8ejY2latpJBCO3bH8nJNKTdyD38JPk8EQJ0tYRmZCnHrmY0ligEBlRN7HZNFVIL4LKO9dCH+qecDmh6pErZSZqCCpDID6mUJncmFM0JDIMKa2m7/NXYPQEsNYDk8mgIVCllrBmqKVaqv+AtcQbiVJWp05Ws+gHQZnkKzifN1jPE4f3trTX3cy4+txOANh+okRaMM4QxA+nXP8i54ggKN22w5ZL8fZXA5AzaSwyAyc+sX8sYHKrPPNeoEo+3hILuz0cOaR/LVjKljPBVfPXgy36Wqv8P+wj/OMCJRTxeB6F7G+S5BHt9rmGLAWUndngkM95W9da+Q7+XFNmfR3XsMgJfBoU11b0YgUbRflNjg80eYmRCYSKx/MK5AYe3IWtoRsX+Kn6aNKD0ohMLo+cGTI3s3sArkVmV1QLkSQv1ho7l+LOu2ba2z0S+6O6iBSVGmQ4evzkN9Ej4LexXKLej3t72YtCiYAb2P9/3v3rwssXesRfNPLr6itfpYXyhdAL2B72Yx3oQ1eBrrtuVKcctcZIMCvt17IfR7CJBoX1CDawMmkK8nCIQyUppjfZpRiPsoz8It7GPgYvanigkQNjd2vJVA5reUEBZVYcvLprKXDyKry8TqYYKbcX1Ubv02JfBbe514lf7QTddpWntZqxxgfBiPcqygWNeFxbb+On9nlqON5EJKA4g7ldQ5lPfv6iS
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(6486002)(2616005)(66476007)(52116002)(66946007)(6506007)(53546011)(498600001)(66556008)(8676002)(54906003)(956004)(6916009)(36756003)(16526019)(44832011)(83380400001)(86362001)(8936002)(26005)(38350700002)(38100700002)(6666004)(6512007)(186003)(4326008)(33656002)(2906002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?us-ascii?Q?9SxQ8TOvUhYyse5Wvh/gZwG33c0vXoUys2lBR1UgviteJnVMBB4TnWhvgo6H?=
 =?us-ascii?Q?q2HXqeMLZl+DLiSbdiFs/A3BUzbuovtMvAqHxyaUq4vsReJQMt/Qflhf1mrJ?=
 =?us-ascii?Q?N2DvEWYwfycCM248Vcp69n5/NH+ncGAxFdJ5AwRykkHmigmQd8QsB9nGMGfG?=
 =?us-ascii?Q?tWnSNirjUOBtfRvrUyy2ZxiEpzjRRMDPSQINJsFklUMD7F2TyB3gYCSdkcM/?=
 =?us-ascii?Q?BEBXRZbmhc3/MwJLSt9DXJooY+0hxspTEPIdOg69gE0ApoMSmsJGmkjkB0Lp?=
 =?us-ascii?Q?0fcZRxgI0URH0MkZrc6MpZd7SBhYCltNtPfdTI3BCqnRmvLhPt798Em6ZZF7?=
 =?us-ascii?Q?1B/hIXQWZnnrfQ6WAFmDeKBPkH+765/4q6eWIJF5yJ0/hGP/a30TuGBCzjYv?=
 =?us-ascii?Q?3R5HahK8JUuVkpSETF1VHRNGOZGJloMtM83sC0v95ICXfrlWnPD7CoyMz0V8?=
 =?us-ascii?Q?lvlX/lEiKIMFVbk3eRmiru/2yh2npJbxfdyQWYCxv1KCGpXyA3XOJJsGqMNs?=
 =?us-ascii?Q?IE6gV9LwGaanoRzC68f0Q8UgEok86dJffyI1zTLzrm8Sh+VUsGJYP0G1zdZy?=
 =?us-ascii?Q?+U7OAI3revnKe/Nen0/bMm6axolx5zF2JxnvAyHMIUoUBBno7V+LIZRn8urI?=
 =?us-ascii?Q?PU0GMy4yw+4HGTugidL50L2HbmGhfLKKKOf+U1EY2sW9Jd+q+oQ5lQteWyeL?=
 =?us-ascii?Q?DAbFTKA8wWNTK2qurwBF4DewNmWuaK8gNtsd/2BkrRM3BylTi3T3LolPJ6Vu?=
 =?us-ascii?Q?zq80jeZS55vajpfeLUQ1T+/SejF4JnU3FFW5jfk2PusL4D3EdkajPNpClAjU?=
 =?us-ascii?Q?1F3BuXHyNO7/cC7Igst0im0yoXPMOXX7p5VCdNgZqfouL97UOwgcTyM7rgI6?=
 =?us-ascii?Q?AwAziVtrOak0CQnbDCU7OwpV9jP23Zqn5+SZ8O+NMdsu0lirwhP8Q7P4SY5E?=
 =?us-ascii?Q?ekvD+dKnnEyRYUygYIlKKiXRWSeFBuy7tkIEzMeCRgwDeEovtUihZ2nGR4dv?=
 =?us-ascii?Q?p4s4+r7YkdAuctJ4+BG2ozGII5V0hB7ju4nV941pqlPMeaRhXROPVr2X/2Eo?=
 =?us-ascii?Q?xv1XzNYlA+P4HNHZx0mzwC4ZGWUceC6v6ac7fCkFhWr+wX6LbVBYvKY4PY/S?=
 =?us-ascii?Q?PkDw8VhpJJjJBiFNgcEzkWBT2YpmUTeCL4AaK++my4uXIVqAXq8nYz2obboL?=
 =?us-ascii?Q?BMIv1YmiKOFGxHWAQDKVb8gqcPGNhcxB37rYe+i/WF3P2wcM9ylRVQsgUwoA?=
 =?us-ascii?Q?4Kq5TLezlmVatzIH+otbF/GEbD3KNrth3jPMz5hP/JqKlMX4mSIXl3voZxp1?=
 =?us-ascii?Q?P329rRi4R8NBHBiwhBNfPr9t?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5647
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	931df35a-7a09-4d55-ec4e-08d91a17b15a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EgQaFo9Gw1TlUdwygp14StZEJsawUKDE3lH06M7r70dD0uXg8/nLQzaB4F3w0sw5cFDdisiZmtwn+Kq5XBA0ovgsc3d3rVpq3qm2IO7/oiGGBzXrh7IaeoS4BBIeCQHg4CLac965Hthqrb3A3b4wh1nfbD0kyoQ+8kR4J97S5B40VRT5l/+hiXvBukrRLQSSfrRoL8s1HEvIdNrWMuLKA3/kj8tZRqTKht90frG37TirwZ70IUHPxI9cKFCk3cN3r8nrLNxq8qQ3/xvAtYL69onZRuCg7MkAPUHijl5bOQoADV4GCVtq1ufiNMXdEjHkpRiL9nfnfefVM7SDjywn7fYmFFbKMLhI0jF574CJHOUhBFT9ODnxNK+nxk1759zy0ES5HAfPzU4WiQk+WtilQECkRaQsj0Iwc5nSUgusdXHW5PKG94SvH62CposAqnuFzmu7pLUNc2wPoJJH4KeFD0qagGMrndZ1j7E5NxRws8PtdpELmSAITe8FnOTWaER00JL32hVm0F/sooJ8zP31hr0w53tJZehL2N/AFJAQX3aaPZcgCC/v8DgXDtIjBTbSNlJVSVIRs4BfHp+8KeWa2OSqGO8BQjlFazYbbuZl3tuQ/YDw2lMB9200G1sna2l5Kn9UepYltCuK0OtFNMnVyJfPUF26AqH4V1C4S6QwR1U=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(36840700001)(46966006)(47076005)(5660300002)(6666004)(81166007)(33656002)(316002)(6512007)(16526019)(186003)(2616005)(82740400003)(26005)(956004)(6506007)(356005)(6862004)(2906002)(53546011)(54906003)(36860700001)(83380400001)(4326008)(478600001)(336012)(36756003)(70586007)(8936002)(44832011)(86362001)(82310400003)(6486002)(70206006)(107886003)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 16:12:32.0664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 704957c8-0caf-45d8-e56d-08d91a17bdcf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3183



> On 18 May 2021, at 16:21, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The parameter of check_domains() is not used within the function. In fact=
,
> this was a left over of the original implementation as the version merged
> doesn't need to know whether we are restoring.
>=20
> So remove it.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> tools/xenstore/xenstored_control.c | 2 +-
> tools/xenstore/xenstored_domain.c  | 4 ++--
> tools/xenstore/xenstored_domain.h  | 2 +-
> 3 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstore=
d_control.c
> index 8e470f2b2056..07458d7b48d0 100644
> --- a/tools/xenstore/xenstored_control.c
> +++ b/tools/xenstore/xenstored_control.c
> @@ -589,7 +589,7 @@ void lu_read_state(void)
> 	 * have died while we were live-updating. So check all the domains are
> 	 * still alive.
> 	 */
> -	check_domains(true);
> +	check_domains();
> }
>=20
> static const char *lu_activate_binary(const void *ctx)
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored=
_domain.c
> index 3d4d0649a243..0e4bae9a9dd6 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -220,7 +220,7 @@ static bool get_domain_info(unsigned int domid, xc_do=
minfo_t *dominfo)
> 	       dominfo->domid =3D=3D domid;
> }
>=20
> -void check_domains(bool restore)
> +void check_domains(void)
> {
> 	xc_dominfo_t dominfo;
> 	struct domain *domain;
> @@ -277,7 +277,7 @@ void handle_event(void)
> 		barf_perror("Failed to read from event fd");
>=20
> 	if (port =3D=3D virq_port)
> -		check_domains(false);
> +		check_domains();
>=20
> 	if (xenevtchn_unmask(xce_handle, port) =3D=3D -1)
> 		barf_perror("Failed to write to event fd");
> diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored=
_domain.h
> index dc9759171317..cc5147d7e747 100644
> --- a/tools/xenstore/xenstored_domain.h
> +++ b/tools/xenstore/xenstored_domain.h
> @@ -21,7 +21,7 @@
>=20
> void handle_event(void);
>=20
> -void check_domains(bool restore);
> +void check_domains(void);
>=20
> /* domid, mfn, eventchn, path */
> int do_introduce(struct connection *conn, struct buffered_data *in);
> --=20
> 2.17.1
>=20
>=20

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca=

