Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2C64EEB16
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 12:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297299.506378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEJW-0006uX-P4; Fri, 01 Apr 2022 10:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297299.506378; Fri, 01 Apr 2022 10:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEJW-0006rT-Ln; Fri, 01 Apr 2022 10:15:30 +0000
Received: by outflank-mailman (input) for mailman id 297299;
 Fri, 01 Apr 2022 10:15:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkNZ=UL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1naEJV-0006rN-Es
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 10:15:29 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6c9b71c-b1a4-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 12:15:27 +0200 (CEST)
Received: from AM5PR0502CA0008.eurprd05.prod.outlook.com
 (2603:10a6:203:91::18) by DB9PR08MB6683.eurprd08.prod.outlook.com
 (2603:10a6:10:2ad::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Fri, 1 Apr
 2022 10:15:15 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::9d) by AM5PR0502CA0008.outlook.office365.com
 (2603:10a6:203:91::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26 via Frontend
 Transport; Fri, 1 Apr 2022 10:15:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Fri, 1 Apr 2022 10:15:15 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Fri, 01 Apr 2022 10:15:15 +0000
Received: from 9f101230581b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D11FBE42-38CF-4A1A-A616-6632D55FC670.1; 
 Fri, 01 Apr 2022 10:15:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f101230581b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Apr 2022 10:15:08 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM8PR08MB6546.eurprd08.prod.outlook.com (2603:10a6:20b:355::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Fri, 1 Apr
 2022 10:15:06 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310%7]) with mapi id 15.20.5123.021; Fri, 1 Apr 2022
 10:15:06 +0000
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
X-Inumbo-ID: a6c9b71c-b1a4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyIcrG2CditFEVAGnksGjvybLKcGcz1xBLOn6iY9TKw=;
 b=g9yQqa2Cd2vDJWWA9piHfLG7jeDszQOmbxtMCTDMeb1kUlqKsktE5z0shLZVLMw7PXEmhe/TnsTBEUN1cPoiJHJbRPNBylRo6J32BAtka1DmcmlhiABzZt5sJMFXo47rAjBv2MogpGeoH74hG3qlWhRJv8Ey/RRcPZ2/CrPBA+E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 80cf41e2151537b1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0dD9hpu3Bs6O2x1bzPseLoEAhB8jX+FBJ4frcW58hdhJy9YDuJs0iAjJjcRNEe0okaTGXo44pseIaMhozKwNH9aZ8ZRSN7jx1Snxw2AP3x8ZL+M11nMC3IvEsn3uU1JPikxBnCwv8WPW4A0AaNCrxxVPxi39tTMgxsMY6FB6TiN8M6be35/f3PktzD1vEvXVR6WE+l77XXMylw+c8JfJSx04X1H5nLO2KDetcCD1ZULX4DNQSmimX/G6wp7oIaeWuT0CVDtMlMKCDDOetVjruqBUmVlETgfK5z0wXVGEqPDJTH/hpZFU8R4iMqhgcy3VXeEOQhDK917a0UH0pXHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyIcrG2CditFEVAGnksGjvybLKcGcz1xBLOn6iY9TKw=;
 b=Aln3wi6oRObG2PP29x6qCMfyWivzd9pFJrT9fPN6irk8jGCGtvtcZdsVzam6N6kiUJPcNbZe+7bnPN3hESLE1SwEBxUrHSWNRZjXHqmPnol7GFP8SlYa8G/j1au3dGxKJ9lF6UXiTxKEQPdnImWJvk2RWRVNYo+D7XE1XUwVtuhWN0CUodzEniQekFD3eu40I0Kb3kUtMJBGskU6F70cZl1DYFpELWxfqZ5SeBAdvUQHQGRki4xjb6TSveLVtp/5cQgMA8I6DajhO2rq/J5IUCBwq2GkkXa9H/g7CnFi9/+tZoMGSzw6QBypAoqWpZ/+ONPEMg57JX0eTPPXaaeU/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyIcrG2CditFEVAGnksGjvybLKcGcz1xBLOn6iY9TKw=;
 b=g9yQqa2Cd2vDJWWA9piHfLG7jeDszQOmbxtMCTDMeb1kUlqKsktE5z0shLZVLMw7PXEmhe/TnsTBEUN1cPoiJHJbRPNBylRo6J32BAtka1DmcmlhiABzZt5sJMFXo47rAjBv2MogpGeoH74hG3qlWhRJv8Ey/RRcPZ2/CrPBA+E=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v4 3/8] x86/EFI: retrieve EDID
