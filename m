Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9003F2CC5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 15:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169531.309688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH4Dq-0003c9-Cw; Fri, 20 Aug 2021 13:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169531.309688; Fri, 20 Aug 2021 13:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH4Dq-0003ZF-9N; Fri, 20 Aug 2021 13:06:10 +0000
Received: by outflank-mailman (input) for mailman id 169531;
 Fri, 20 Aug 2021 13:06:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+ZW=NL=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mH4Dp-0003Z7-7G
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 13:06:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.46]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0346276-6c64-414a-b69c-963f65ee11d9;
 Fri, 20 Aug 2021 13:06:06 +0000 (UTC)
Received: from AS8P189CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::24)
 by AS8PR08MB5941.eurprd08.prod.outlook.com (2603:10a6:20b:296::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 13:06:05 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::be) by AS8P189CA0011.outlook.office365.com
 (2603:10a6:20b:31f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 13:06:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 13:06:04 +0000
Received: ("Tessian outbound 5918cb94a4b5:v103");
 Fri, 20 Aug 2021 13:06:04 +0000
Received: from 9ad05df75efd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0439DFAB-5C7A-4EB2-A06E-06C3EDF81900.1; 
 Fri, 20 Aug 2021 13:05:53 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ad05df75efd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 13:05:53 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB2998.eurprd08.prod.outlook.com (2603:10a6:209:4e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 20 Aug
 2021 13:05:50 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea%3]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 13:05:50 +0000
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
X-Inumbo-ID: f0346276-6c64-414a-b69c-963f65ee11d9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqrVtcr6wLbX1KQ7cYlGpgqKPkszw2NQrxQhSgXwnYU=;
 b=NIbScfFgn1GxShczIo2+8D4G0nqYWV5sTBsawcoLgEdQ5DlhcCJUe0ltULcIXk2tpujA6QY0UF9jRYJ1EcW9x7R6Ufudpp4+RICLpxPtr+Bz3583UQzdEqSzGD73RHG9kSciaCFBqewVjZ0oVyx4uynm2BC6deEf2Gmf37RZ+WQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4919e0ea9a67cd8d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaDbaOnGXrYYSVMoO4rjcotrW91ccUT3ttDqKN1DppgcREYdH0QFl4IpPZDv0GnneC5bmG1Dw5tvKvEQuw32stDSJIyw4V6wIEmIwEyWbSx4/sXx65ZBQWkg3g2hAWGSzB6vtdhOFIr1uhZve8atBi4TFwfkJrtBlZDnmpfItRW0bXHhKFm+KygP8BGGXTotiEWumyLVCD02/Fdx6FgCICB5SXp3369M2W2WnRMzXBlKU72dAaDzyxlJSCgb7PNDXH07BR3ScgR9HCZplSHJhcq1QmWMiQu5z35CktnAkmL1clW6P931K6DsCdecl1cgfsroL669C+ekNiQraNa1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqrVtcr6wLbX1KQ7cYlGpgqKPkszw2NQrxQhSgXwnYU=;
 b=bBqYajnTrtQQbSwQcud3NJlNGnOF74VIJuFlsArUwvDQK0v3jfGbYBmxKQ4jhSJCA6bmziTdcYDQJmkSkWOotnXtu7TJI6U3Gp6sYLC2nMYZcdDg2Mt6OuMCpn347t4X6k957DuDggX8tPJWxKetkHQIT3+/twMqSbIpiQpfkW3srjM5j60+jTD63LMmsHJxXyKGJHuzCzoeI/ZkCj2yXc7GqOZwrA+EF8tR6atjdv0m8vceY5AP8FRcEDn7ZP0WDtHrm2OAJAEn3xreOXLp8fXQncmbaqXqAhnBXNq0W1xIfw/DG+4CxXo6GxAOIIHZ9bVGKDI1vZcLd5nK2FsGwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqrVtcr6wLbX1KQ7cYlGpgqKPkszw2NQrxQhSgXwnYU=;
 b=NIbScfFgn1GxShczIo2+8D4G0nqYWV5sTBsawcoLgEdQ5DlhcCJUe0ltULcIXk2tpujA6QY0UF9jRYJ1EcW9x7R6Ufudpp4+RICLpxPtr+Bz3583UQzdEqSzGD73RHG9kSciaCFBqewVjZ0oVyx4uynm2BC6deEf2Gmf37RZ+WQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: Re: [PATCH v1 10/14] xen/arm: Discovering PCI devices and add the PCI
 devices in XEN.
Thread-Topic: [PATCH v1 10/14] xen/arm: Discovering PCI devices and add the
 PCI devices in XEN.
Thread-Index: AQHXlPLlKrcwY4kSPU6FlkOop/ITjqt6w4oAgAGawgA=
Date: Fri, 20 Aug 2021 13:05:50 +0000
Message-ID: <E548F212-5F94-420F-A812-D370052993AF@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <a7fa6f626b0852c7859fe8d64b01293d1aa8fc0e.1629366665.git.rahul.singh@arm.com>
 <367ea162-9afb-1e30-860a-117abaf38867@xen.org>
In-Reply-To: <367ea162-9afb-1e30-860a-117abaf38867@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4120bdb4-b7f5-461e-b7b8-08d963db4475
x-ms-traffictypediagnostic: AM6PR08MB2998:|AS8PR08MB5941:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB5941EA4FA840E81904409486FCC19@AS8PR08MB5941.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3383;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hCPjk9IbL2YzqwThKQvZZjX34wKQrUrNtDBPXbKr3VEQSOT219MN+LYbFDbK2xrEKXO+UGGaq1k2N59RYkOugGibJdh800CTCztSEaYZrj8KLLXwPdsr7utb0HjgzgSbwr/TaXrR/sZzjcIxZ8Ec571bFXR6QUT9q01kB0XiWBgFI0kQKYd+xrw9UeBLA23evN9QFYVtVNy2Z4/E8qqoCoZfOMGGNRrpdeYelkhTkq3hGtlSgPCyPL65JdlCOwOBoIrTl7LmE/wppOj+O37FadfZqTARoEKfiX3G1E2R19F4LDeYfrWpSCkOT3KaZQWGY1AIEugtSGJoGpsUidi8xW2Ef6t3k37lNj1vkTdAphQnTZh/gWSyT73pf5O8kRw2dmkdETD2jKBmwM5yfUcek6v7EXxYwNDZ9Vsqb1OXnahE4I5By5vdhER3Oq76iJGzdum6ipZnKoNUHL3VBanXKM1N49cWIuQqapC3g1LLKyooKH4tYNsDNg9YEAryBJW2GLiYlHSBmLlmzzVBaTelD4V+jZZ6uy6L/r4IReehvsuKiKe3EIaGoYR6dk2C+VGB4AKIqXJKW5PqYbdI4xHVnZulUc+KbXnpCMr4QsKvD/MIcm9zeeOISw2EDm17JDdE4MGZzUkMkrU0kKeJbroBQLvIKnr6Na1S7I1NxWvJdqRPsn0XTB4hU+vqWdm+g0rcX/VIfX9/87R/Zx/BxN4I9wmXiiSVSJRaBokHoVdqCkGG6XVRSxbyMtyh84mKmkuv
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(6916009)(2906002)(64756008)(38070700005)(8936002)(186003)(66946007)(26005)(91956017)(478600001)(83380400001)(66446008)(6506007)(122000001)(53546011)(4326008)(76116006)(33656002)(86362001)(316002)(71200400001)(8676002)(38100700002)(54906003)(6486002)(2616005)(6512007)(36756003)(5660300002)(66556008)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OfmdlTtI65+Iyt3HpmCRK21NFwHhr1k7eQkh3PjPqJOg5LQD7mGKG7C7a2de?=
 =?us-ascii?Q?uTwaIuNWSrfi8AM7+dSLiObhcAMrrCkkE4AaDPpJ2075kq8zu7mkXDh7N6l0?=
 =?us-ascii?Q?aT/t3fQZAQ3ck/qAr7sfjlBnHxtEe2WCizDt2OXh5G737vCDbHgP8VbVO3+w?=
 =?us-ascii?Q?l0dZJQ4SWcTcSaTvgcWf2Rihiq6yumNsj1Cb1SiIH1XDFqFywR0sGhzWDxVT?=
 =?us-ascii?Q?fcRYtc4wjO15IyJx76gNbZL9BIb5VTfaXYgf6verigq3zDZyhxRFwOf0MRrS?=
 =?us-ascii?Q?C5eQ/4hV1X23VX1irJz/j0qvkH0QON2z6ie4Vm6JYELP4SwQngHAHaQngMAN?=
 =?us-ascii?Q?YqjuHUDava7PlsFhOB7FTEMYmcoLW8KqBLNUBraFLKHfFCKG2F9iWb//h5QI?=
 =?us-ascii?Q?h4QYrqmMKD9MD5M+I5Y3pcAs1l//0zzXSNTnKFGzwbHCoifcdfAC0VCiGUTb?=
 =?us-ascii?Q?2nZlXJf60qmb0pEa+2k0G4e+8XdlD1UFEijS0anFXq8L3NCR6PG/y/Dh+H0F?=
 =?us-ascii?Q?84l6Ed8MgnRUpmWz6E0UFdppJL0c44dsfwH5HMX5rw+X2kAbhDCRfhAgtm8+?=
 =?us-ascii?Q?rFRq8+LSMlB+jba7BhKBsixNie+A3rMi6nUxt4ybfsz3S4i3Y5Ykiv4gDqYQ?=
 =?us-ascii?Q?He70R7XIpjTZbl90jGkciDH12LXlTTXIEP5EQmpO9D/Ob/a++hh001JXl3xl?=
 =?us-ascii?Q?YNvqNbRI8EZ05eYzFhk+Yax/R+Dv/91MpB60DayTZojGywPDcurwbVN3NVAW?=
 =?us-ascii?Q?y02JiXrhEMTmhMWqqnugx5P2xwLCRDJRQTaaGMnxj2M3cu+7T+J3Gll6cKBs?=
 =?us-ascii?Q?aLV/v/Tid1mTqNLVQbmsGqzml64HOCRg9ySMoo1FrW/imjTM0ddWqEj+h/uG?=
 =?us-ascii?Q?CKGvtskL4ImfSlafsUGBDYUfxt63LG7KNhzHfChj4SZroH0lmiyE30Cu6W1o?=
 =?us-ascii?Q?bmuQPkFKm1nIn/mEJHUo7lTDXllyER9hI1hhcQfXajHoCr0YXn+kyZYm+1BX?=
 =?us-ascii?Q?YKFAm2Mp5cbxvhu2fzLa0SLWc0uflvYJwbQ3qGueBDWse7RHmwT3BGsDI0MX?=
 =?us-ascii?Q?LyWYwaX9S7+Kc2bhy/UscHyxXFJ4bevtEqIwDnE7JEwbpvqePsjtlyjgEmls?=
 =?us-ascii?Q?Uyiww8hvfYsi/JyzP33QDLSR/MV65MrCvBQh+m5Qwxg+2PwC32ZD5Zra9Qv6?=
 =?us-ascii?Q?9Uis8vnqxRgtZxiRrYF+AH6i5RtyNZhl3uKPttPQ07pb5Wm49PCUVdFZlTHn?=
 =?us-ascii?Q?Uuknx1DNFibemsPatwt0Eu5PEyVLNnQqNj6hTI2b/uSyI+g7rQP1sQDCyB3N?=
 =?us-ascii?Q?FpgJBKcvUGu5pTDP/+x71lUC?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <535EC22978F95D48BCDAD86090F0EA39@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2998
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d169332b-7ee9-417c-48fd-08d963db3c1e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W2vGn29Q4kgQEzFUtQKTIDHAmyZKMIg19TVJbNyGRimtHr7TzzbKBX5zCiAlaoKF9QgzDA3SEiDpIAlVsrCRMGOEalPwcaeaLV4bD0nsFSUohfOidYnyFlM5uTQhOnecFlWalGJFDOt+X+gCDt9UahaPTR2YSwysp3XHACf/qGMO2NZ9O4h0AxtIshU00yP30u/pFCFP+7KcNJhhlhQAJM4oiz05eTMn78+mMi7gn/fh4SO4EohKgmhZOhQM/okqEeKEnC+SJdD9vjib3pFDaSB7x51qFhMcICVwWApcTAqyLhdkYoLpVp+AnHxL1MW+0Cnl5JkfJaQhqNZrnNE4GOfGtwBdC1pdBHpHEEmGI6HEwnBUdTHuiJPSi7FgUXpEpEGfRns9OlVyqOz/ryojit3yenPiFrAf/cpDGyLgs3CSe5F0QaVYWhEiIeXqoiSOHJ42T6GXgSGrltAotezs0hGbI47JrwaW40TZ7Pj3eZtIaorvR88NqJAVXGUFR88rkwVRhSju2zk2GJhVMQDX1KSPLEszbZ631qwgIYOemihr9SRQNlpozGCNohBQYYJAeuStukPLs6cVaO2yI7MbQrj0cltuHjFwKF9xgVrB0d/lOGwbvT7RYCk5H8SIl+JdlpumkMu9qmcl/bniMqjtLWKtt8cqgBp3kXzQN1RDsenAkdMuyeYtg6levcXe1O0FwcucAcOwrJIVStHTA/kpSA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(83380400001)(6512007)(70586007)(508600001)(2906002)(8676002)(107886003)(356005)(36860700001)(70206006)(53546011)(36756003)(186003)(6506007)(6486002)(33656002)(8936002)(54906003)(4326008)(336012)(5660300002)(316002)(82310400003)(86362001)(2616005)(47076005)(6862004)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 13:06:04.6649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4120bdb4-b7f5-461e-b7b8-08d963db4475
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5941

Hi Julien,

> On 19 Aug 2021, at 1:35 pm, Julien Grall <julien@xen.org> wrote:
>=20
> (+ Jan)
>=20
> Hi Rahul,
>=20
> On 19/08/2021 13:02, Rahul Singh wrote:
>> Hardware domain is in charge of doing the PCI enumeration and will
>> discover the PCI devices and then will communicate to XEN via hyper
>> call PHYSDEVOP_pci_device_add to add the PCI devices in XEN.
>=20
> There are other PHYSDEVOP operations to add PCI devices. I think it is fi=
ne to only implement the latest (CC Jan for some opinion and confirm this i=
s the latest). However, this ought to be explained in the commit message.

As per Jan comments I will add the PHYSDEVOP_pci_device_remove() in the nex=
t version.
>=20
> Also, public/arch-arm.h will need to be updated as we now support the PHY=
SDEVOP hypercall.

Ok.
>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>>  xen/arch/arm/physdev.c | 39 ++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 36 insertions(+), 3 deletions(-)
>> diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
>> index e91355fe22..ccce8f0eba 100644
>> --- a/xen/arch/arm/physdev.c
>> +++ b/xen/arch/arm/physdev.c
>> @@ -9,12 +9,45 @@
>>  #include <xen/errno.h>
>>  #include <xen/sched.h>
>>  #include <asm/hypercall.h>
>> -
>> +#include <xen/guest_access.h>
>> +#include <xsm/xsm.h>
>>    int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>  {
>> -    gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=3D%d: not implemented\n", cmd=
);
>> -    return -ENOSYS;
>> +    int ret =3D 0;
>> +
>> +    switch ( cmd )
>> +    {
>> +#ifdef CONFIG_HAS_PCI
>> +    case PHYSDEVOP_pci_device_add: {
>> +        struct physdev_pci_device_add add;
>> +        struct pci_dev_info pdev_info;
>> +        nodeid_t node =3D NUMA_NO_NODE;
>> +
>> +        ret =3D -EFAULT;
>> +        if ( copy_from_guest(&add, arg, 1) !=3D 0 )
>> +            break;
>> +
>> +        pdev_info.is_extfn =3D !!(add.flags & XEN_PCI_DEV_EXTFN);
>> +        if ( add.flags & XEN_PCI_DEV_VIRTFN )
>> +        {
>> +            pdev_info.is_virtfn =3D 1;
>> +            pdev_info.physfn.bus =3D add.physfn.bus;
>> +            pdev_info.physfn.devfn =3D add.physfn.devfn;
>> +        }
>> +        else
>> +            pdev_info.is_virtfn =3D 0;
>> +
>> +        ret =3D pci_add_device(add.seg, add.bus, add.devfn, &pdev_info,=
 node);
>> +        break;
>> +    }
>=20
> This is pretty much a copy of the x86 version without the NUMA bit. So I =
think we want to move the implementation in common code.

Ok. Let me move the PHYSDEVOP_pci_device_* to common code.

Regards,
Rahul


