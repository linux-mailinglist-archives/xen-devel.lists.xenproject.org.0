Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED96780385
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 03:50:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585747.916916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWod3-0000de-Fq; Fri, 18 Aug 2023 01:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585747.916916; Fri, 18 Aug 2023 01:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWod3-0000bY-CP; Fri, 18 Aug 2023 01:50:21 +0000
Received: by outflank-mailman (input) for mailman id 585747;
 Fri, 18 Aug 2023 01:50:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PpBR=ED=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qWod1-0000bL-Jl
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 01:50:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94d19428-3d69-11ee-877d-cb3800f73035;
 Fri, 18 Aug 2023 03:50:17 +0200 (CEST)
Received: from AS8PR07CA0041.eurprd07.prod.outlook.com (2603:10a6:20b:459::31)
 by DBBPR08MB5931.eurprd08.prod.outlook.com (2603:10a6:10:1f7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 01:50:14 +0000
Received: from AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::14) by AS8PR07CA0041.outlook.office365.com
 (2603:10a6:20b:459::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.15 via Frontend
 Transport; Fri, 18 Aug 2023 01:50:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT032.mail.protection.outlook.com (100.127.140.65) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.16 via Frontend Transport; Fri, 18 Aug 2023 01:50:12 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Fri, 18 Aug 2023 01:50:12 +0000
Received: from 04fe78d6ca89.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 15F1B16B-569D-40AA-B8CB-EAE5C28B1674.1; 
 Fri, 18 Aug 2023 01:50:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 04fe78d6ca89.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Aug 2023 01:50:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9765.eurprd08.prod.outlook.com (2603:10a6:20b:616::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Fri, 18 Aug
 2023 01:50:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 01:50:05 +0000
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
X-Inumbo-ID: 94d19428-3d69-11ee-877d-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xARfuKSEikcDT+BGaxiuHbLcZ2Tc1ArbK6FKKiV4mxg=;
 b=BHtWDd5CKj+xPNBhnuKrCpoA74cNiK6QAECV2MzAHJmtWaWtOtlmSIutOIeJ1NXW338gS0SipKIucjwcmimWIcX7z11RWX1LUNyu2Cx0pMA0BVFZ9MFN5HKQ2BgXkmbrWNG+oUUVhPRCF5nUVP5dGup3coOHAQOqpt81wpPCj7Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5cc3b9c585ee9e58
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Io/vA+dvgNk9Jo4fh8mXJbRoBltkOdFG19D6mA6v7+9kx+ZqvFRfj9B1rH0LVaitA7gd5HAbdSVN8O7WNCeMv07Yi7JcqPNGnqPCoEz7/6kJA0q0mSN/KWwjcUpcbr5qW+57lzsL9nrP9tXSVZkRCKXHix+Irf8qEhIQFmxJ4qeAbjhoEPMgL7TOf1MtkUjb7FnapxxQTOzMtY2S0DiuusDfV7nCY4MBgxW19gqwLFcxgtThthEIpmxUIzZPNlgnccYjbMwEAobO1ty10fIf8o2lOsLPmufJXVPf/ZRcXXzAicpVpLCz22t6R9qRkjmtwDD7kPHk27NzbhNwL3bkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xARfuKSEikcDT+BGaxiuHbLcZ2Tc1ArbK6FKKiV4mxg=;
 b=OMNCymg6C1uoTc5rAXG6txIk+DPExP8a86nZDYu1Yd2mHJoXvGnoa72NIqr1rTGxIAyZHW8q5jrtjAxg9s//gVhtFcN1lVZZVHDsb+Z9gwPMH119xbHBejA2lsm7p3vyo9OFllz/Re1V54b25YPWV34TTMJH4UBETayAsRbkbLEmnre/reG2Y7MVJ8zR7GkMhOHupFMsAxUl9qkjbZ/RzO5I0kc/GYSeyLXQvH1xmRzR153J53nuuTswP/g27HFUmbYxmCfDWv6LW5GVURD+404KvNntURMu5Id7D2ai2GhbE0V/nAxQKVo7HazUayIBxYsO2vara03Y/fB9CGfrPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xARfuKSEikcDT+BGaxiuHbLcZ2Tc1ArbK6FKKiV4mxg=;
 b=BHtWDd5CKj+xPNBhnuKrCpoA74cNiK6QAECV2MzAHJmtWaWtOtlmSIutOIeJ1NXW338gS0SipKIucjwcmimWIcX7z11RWX1LUNyu2Cx0pMA0BVFZ9MFN5HKQ2BgXkmbrWNG+oUUVhPRCF5nUVP5dGup3coOHAQOqpt81wpPCj7Y=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/3] xen/arm: vgic: Use 'unsigned int' rather than 'int'
 whenever it is possible
Thread-Topic: [PATCH 2/3] xen/arm: vgic: Use 'unsigned int' rather than 'int'
 whenever it is possible
Thread-Index: AQHZ0VP+MXsKRsPsX0GU2DhsArPDyK/vSekA
Date: Fri, 18 Aug 2023 01:50:05 +0000
Message-ID: <B7314632-8E2D-4C7C-B23C-5D8FB54A15E2@arm.com>
References: <20230817214356.47174-1-julien@xen.org>
 <20230817214356.47174-3-julien@xen.org>
In-Reply-To: <20230817214356.47174-3-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9765:EE_|AM7EUR03FT032:EE_|DBBPR08MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a111ee3-c291-404e-bbfd-08db9f8d767e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ESNcc2zWjcNHR73F2QcnMNLHUoU5CsGOpwRzGsEps+sVg0aonGgoBzu0nHxvhfaDM0z+MqLTH03fSajwetqZDfkGxUkrChAINfGvZRMtzxGvmbW4VPlpSmU/nEo0qLkE0k0sJjsOzmryJXs76C4f+rsrA3M3GGVPDVaSGkFtVBhyILx6QhRowgYrt4SwAnOhjBkZPiRsM1W4XhcUQd9TsykwzYv7ONrtRQAZRIf2EmAj/vQl5cd4LknO91EgfULqW3hdCQIJdwygMPp/eR1qh5+FWwxrb0tKj9GwcuNqrss/lS5b4uAJ7gs0L+VpslMBqoZWFfk5IjaAy0luD7wmsVa7WEFeFp9SZBRtYHgxmuMMaUQv4wCsl0pr18QlTm0PqPPWQbr+F4XE3kZoaMtyjyic4EmZ5ktoiSSbW7J6j2kfrmBnHBKP/J11TSIrs9W4ftGiCz4Yq/6puDRMn6Yo7BHUjBbgfNkOoTCIs0pLaUtkew8Xgwt3jW3uqsmapd69RAoe0i8dMqwSuqouhsA4ElmEz+9W4BwqMKldvkhVbE9jTlIAsMFkFTtBRh9gev8E3dGQNVh527apzvZ38PzCbnU5OKsKscYuv77lmNBHscnwbO1xBQh3avE4pCoA0wnTIejYiiWXYjILBSbl77kPmA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(186009)(451199024)(1800799009)(2906002)(83380400001)(4744005)(26005)(86362001)(478600001)(6506007)(71200400001)(6486002)(2616005)(6512007)(33656002)(53546011)(36756003)(5660300002)(41300700001)(66446008)(122000001)(316002)(54906003)(66476007)(91956017)(76116006)(64756008)(66946007)(66556008)(6916009)(4326008)(8936002)(8676002)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B59BD8AC0738344980BBA1B385572DEA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9765
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c0908ba-cc27-4541-d2d4-08db9f8d71be
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	irAw80WjrUz8mn1ljicWa2PGVzkDmfklmDPMZ7KeYecs81fPlIy/YH6CBuh9c95sKJ3Zw+lGaExaypR1XqM+J8IcvKM8fsE5WFy2bdsPTUpW+R+QsCsW18/OLdAbB3gAkwhM95sEOtdQkeM2tP4HWOA4O0kV3UgQCuOzMUwSPyCyV1M5nu6oJOgmp63qKyCeG28WCZ9E9em2Y5yA3rrCaU7ZwkC/qe8jC9waCHB8UQqy4I92EPi9JxYMIb73YK1RT92z+8I76+inCmjn1JQWBgP2Xmu8fu9ZjfSjBEONECk3LOrk0gzY1xCkjbRhMW1j9fsusiOYrCvh0o035BTX4OE6BiL+zj6+AcvehNgJ4xV6oXnTVqY/0PBkUAUA8lNeESn33HfBBKDDIn0e8KUGBFmyD8c8fUHctq0FtZsINhQlfEVY26MCeuBq+NSVWb9QR968shosB2kYoIkAO5VhV/HN5L7t6J5VhDdJqklpfEW9gqh/5TKDYnHpL6kB5Myy5gBu7llSG/4kYbww+S27nmx/BzvAUcOllmvnpwsYZBmS2BrkC3+du0g2OYXV+eFHT0lpLvaOaGrCcItf8XkqKcJhH7E78YXBS9dlZTcXYmbeVJH0FYHkH5rjLuMbTBGzlBoXfAejMTA8MPzLQ5oZ+v6C/h2fNjrayLttPGxUhwOMpXitAeRG7NrEvXn2hucWd31ijX6BmyFj00nCO0yxkz/CIF3gajhStD6qfhyAxJRKMjr8VYoi3NR4VHgvE0Oc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199024)(82310400011)(1800799009)(186009)(40470700004)(46966006)(36840700001)(40460700003)(2616005)(107886003)(336012)(26005)(6486002)(6506007)(53546011)(47076005)(6512007)(36860700001)(83380400001)(5660300002)(4326008)(6862004)(8936002)(8676002)(2906002)(4744005)(478600001)(41300700001)(70586007)(54906003)(316002)(70206006)(82740400003)(356005)(36756003)(40480700001)(33656002)(86362001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 01:50:12.9654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a111ee3-c291-404e-bbfd-08db9f8d767e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5931

Hi Julien,

> On Aug 18, 2023, at 05:43, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Switch to unsigned int for the return/parameters of the following
> functions:
>    * REG_RANK_NR(): 'b' (number of bits) and the return is always positiv=
e.
>      'n' doesn't need to be size specific.
>    * vgic_rank_offset(): 'b' (number of bits), 'n' (register index),
>      's' (size of the access) are always positive.
>    * vgic_{enable, disable}_irqs(): 'n' (rank index) is always positive
>    * vgic_get_virq_type(): 'n' (rank index) and 'index' (register
>      index) are always positive.
>=20
> Take the opportunity to propogate the unsignedness to the local
> variable used for the arguments.
>=20
> This will remove some of the warning reported by GCC 12.2.1 when
> passing the flags -Wsign-conversion/-Wconversion.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


