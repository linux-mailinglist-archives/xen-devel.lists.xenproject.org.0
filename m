Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C66965448AA
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344930.570571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFHs-0006IT-1r; Thu, 09 Jun 2022 10:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344930.570571; Thu, 09 Jun 2022 10:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFHr-0006FR-UZ; Thu, 09 Jun 2022 10:21:11 +0000
Received: by outflank-mailman (input) for mailman id 344930;
 Thu, 09 Jun 2022 10:21:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kiA=WQ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nzFHq-0003U3-Ma
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:21:10 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1aa0b4a-e7dd-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 12:21:10 +0200 (CEST)
Received: from DU2P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::8) by
 HE1PR0802MB2409.eurprd08.prod.outlook.com (2603:10a6:3:dc::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.17; Thu, 9 Jun 2022 10:21:07 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::53) by DU2P251CA0012.outlook.office365.com
 (2603:10a6:10:230::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13 via Frontend
 Transport; Thu, 9 Jun 2022 10:21:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 10:21:07 +0000
Received: ("Tessian outbound 4ab5a053767b:v120");
 Thu, 09 Jun 2022 10:21:06 +0000
Received: from fa1dde82cdf8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3231B8EE-8D4D-467B-887C-F4D3DCF4CDC3.1; 
 Thu, 09 Jun 2022 10:20:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fa1dde82cdf8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Jun 2022 10:20:55 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB4240.eurprd08.prod.outlook.com (2603:10a6:803:102::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.14; Thu, 9 Jun
 2022 10:20:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 10:20:52 +0000
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
X-Inumbo-ID: e1aa0b4a-e7dd-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EjJZNvjNU7FyUFMEOiUqy4NW+deF+6nw1yzBZeEC65gBxIImRNZ4Ync3mFfvyQ7d+lCoNsgZKvdqaNrtQnv8yb0zInHfgB0VOBHL/3PXMsdITdOXTH3+po2YT1KsVyJTQlDf1IWucnCgft1H1v8r1kRRbBV87JmmbMriAfPi8cWUyLqV1hFaY6mWLz+1m9jkV/PLDB9NYtFugHrtCtkCiKCLSIQSXo4brITGb3SFo35CwWH554yis8NNrPH4K0c7M3mJVdcm1/A20cBdLFVMkkcZSLk8rnm44jNY1eR6fgR/lukkxLjQoa0KCkHN234Pon9vrLWJxjKILA2mOljErw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBJ7RpNMy22bNKVbTr9syrXjbU6dd7A4FGpRiwc/DHQ=;
 b=l/mvPPUbzEp70q4kXRVQhyXQqu+ad+LMEBe2wtbNqnC8urMsfxZDyLmJk6/W4+FAbbG+e2Ajm+5BlhwUl0rGiklxTOnPxdyHGMCPQKsPh8pXVmodAyBRKd5Xmr8ZBPq5frKTimve6Fy/5VkL7O6HXrZRb4wObg9IqKEe3PcQM8imzHS+ZJwBUZoDCqZ4+/o3S5xYY7kDKdO/VRHnswagR8yZF4vEzVbxMvoLm1yM0r+cRzYteRDAGbnmiRbPanFiu/9CfGCGUfUkyTU5kBi/+33Aw56UmwbzSedQHf8/56hWZ29LMvCS7SpXEuxGi+05wcR+PsImk9gwqj5OJtSzjg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBJ7RpNMy22bNKVbTr9syrXjbU6dd7A4FGpRiwc/DHQ=;
 b=tAcuDYkb/jrLowGbqn77EysGNHrL0GyD0y2rjpUDDSq/5nqLZBWxx1KLqKmg8Fw5kwXlr0DKW+LEgy/2IWH8wSRlTsTDdwNw/hOGLDOyvfzOSFBQKi7wSCAQENbiOTgQYSGDaHpCJTb0xn8/miQMZGo7hNBEYgqn6pfPZLIsaoY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bc655ac6b5cb5bb9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMP2YdQTe5PGJC9dMDyKc/DZpye0pCo4YijfAZY0oQKIr6XwbK+CwuKtE1ImQa0BxZ//su9Vnc4nbRLH0Os4Ru8x8Hs741dDQf/jzXjIda0AOXq2I00DpQUWGuKOZUTU2+mpaNpWlykliDkmfXZKkVJ5xYTYMb+c1o4L7U45JeMVd6Bo6mDZ0BoPLGKXk9riGvRclSdfxE+XKjKklVWqGMSeb+7GPZhB13vrvemMU/cVwksi7mvuj4M17L/QGnKdC4ZyfJSP4kvUQpkTFgg+8NXIkZFLpkwer3T8YtaUaKZ3NlMXYOqK/4T8SxdCBhvE4N0hAd6XEQZEsXhEj8v2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBJ7RpNMy22bNKVbTr9syrXjbU6dd7A4FGpRiwc/DHQ=;
 b=J7csr6f3/cGl/vAsvm5V+nq1A8X18uReJypmz8fqp+UZJdItQcf1V3/QlvhdYTlTLC1k9NodT3XLyojh0vYZfhVGjUp4V99GzTvNoJWdluQ4gf+jrqoWEdRENenHy3ZSLNmi0OSP2cFXgEMhKtrrH2N/oPk41BHqcybmYe+GmJFLQiAluvrhxzepu0iLROKPXXlYUe7s705/R93JGUR0gntZpogCy9dE9dnrZPqk9Jb9XZ1TVoidki7h2w1xL0A71F6QdACwNV7ReH/CkbxVHAAIJymNVyNUqJzRMDktPXvKHtVfRFD5k5n3A1jKNlOF3dte86A97Bzlm4olRknvbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBJ7RpNMy22bNKVbTr9syrXjbU6dd7A4FGpRiwc/DHQ=;
 b=tAcuDYkb/jrLowGbqn77EysGNHrL0GyD0y2rjpUDDSq/5nqLZBWxx1KLqKmg8Fw5kwXlr0DKW+LEgy/2IWH8wSRlTsTDdwNw/hOGLDOyvfzOSFBQKi7wSCAQENbiOTgQYSGDaHpCJTb0xn8/miQMZGo7hNBEYgqn6pfPZLIsaoY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] xen: Add MISRA support to cppcheck make rule
Thread-Topic: [PATCH v2] xen: Add MISRA support to cppcheck make rule
Thread-Index: AQHYe+Q/CnV4rYCY7UiS7+9Bq/v4m61G2wEAgAACZwA=
Date: Thu, 9 Jun 2022 10:20:52 +0000
Message-ID: <4DE73CBB-1C78-4BF4-A50D-69A560C51728@arm.com>
References:
 <56d3deee8889d1372752db3105f3a1349ef4562e.1654767188.git.bertrand.marquis@arm.com>
 <cac6b820-31fe-10d2-50ea-7c7e14e00f06@suse.com>
In-Reply-To: <cac6b820-31fe-10d2-50ea-7c7e14e00f06@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a6742253-4cb5-40f9-b181-08da4a01c405
x-ms-traffictypediagnostic:
	VI1PR08MB4240:EE_|DBAEUR03FT026:EE_|HE1PR0802MB2409:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2409CD163A46EC71DCCC138E9DA79@HE1PR0802MB2409.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 w8u6NUPVfmuj5bAkT/wTGYpUIM33N94q9rGwhI7zgrqyzkTbkNggp2rSzVgRoQF7R65HKdxPvvAeCi/makJrE4Be5QkNia/xEWJa3X9RPYZJVbS5UmxRmiAUM2J6EsGJZKwvzvvRyMqNdh6wrnQTnKAr4dypypBepmJoickac1KsHFTvGEqLDCvNbfxBLGtoWRJWADqOYeUIbaBTNOOUagd2YRhj2a8Q396pNtepeG/e3wR7uDf0cpWD6D1EAdCkN1L6ozQ6rxGzUAE1O+ba4XTl7NJnUXj7i++0EIDGh8P+MuFkOFpLJzIjYZSY3FzUuQ4VqgX3HTFqTV2Zp8IL2cYMNmLvGCa/Wrd9eW7UHhAir0n0pioqgTjIWi1nO3tTUV5Tk4nWoaixMQhK9ZSqpZoCdM8imTisU0U00aEeuFsEfy8ozoXqpbQq5CkCKklmrMraPI2fPkgB8SeWyZnnn0MKYfgP0XX/5wa+wQya48CdDzwCW2PcEy1wUpFjR92x0J+c8rM8yfeVpfrrdFWScif8YO1ske62OjttxVnbNF09hle2QqRzcW6HqbRWgNfMAvJYtKZDRk92mIcQALpqQlmkFl23g2DSTC8U/U8gh1iBQZ2IJKZcfn3lYg5R0Es9huB0eKZBT2RRmtwapH3h4/YGtZFA+O8NO8oDyHdBoUfvm3rc4qVQWU+oHgmZY2p8Wqcm5Ub4ulko8o2enbhUNAVmLe5g5MQ1+RYOx8UFTczvudbZjebUwNwzkPa4mVoa
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(38100700002)(6506007)(508600001)(26005)(316002)(8936002)(6512007)(76116006)(6916009)(5660300002)(54906003)(186003)(83380400001)(2616005)(33656002)(53546011)(36756003)(86362001)(6486002)(66556008)(71200400001)(2906002)(38070700005)(66446008)(66476007)(91956017)(122000001)(8676002)(64756008)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CD96332016D6A647B208EE6ABFEF1CCB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4240
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d69cae93-f7be-41b7-38fe-08da4a01bb55
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s+Hwd09BBsNt3nyGY6r1WAUu+VqbxlzxOvy4MmiR4f0MFsRhF1rCYIq5cfb+mo7C4Qgv1g1iZeBOyan9OYrSCMP1subJDfpEAbbKt6Agkqa5n2RYbMQXCd5oLwscMYe0L6f353bB+lFsc7Py+4Ug004sMZU/Baw8BCzKp7/deKKGHm0MWDC7ckPzaNk+FEz6Nk5cQgfkSDIaBwB9TO/xj35cXu0fx+L/E7qwngWJWM0drQKjFroANWRrni3ePIqFVQrLxvUqOYvdXl+fcx+t1uxzZcssVoH4YDn8UIoOfanNCwWdw0swe0ks/gpPlLjmCpfFeZ3wuNY2xbqrGWenpcOD9Igdd1s0GfiBUJbmPvJoZ2W64NIroegY15nTZM4hYcBYBRHY+YAqpM4NSUlDGYsGX9sUJuaZUPOhaWFeKtIEMbNJ7wlnhIjP6ysldULimRtJ1k/GQ6ys36wfNlyG677a+cvKk4YtmaIdLTrNiJaUUOedb5Oto7rhqn2eRa1RxQ0638iranld8CfiLXK/hWV1pbBJtEeSca1bgkMS6ShScw9GcSxCRy+bzqOITE2uRz13FgD+1B7fKdB3dAJMNnbVhcQYeUGXdud0T1RVR6MUVEP8lc8Ybr/b743lC4+VmiciEsKe/VRtzwV1Y2RIlN31dx0HYbOihrJMpq+lb2X0BAmN5fuo5u2a0YjbJ6gt
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36756003)(70206006)(356005)(40460700003)(4326008)(2906002)(6512007)(26005)(316002)(86362001)(54906003)(6486002)(508600001)(33656002)(53546011)(36860700001)(47076005)(70586007)(6862004)(8936002)(186003)(336012)(83380400001)(81166007)(2616005)(82310400005)(8676002)(5660300002)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:21:07.0320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6742253-4cb5-40f9-b181-08da4a01c405
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2409