Thread-Topic: [PATCH v4 3/8] x86/EFI: retrieve EDID
Thread-Index: AQHYROQoBKP2/eH5XEKfptm0g77zk6za2O6A
Date: Fri, 1 Apr 2022 10:15:06 +0000
Message-ID: <08098A0F-D405-408E-AF63-190BC0BF43A5@arm.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
In-Reply-To: <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 81960768-fed5-4da1-6e32-08da13c88408
x-ms-traffictypediagnostic:
	AM8PR08MB6546:EE_|AM5EUR03FT017:EE_|DB9PR08MB6683:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB66831FBB8906BBF6A8FF4744E4E09@DB9PR08MB6683.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1jZE3WlHVB2qkWDT7z83ex0UJ7OVKte0876v7EmAPbTsm++9F41uDSgK+Q4scQRndahetmPEJNsVPVU3dQRztx1q9CoYa0wZZwgA6bxm78cyIDFfx/IJRl0VezxFhaHyBbGwKBdgVKvrDe3fRCXF5dD8heW9ZnlQMVCYmSdreolNtput7EIYyMRnu3/i053mc66JCaH6z+rlm1nATdfyUr0HT5ZQhTdSFHjWd2XyaufPzADdNQ4/B5lMXE7sc5Y7+G+bAIK584QRatkvTDyl4cZ+SRQFQDDIv1WNPWQa/HsdtAp0tFWYwYkHQLzGVJHMTW1mZCro6dsHdwFFZwk2FW/uq7GUoCHL74aRNS95EAmTiQ01u+DMt5JTOvp5keRPruxMkF2coDB1uV4XwR9f2FuYMZSAtZLFhUMiPEpgIrF0Ag5bhI4bg6PSo506LyA8OORRLVHHwjHokbRC3FiOmtetRiE6xniLfrL0TJBlURkwujlytEhjvUDVAr90ktGyLESgxqjvBPeKDEARR86RvkbY+ZtEkmt0WFol3aLMDBKiF6igpIO5shxi5TH8EX3lItwSceOT3rxGc1IgarsSMXC8hjjFc/kifq7F8jpr0k/4MU0PHl4EDuOlu+pla+79KUZGToTGF7R44TdRF9OLcUakubZaM9/FWPRcRgrgbXq/fftM3A4xokvEsDjZKaMEnKTfop9D9GXOaeFvqht6yCvfSQz4zmU87dCNj5MA9ylcktyqLdgNrsupBpdxhJwr
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(4326008)(2906002)(122000001)(66946007)(5660300002)(36756003)(6506007)(8936002)(66476007)(86362001)(53546011)(8676002)(4744005)(66446008)(64756008)(66556008)(6512007)(54906003)(71200400001)(2616005)(6916009)(508600001)(38100700002)(6486002)(186003)(76116006)(38070700005)(26005)(33656002)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F8A50FCE23779E468773569C95085778@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6546
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b12f3b1f-dc60-41be-a1ac-08da13c87e86
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wrHXZ+jRyL/tMvwInLfafLbq5EAaGip20XWMBgHUyfLS7VFPatIXwn0PfYtsrA1qLNVcYS04tEFkzYAVWnNrONAxBnQc9ArL6aa1pf1wp3m4v8AVobCpup9ieYCmOqUyK37hYQJGhWbkfOt/LQIZBuch7R4lP3IE9YaxVVB++yyDCIlu4vWiP7hHk4oBYnAVCRjVeokqcw3mAfkESjT2kaVjBEPqWldOZs63RdAU4hwVbvxtexXQXA7UW9MXW14GxLWtO+AB6wl+9BRX9s+48GVijZkKWSkxFtEb/GsX04n626vYxZGU9KaDM33bLBrRj+TCLCup37QQ00+g3/eP3WQiG5oRZfXfoN1cMQXC0sijr8vmnln1alGJo79Om7HTtjVIukvKtz6ZqAbG076MEoUwsXnMkNz+2ccPyk6N5hJUB1+5a8zPcoapDR+PWNejgyWQu1KcauqRap46Cew3R2BEA08afZ1eMWRRVTxtIjG+Bid7WqvcLmRfeN6MuoiQL0pXBgtrQuAjoIMKeo9iegimRSrH/YaRY4j+h2Fd8V22+13wcp2utMiWXJiFGOGblZ4G1kpvyq8hX0bVohOZ19V6+jnatoVUXc+fts5/jIHcMaitXvIQ+ofU2v5QC1T8vT3hpFuEVPw7GikWbPO4DiA7A2gunAmHnPxhXjhJFmlpKb2Ls3ciRAGyugYYfJn0
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(54906003)(2906002)(36756003)(4744005)(4326008)(6862004)(8936002)(316002)(47076005)(6512007)(5660300002)(336012)(2616005)(82310400004)(26005)(40460700003)(186003)(508600001)(6506007)(86362001)(53546011)(70206006)(8676002)(33656002)(70586007)(81166007)(6486002)(356005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 10:15:15.5253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81960768-fed5-4da1-6e32-08da13c88408
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6683



> On 31 Mar 2022, at 10:45, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> When booting directly from EFI, obtaining this information from EFI is
> the only possible way. And even when booting with a boot loader
> interposed, it's more clean not to use legacy BIOS calls for this
> purpose. (The downside being that there are no "capabilities" that we
> can retrieve the EFI way.)
>=20
> To achieve this we need to propagate the handle used to obtain the
> EFI_GRAPHICS_OUTPUT_PROTOCOL instance for further obtaining an
> EFI_EDID_*_PROTOCOL instance, which has been part of the spec since 2.5.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Hi Jan,

For the arm and common part, the changes looks good to me.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

I tested also the whole serie in the sense that it boots properly on arm,
unfortunately I could not test the functionality.

Cheers,
Luca


