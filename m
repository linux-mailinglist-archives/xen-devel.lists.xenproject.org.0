Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23677819AE5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 09:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657444.1026272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsHr-0002Hi-Bf; Wed, 20 Dec 2023 08:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657444.1026272; Wed, 20 Dec 2023 08:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsHr-0002F4-8V; Wed, 20 Dec 2023 08:50:43 +0000
Received: by outflank-mailman (input) for mailman id 657444;
 Wed, 20 Dec 2023 08:50:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KgnP=H7=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rFsHp-0002CP-Cx
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 08:50:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2612::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8efd24b-9f14-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 09:50:38 +0100 (CET)
Received: from AM0PR01CA0080.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::21) by AS8PR08MB9387.eurprd08.prod.outlook.com
 (2603:10a6:20b:5aa::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 08:50:35 +0000
Received: from AM2PEPF0001C70A.eurprd05.prod.outlook.com
 (2603:10a6:208:10e:cafe::c3) by AM0PR01CA0080.outlook.office365.com
 (2603:10a6:208:10e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Wed, 20 Dec 2023 08:50:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70A.mail.protection.outlook.com (10.167.16.198) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 08:50:35 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Wed, 20 Dec 2023 08:50:34 +0000
Received: from fb82170e7f03.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D7258F83-BE66-4211-98EC-8956D2DCC43F.1; 
 Wed, 20 Dec 2023 08:50:28 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb82170e7f03.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Dec 2023 08:50:28 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by DBBPR08MB10589.eurprd08.prod.outlook.com (2603:10a6:10:538::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 08:50:25 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e%3]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 08:50:25 +0000
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
X-Inumbo-ID: d8efd24b-9f14-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eAkkoEGHJ1OndEerbldrDJ3yufWfxMcKPSS6OTIY35xTh3DgJJKoIKUCfAkQGH4awfkGz2Uc9RtWFzOT1PvMglMVX1QN7EyP/FMhd7m9W//evrv/fw2J1O1jd3femJA7gimdLsR6C/UD6WRjUfkobzJZhhdmA1uCxlWAgT3LDDBahHLo+g79/TJDXz7456Ser+1nlpQ+IFOSq7tudptGEsH+eHxQSFfFDQmlQedD5sIx/7pvMe6gyl9WL4C0GMxWNXm2VCn34vPqTTphUdKAFM6RAHqjq2RunP6yA5DdtuV7nYQs5z6UhUC77gjBkiUVhuyg1lcHnUROF85bRX0LzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXWKnpdT2bKUIYWndABCqXCuVJIlf9WMCBRypwQQKAA=;
 b=UPw7GoLXfJbgowVtqjMj2hViIARXGwHIBSV/6E4p+iAc9sQl+RIAoE6+NEWr1+0rCvvfOkXK1pWB/WOJgj8PTaREokil2AZn+kKZtD2wvZkoJw0TpwSNMFAAxDREAEk0UFqiFMpg2XOt3hZjFjOpgSNHRjH6WC9iMx0b+BsJeZJa+9Lw84SqSfjy5A0beeGkAn1zoqZ4QK5KFSUjKZNwEJpLyJivo5OQJg/jIO2JF8v4umYA8Eoi99D1i4AlF2cTGVLcJpjxFDW3t7kqSg3jGcNrFdyaDZoNLnea3k9psl6vnoCsW6ngwryr7Gen8NcM+NFgFvrxbEjBHcnKYWBHyg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXWKnpdT2bKUIYWndABCqXCuVJIlf9WMCBRypwQQKAA=;
 b=mxy/zNWMgRPZFAJ4D8ndxUe+NXQXSuhL8uPUapuB+4vAFA5uhQ/D+guqrfXEIklYHXS/fB3wOxfMMEa4wvAuUMOhQ5+ztkZpI1CLTNSizKTMYTDDyFz9+Eu6Z87GHYYmUmPyt2NS5cyHtHyvhrp9IZYGy0Vhmn3L0JBbbRjIJQ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 633862a56bc1b416
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGr2usywVFMI7oYK0/ggQ+kipuxLLdXvdIqaYlq97TTkpwCQjni+UCJUQpnHfKZ3cBJsQgEBgvtzLbo0ibOl75ESaw1UvkeW1XceaGIH2vkmRm7LXVkVeJwHwJsEzuddILzzgtDA1Q0X68lp8Pwg7UTuFVfsUqUFp5Tb4MuUQgpia5NqsB3vo35pFr+yk4LwduwGw4VRLpEFi4CojWOadN8qGXdIcELb0WLfrS8omusUo4U7ebuKNru8iTVfe53bgx1Z0VbZ6sigcJ4ue3ELorrBhFP+9iT2FknL7i41B6U0fY0UNyKXiJjtDXpQJnY8gwwXdSBanJdaybkRUI07SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXWKnpdT2bKUIYWndABCqXCuVJIlf9WMCBRypwQQKAA=;
 b=ifocj3bRFQZzC4Ae5HNWLXHFplEO5mNLHw2q6QV/aExxdWwu+JraTMlttzSPekf1JhctedT48at2ElDz5hBomEk6HBgKcEsy+EzsegHZgdfoQ0gFQmpj1wEHGnskrPkI/lGV1SnAxVWZ1ut2yEzp8YZ0wkbxUNUlrVVrWY4ByJ7ciRBuPVVZEXfsQCJ3W7h6bZ1syHJB8GpOjWKEezmiZv7ZM/E23yENnZIfWY9EMPK9rnwqLrbq7c88yz3b2b4e6YiudYPB+OfG10zzerplokbc+u6Cuy2Z5/QOjeAv3EUTm+4I4hqqBxg8PUwZ7A8PV+NEumBkyQkOsyvTQPll5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXWKnpdT2bKUIYWndABCqXCuVJIlf9WMCBRypwQQKAA=;
 b=mxy/zNWMgRPZFAJ4D8ndxUe+NXQXSuhL8uPUapuB+4vAFA5uhQ/D+guqrfXEIklYHXS/fB3wOxfMMEa4wvAuUMOhQ5+ztkZpI1CLTNSizKTMYTDDyFz9+Eu6Z87GHYYmUmPyt2NS5cyHtHyvhrp9IZYGy0Vhmn3L0JBbbRjIJQ8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH] xen: add acmacros.h to exclude-list.json
Thread-Topic: [XEN PATCH] xen: add acmacros.h to exclude-list.json
Thread-Index: AQHaMmldSNcDtDpNs0m0RNrxIeAVZrCwcdKAgAABGYCAANv4gIAAjRKAgAACT4A=
Date: Wed, 20 Dec 2023 08:50:25 +0000
Message-ID: <D2BDB22D-419D-4D4E-B242-C8FD70D23E5E@arm.com>
References:
 <664ddc412905546d44d3e311a743ba5217a6243b.1702976486.git.nicola.vetrini@bugseng.com>
 <055b6cf3-4f29-4f1d-b650-26c6d9be8832@suse.com>
 <2fd03776043811a8ceae9ae41de5f0fa@bugseng.com>
 <2c64af71dcb3984f1753ef115868cb7b@bugseng.com>
 <2F345562-4049-4A50-9793-D0002B239C43@arm.com>
 <alpine.DEB.2.22.394.2312191616400.3175268@ubuntu-linux-20-04-desktop>
 <70b0b556-d103-46dd-a69c-004e9adf27bf@suse.com>
In-Reply-To: <70b0b556-d103-46dd-a69c-004e9adf27bf@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|DBBPR08MB10589:EE_|AM2PEPF0001C70A:EE_|AS8PR08MB9387:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb9c675-c11d-4111-ec45-08dc0138bb41
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fsx1L3okW9L0On1AuMooBXDPAA8TsvPWSvxUrQd2WR68XxqxwbhgCedtuJv6okjWzNgOCvyRobEMGZkFMwdUaJe7Ml8QO8m8pkL9CKp74hfphrryfzG5ktp5HUEZsS2qRB6+uavgYVdgGc/nY9c+r6/TNKurwUngT6/smiKC9uEbasCdSh5BC9zW0dOnTf1bf96ECgm4i3shvBu46FNvZp47WF/T1inMk/kXj1exftYISMV8Mqw1g0tKUNBsluv5hF556z/NGHaduSfW7RRKeF06EbCO62bhqA8Q0sOhGknGXXVPrpeT87SNdHhBYfAHSpxUv7Hc7D6Qae3b+C/gPy+3WGTkaTVuEqoPh1Bjug7KjPGu/qtlT/pRkb3XeagRgCj07JQHQk8+6w59lDCefZJ1YXNZv0lV22LpygF5orE1mDAEq+ygLGnMrtb0i0j60inm/Vl7ofeLP+rssojmnD75x635+d0Tn9Yi5e0JGl20VmZRxv0w9Nsq6Iwutt58EwoQupmVSgXBQ/Tu+H6AWQcD8u5ZL8g93ZjV80ISLqiBfTEZ3IAXpml+grt+CW+aqZuE6yjzkg3+4haOpqZ33WS5uQ/NmEIoZWZCTa9IlknbkwGqrejB06WVhctMnG1naDNnLunKXdJU5VfJ5aJa6g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(478600001)(54906003)(316002)(66946007)(76116006)(91956017)(66556008)(66476007)(66446008)(6916009)(64756008)(38100700002)(71200400001)(38070700009)(41300700001)(86362001)(53546011)(6512007)(6506007)(36756003)(33656002)(26005)(5660300002)(4326008)(83380400001)(4001150100001)(122000001)(2616005)(8936002)(8676002)(2906002)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <986801E64D23E349BB5EF4A2B050FDD0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10589
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2cc12622-d094-44eb-4f3b-08dc0138b5bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pAdc3qB3xv+EVuP+RGsUzH4+8qbOayeIEoW4UX8CLPlg+ahy/ptkrzc2AjwspHYgv9MPp0M4wzaGol8hKFee5znqMi7NtXfLAPs02Ci7Qf8W7grR+RRkqz3Mh14YTqz/rvffqUrbrG5L7WgWtXaMEnzmONUWNaCOSVx3m7wea5TkWqKngRKM07zyZ7BzKNh0LzhDXyYzMpcFoUQBg0kR1b765OTCjIwlhRZECwFjmsbqsj3iKIsE5j0Grj9GcMSzK0CgZDwDtwPmC5pqYekFb2k/LeWCAa7s+cR2qRnU2vJrN5Db7dmle5wDmoACfrRnsxC25rl4IFbv/oT5pi+4xs+Sseobic2Im6gPOYSEBtLgsNeZewLM91IROSW4NxVcRgBip5cuFtS4HGfJuGNsLegwhCMhFUTiWr3SIgy4pQRa3Jlk2tPDyzN8BGmzytwzNI0nNJG6tkgSKaiz4B2c3ISDyPSXfxAT1BUI1GKpOlhWw789bUrm+pKVA2xLO4lfv+5UNHUOKpu1n7fv/nxEKIWbfXG1KwULLjmnOVEORDUsV4LH6dmLyUAU8/6sDjMvHGxIpv40QQB+0AHQoeVDot9MNYFp498JPw9LUPkj+SzKSazRAiCLTCedk57cQrZDxSaebyt1PcirXj5rc+EWFbEHFHrBJhYxgRQbz5uhz5GeNDbAPs8gGzEarIJTDIMLWTc8m7pdGA7poR/YuEcEFvrpQ0cmKUhbjr9OVfIuxUkn0Pz5E/uKXYfHS3/FXhyM
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(46966006)(36840700001)(40470700004)(36860700001)(2906002)(47076005)(4001150100001)(41300700001)(86362001)(33656002)(81166007)(36756003)(82740400003)(356005)(316002)(478600001)(54906003)(6506007)(6512007)(8936002)(8676002)(6486002)(70586007)(70206006)(336012)(5660300002)(26005)(6862004)(4326008)(83380400001)(53546011)(2616005)(107886003)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 08:50:35.0753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb9c675-c11d-4111-ec45-08dc0138bb41
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9387

DQoNCj4gT24gMjAgRGVjIDIwMjMsIGF0IDA4OjQxLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjAuMTIuMjAyMyAwMToxNywgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOg0KPj4gT24gVHVlLCAxOSBEZWMgMjAyMywgTHVjYSBGYW5jZWxsdSB3cm90ZToN
Cj4+Pj4gT24gMTkgRGVjIDIwMjMsIGF0IDExOjA1LCBOaWNvbGEgVmV0cmluaSA8bmljb2xhLnZl
dHJpbmlAYnVnc2VuZy5jb20+IHdyb3RlOg0KPj4+PiBPbiAyMDIzLTEyLTE5IDExOjUxLCBOaWNv
bGEgVmV0cmluaSB3cm90ZToNCj4+Pj4+IE9uIDIwMjMtMTItMTkgMTE6MzcsIEphbiBCZXVsaWNo
IHdyb3RlOg0KPj4+Pj4+IE9uIDE5LjEyLjIwMjMgMTA6MDIsIE5pY29sYSBWZXRyaW5pIHdyb3Rl
Og0KPj4+Pj4+PiAtLS0gYS9kb2NzL21pc3JhL2V4Y2x1ZGUtbGlzdC5qc29uDQo+Pj4+Pj4+ICsr
KyBiL2RvY3MvbWlzcmEvZXhjbHVkZS1saXN0Lmpzb24NCj4+Pj4+Pj4gQEAgLTIwOSw2ICsyMDks
MTAgQEANCj4+Pj4+Pj4gICAgICAgICAgInJlbF9wYXRoIjogImluY2x1ZGUvYWNwaS9hY2dsb2Jh
bC5oIiwNCj4+Pj4+Pj4gICAgICAgICAgImNvbW1lbnQiOiAiSW1wb3J0ZWQgZnJvbSBMaW51eCwg
aWdub3JlIGZvciBub3ciDQo+Pj4+Pj4+ICAgICAgICB9LA0KPj4+Pj4+PiArICAgICAgICB7DQo+
Pj4+Pj4+ICsgICAgICAgICAgInJlbF9wYXRoIjogImluY2x1ZGUvYWNwaS9hY21hY3Jvcy5oIiwN
Cj4+Pj4+Pj4gKyAgICAgICAgICAiY29tbWVudCI6ICJJbXBvcnRlZCBmcm9tIExpbnV4LCBpZ25v
cmUgZm9yIG5vdyINCj4+Pj4+Pj4gKyAgICAgICAgfSwNCj4+Pj4+PiBUb2dldGhlciB3aXRoIHdo
YXQncyBhbHJlYWR5IHRoZXJlIChpbiBjb250ZXh0KSwgd291bGRuJ3QgaXQgYmV0dGVyIGJlDQo+
Pj4+Pj4gdGhlIGVudGlyZSBkaXJlY3RvcnkgdGhlbiB3aGljaCBpcyBleGNsdWRlZCwgb3IgYXQg
bGVhc3QgYWxsDQo+Pj4+Pj4gaW5jbHVkZS9hY3BpL2FjKi5oIGNvbGxlY3RpdmVseSAoYW5kIHBl
cmhhcHMgYWxzbw0KPj4+Pj4+IGluY2x1ZGUvYWNwaS9wbGF0Zm9ybS9hYyouaCk/DQo+Pj4+Pj4g
SmFuDQo+Pj4+PiArQ2MgTHVjYSBGYW5jZWxsdQ0KPj4+Pj4gU3VyZS4gSSB3YXNuJ3QgY2VydGFp
biB3aGljaCBmaWxlcyBhcmUgaW1wb3J0ZWQgZnJvbSBBQ1BJIENBIGFuZCB3aGljaCBhcmVuJ3Qu
DQo+Pj4+PiBJJ20gYWxzbyBub3Qgc3VyZSB3aGV0aGVyICJpbmNsdWRlL2FjcGkvYWMqLmgiIHdv
dWxkIGJlIHByb3Blcmx5IHJlY29nbml6ZWQgYnkgb3RoZXIgdG9vbGluZyB0aGF0IHVzZXMgZXhj
bHVkZS1saXN0Lmpzb24gKG9ubHkgY3BwY2hlY2sgSSB0aGluaykuIEkgQ2MtZWQgTHVjYSBGYW5j
ZWxsdSBvbiB0aGlzLg0KPj4+PiANCj4+Pj4gSXQgb2NjdXJyZWQgdG8gbWUgdGhhdCBpdCdzIHN1
cmVseSBvayB0byB1c2UgImluY2x1ZGUvYWNwaS9hYyoiIGFuZCAiaW5jbHVkZS9hY3BpL3BsYXRm
b3JtL2FjKiIuDQo+Pj4gDQo+Pj4gWWVzIEkgdGhpbmsgaXTigJlzIGZpbmUsIGl0IGp1c3QgY29t
ZSB0byBteSBtaW5kIG5vdyB0aGF0IHRoaXMgY291bGQgaGF2ZSB0aGUgcmlzayB0aGF0IGlmDQo+
Pj4gYW5vdGhlciBmaWxlIGlzIGFkZGVkIHdpdGgg4oCYYWMnIHByZWZpeCwgZXZlbiBpZiBpdCBj
b3VsZCBiZSBzdWJqZWN0IHRvIE1JU1JBIGNvbXBsaWFuY2UsDQo+Pj4gaXQgd2lsbCBiZSBleGNs
dWRlZC4NCj4+PiANCj4+PiBJZiB0aGF0IHJpc2sgaXMgbmVnbGlnaWJsZSBmb3IgdGhlIG1haW50
YWluZXIgb2YgdGhhdCBwYXJ0LCB0aGVuIGl04oCZcyBmaW5lLg0KPj4gDQo+PiBJIHRoaW5rIGl0
IGlzIE9LIGVpdGhlciB3YXksIEknbGwgbGV0IEphbiBwaWNrIGhpcyBwcmVmZXJlbmNlLg0KPiAN
Cj4gSXQgaGFzbid0IGJlY29tZSBjbGVhciB0byBtZSB3aGF0IHRoZSBiZW5lZml0IHdvdWxkIGJl
IG9mIG9taXR0aW5nIHRoZQ0KPiB0cmFpbGluZyAuaC4NCg0KWWVzLCB3aXRoIHRoZSBleHRlbnNp
b24gaXMgYmV0dGVyLCB0aGUgc2FtZSBhcyB3ZSBhbHJlYWR5IGRvIGhlcmU6DQoNClsuLi5dDQp7
DQogICAgInJlbF9wYXRoIjogImNvbW1vbi91biouY+KAnSwNCiAgICAiY29tbWVudCI6ICJ1bmx6
NC5jIGltcGxlbWVudGF0aW9uIGJ5IFlhbm4gQ29sbGV0LCB0aGUgb3RoZXJzIHVuKiBhcmUgZnJv
bSBMaW51eCwgaWdub3JlIGZvciBub3ciDQp9LA0KWy4uLl0NCg0KDQo=