Hi Jan,

> On 9 Jun 2022, at 11:12, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 09.06.2022 11:34, Bertrand Marquis wrote:
>> cppcheck MISRA addon can be used to check for non compliance to some of
>> the MISRA standard rules.
>>=20
>> Add a CPPCHECK_MISRA variable that can be set to "y" using make command
>> line to generate a cppcheck report including cppcheck misra checks.
>>=20
>> When MISRA checking is enabled, a file with a text description suitable
>> for cppcheck misra addon is generated out of Xen documentation file
>> which lists the rules followed by Xen (docs/misra/rules.rst).
>>=20
>> By default MISRA checking is turned off.
>>=20
>> While adding cppcheck-misra files to gitignore, also fix the missing /
>> for htmlreport gitignore
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in v2:
>> - fix missing / for htmlreport
>> - use wildcard for cppcheck-misra remove and gitignore
>> - fix comment in makefile
>> - fix dependencies for generation of json and txt file
>> ---
>> .gitignore | 3 +-
>> xen/Makefile | 29 ++++++-
>> xen/tools/convert_misra_doc.py | 139 +++++++++++++++++++++++++++++++++
>> 3 files changed, 168 insertions(+), 3 deletions(-)
>> create mode 100755 xen/tools/convert_misra_doc.py
>>=20
>> diff --git a/.gitignore b/.gitignore
>> index 18ef56a780..b106caa7a9 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -297,6 +297,7 @@ xen/.banner
>> xen/.config
>> xen/.config.old
>> xen/.xen.elf32
>> +xen/cppcheck-misra.*
>=20
> As said on v1, this wants to be added further down, while ...
>=20
>> xen/xen-cppcheck.xml
>=20
> ... this line wants moving down at this occasion or in a separate
> change.
>=20
>> xen/System.map
>> xen/arch/x86/boot/mkelf32
>> @@ -318,7 +319,7 @@ xen/arch/*/efi/runtime.c
>> xen/arch/*/include/asm/asm-offsets.h
>> xen/common/config_data.S
>> xen/common/config.gz
>> -xen/cppcheck-htmlreport
>> +xen/cppcheck-htmlreport/
>> xen/include/headers*.chk
>> xen/include/compat/*
>> xen/include/config/
>=20
> xen/cppcheck-misra.* wants to go alongside the line you adjust, while
> xen/xen-cppcheck.xml belongs yet further down.

Sorry I forgot that part in my v2.
I will do all fixes including xen-cppcheck.xml one in a v3 shortly.

Cheers
Bertrand


