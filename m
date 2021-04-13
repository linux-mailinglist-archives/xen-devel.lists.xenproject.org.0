Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ABF35E0C7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:02:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109767.209509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcG-0004s5-Kf; Tue, 13 Apr 2021 14:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109767.209509; Tue, 13 Apr 2021 14:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcG-0004rb-H2; Tue, 13 Apr 2021 14:02:08 +0000
Received: by outflank-mailman (input) for mailman id 109767;
 Tue, 13 Apr 2021 14:02:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJcF-0004rK-EV
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:02:07 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f706b10-97a6-4ef3-8c94-0b990a922eb5;
 Tue, 13 Apr 2021 14:02:06 +0000 (UTC)
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
X-Inumbo-ID: 9f706b10-97a6-4ef3-8c94-0b990a922eb5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322526;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=0Z9bLa3Of6ehyx4kNWG7tTOMC4d6bLSrky0iA51bLt8=;
  b=f0NYHJDaTPgqlL+rhF/a9FlM2drqBdIm/sGmSPrFtO6E1ilpsodbmLtT
   ye6VEG0lE1FaOvx5P59Maq5gXaLWN7JAV6cMkGH4GIc+u1Vzw+6Pajh8W
   5vTXx83fQrej7Bw4TqAL50Og7ikptGR7smpiXxbgp0h8AeYxDIH+v5o8v
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rTCzCnezs2/a1q15+916qSQliMPcyYRgcH8b6mORBVMV5k3PtPQCK7FD1P5Cg79kxPL1cCkElL
 8snMS1sOugxYScpDYmQKx6C48cunOz1+YqXkS6wb0DFNohKZWy/YR80s2h+6w3N+GjGmUyW4oX
 M/Ba4JP1hN9yjJxAn+3SGG80kYOaG5FQnmMGjJrXr53NExKI/RCgiLntRAt8KXM6jsOwTJdf6e
 UgLGagThj0RusoDEY2NeithEi9tKuFzojJwOa+QvxbFUQCsJcgD1V929iJiF6tmYnrm7Z5XoQT
 8So=
X-SBRS: 5.2
X-MesageID: 42955851
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:V7Qx1q2LlN6n4cJdP6gNdQqjBTd3eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/FIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmtJ1/Z
 xLN5JzANiYNzVHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcBdxi1SYzzrdnFebg9AGJY/Cd
 6g/cJBvTWtYjA6ac68C3kDUYH41qH2vbjhZgMLAANi1RmWgVqTmcPHOjW7/jNbaTNAxr8+7X
 PI+jaW2oyPu+y2oyWssVP7wI9RnLLau7l+LeyKzvMYMzD9zjuvDb4RIIGqmBAQjKWR5E0xkN
 /Kyi1QT/hbz3/KZGm6rV/M9mDboU8TwkTvw1OZnnfvyPaRLFlRa7sj9PBkWyDU5EY6sNZ33L
 gj5RPii7NtAQ7dhyO43tDUVnhR5zuJiEA/mu0ehWE3a/p4VJZtq+UkjSZoOaZFNif75Ic7Kf
 JpHcHR6d1HGGnqEUzxjy1BxsehUW80GQrDak8eutaN2zwTp3xhyVAErfZv0ksoxdYYcd1p9u
 7EOqNnmPVnSdIXV7t0AKMkTdGsAmLAbBrQOAupUBvaPZBCH0iIh4/84b0z6u3vUocP1oEOlJ
 PIV04dnXIuemr1YPf+nKFjw1ToeiGQTD7twsZR69xSobvnXofmNiWFVRQHj9agmfMCGcfWMs
 zDea5+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49RhagucTOBor2tvHKUfraKbb3eAxUGF/XMz
 8mZnzeNc9A5kekVjvTmx7KQU7gfUT54NZRHcHhjq0u4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66itqu6oGKx7FvZ9mkBAGsYMm9lpJHbF19arw4DNE35NZwZvc+ERGxU1HybYjhyUt3RCw
 wag1hs46q4I9ixyEkZepyaG1Pfq0FWiGOBTp8alKHGz9ziYIkEApEvX7E0Mx7KGRxzkQNDs3
 xCdwcAe0/aGlrV+OaYpa1RINuaW8h3gQ+tL8IRg2nYr1+gqcYmQWZeYySjSveNgQElRyNdg3
 p496N3usvGpR+fbU8ExMgoOlxFb2qaRJZLFh6Maolvlrf3Qw1oVmuRiTuGixY8R3ry+ywp9x
 /cBBzRXcuOLktWu3he3Kqvyl9ye2mHV29ba3xxs+RGZC/7k0c29dXOSru40mOXZFdH//oUNy
 vdZyAOZil0wcqs6RKTkDGeNHkvy5k0JNbBBLA7f7y74ALqFKS40YU9W9NE9pdsM97j9tIRWe
 WEYgmPMXfWDfgq1wH9nAdSBABE7F0f1dXm1x3u4DLmgDoRAf/OLE9nQL9eCdeG9GTgT+uJ1p
 I8rd9dh5rFDkzBLvq9jYfQZHp/DzmWh0icZeQhs4pVsqI/r6EbJeiSbRL4kFV8mCwjJ8L1nn
 4ESKt14Lr9KpZiFvZiDh5xzx4MrpCzN0MlvQz9P/8mcXwsh3HdOcmV47Cgk8tZPmSx4C/5OV
 yS6ERmjo/4dhrG8b4REKQrJ2tKLGA69XR55euHHregQjmCRqVm/FCgNGW6f6IYYK+ZGa8Iph
 I/x92TheeYe27Z3w/X1AELb55mwiKCQcmoBhiLFvMN29umOU6Uiq/v2fWNtl7MOHKGQnVdo5
 ZEe0wWZtlCjTdnrLRf6FnMdoXH5mQ/k1Vf5jl7kEXKwYbO2haDIX17
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="42955851"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVSHbZ+AuFB66qVIV+dDETUr3T2iIvOQJ3KwteRPqFS0TD87Zi+cHRGTYG5MsGrDVSvUrhV2f0LbqV2KIOsaOR3x+ANVVgmoYItXYTlC16vsHOsn9V1egj7cal+2jvHAcqjmLqNkV7FbvAWpGhBXc8d2nWbk7yaesGsxtPVweNR+oeM5zvL2keRnqdqZMwvaE+3nBWlDN7okpLv0Q39Y6Z+GrTVXAAcEYbG4RnH9NrUn/US0hfjJ/ZlOTQdrIYa0tFzkW430gJdTu9Oi74C9NNKLetW1d7KkWc4sWt/KeGu7BZtMN67cVfWMqddWXcQmkZ1Z8mzbx9LWfUEIWi//Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiXg4RaaWYgPdIkmGYs/6vFIpLjmbLaKb/fElO2iGok=;
 b=d8Dq5X21ymlAiJOcAeJ1XUnp6jbeGwAD4PGccB8i0tEmo5NwOshm+21jJqcWYZVK366Chk9rxHWEZ9GmF0ypYqCjHOXWD6w5GS0BrFu3g0M1mQ6Z9X7F+X26M5RSKHgOoZDbMJnc8F+G3SrHXx9NDdiYEQy0vh1AyaS0CVKB9mVVGw9oZTQJUchH62x6lbqdqLejIm2NZTD9wDab2Ev1uy84URzGa0cir+XTyO99v+ZbftTLgqJcTeOI4ntGbDdXhdUrSaCJ57Ov0Zuts/irxFKn9w8wzs8K0KLyFjBfVX6laAEXDkZXdrHcjbjplL/4bwGFt1p4ifJahgr6uVqFzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiXg4RaaWYgPdIkmGYs/6vFIpLjmbLaKb/fElO2iGok=;
 b=eJ5xqxkLinkGPcsVXnwbLFJTrgzUeQ+MTtJ37UJGmIIDreHUBVkg6sYlD2yL18g8DJpT4v+oBj8tuysUTG/agGmFbR001zqax6aJpgfj7FYPOOKyxdmTkBoOXjlGjdRvwqraHnUScSD3DGkQgIV3H6STsfKgA+wgeh52jDuj420=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v2 01/21] libxl: don't ignore the return value from xc_cpuid_apply_policy
Date: Tue, 13 Apr 2021 16:01:19 +0200
Message-ID: <20210413140140.73690-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0134.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb95fbd9-47ee-414c-36cd-08d8fe84b65d
X-MS-TrafficTypeDiagnostic: DM4PR03MB6096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB6096243BD580571246CF70B68F4F9@DM4PR03MB6096.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xu+ohUAqjLQ049XEbtMgfk8/5ndfnbzurHyGlWfu+0zqa8qT31L8xvJIwKU+CTopQMLL2PooOIVpCiA7u+Qw7B6NM4XcwFPMI3jbcOJGIvFnBDq0GJ9PacqV9wu35SLaB2LRRSQOByUmOr21hb2jrX0oK6u6v5IMhjHUgXfA9OsxJwXhP2cpQJBsWvRt4/6hN/NooclFIDN9hjjFkGYuce/Ksm7HLBUQSmO8ZCo9+czDdaQBEDYDsJ3O//6zPlCXTzzIPW5rt4IjdZej0WS1t6D2T7Zx47ZVM89q0dm5paBNqfwDNA691/z5T7ouvn1vpwhvFgwLnCYQke9Bw8l3rslvKLtNg9h3yFnRWSxla4IRtyuHEe3uBCLNjJpK0DSwZ80KLS6obBFQtHgWasdoUidUuWy0P1OPwTxj8QvSEXWT34Cqth6UvKI8zrN+arvPnN6r1mhBkCYcIBJJjFqjfJJ27v+gYDyQdFs0SW6LD9kGjD9EJmvQR+PTrsSn6OoHVbaTgEcLimGciAUGZNJ6UK32LybhR7Ras+dt4Dt3/wooGIv0tK2Dl/nfenlPlhzdSSBJ6Kw5iKGtV8Wm99Skbm9k7GaA+evCQHcDp++Y9kc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(39850400004)(396003)(346002)(26005)(6916009)(86362001)(36756003)(83380400001)(186003)(8676002)(6666004)(16526019)(66476007)(66556008)(54906003)(2616005)(6496006)(5660300002)(956004)(38100700002)(478600001)(1076003)(4326008)(2906002)(8936002)(6486002)(316002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N0F0UXJwa1dqbUNWL0oxckJWYlhCT2hiazVud1FCdG8ra0trY2xDQkh2NG1C?=
 =?utf-8?B?eEl4Z1VvNHI0dFlQVHFhN2poSkdEaVpiT2kyYWpRKzlXSW5pdFU5Ujdjc0Vm?=
 =?utf-8?B?SFRwdjJBRVNpczFkeHF1eVBLZ1F2dmJhWHA0QVFUZnZLaTJ6U2JXTTZpZkpL?=
 =?utf-8?B?SHZzT0RDNUZzbG1Sb3BLSm9GanFsbTNxWWdFSnJHdmwvbnl6Vy9jUXpsdFNI?=
 =?utf-8?B?WHJFQzRCdFBaeVZpdHc0MFFDTThSRHZ5UlQvZXZUVnhQVGV5cGdtdXNCY2tn?=
 =?utf-8?B?cm95Y042d3RzaVBxVVBTMjR5dWE4cm9lbVJaS1cwS3dTRTQ0b3hzSzNKbUx0?=
 =?utf-8?B?Umc5WGJMUFI1YkxCVVZjc2owUFlzS3ZMVW1NQWFuTjJwekM4S1Q3S25xK2ZF?=
 =?utf-8?B?dms0NGVBMzdQaTdkWFhhOFZaZllzNnkvY09uUG1VZkprYkl0NkV2MnRRSnBG?=
 =?utf-8?B?Vk0rTCtPK2RNTlllWnp0MU1Eb0d0YTk2cUl6UDNrbnFYREIwdXJWNW1hRVVq?=
 =?utf-8?B?RjZycUdZSUdTR0JaZTB6a1ZHUFBiVnJLSm5uNm93V0tieTMxcnZ6OS90R2c3?=
 =?utf-8?B?Q1BOSUIyKzd1TkZ3SSt4VzFqUlJ4d1BHQVpsbExCR2pjRDhQamRaekYzSXRY?=
 =?utf-8?B?cVhmRnVpZHI2TkIrYllqV0pVOThNZTJQYUtBOEU0cmFuMWpNdnR0LytGbHB6?=
 =?utf-8?B?bGE0NS85MGhiQWZjbFU3OHhiVFkvTTJKUGJaNm52RTF1cStKalVGdmR1Nk1W?=
 =?utf-8?B?ZEh5Z1BDSjdCMGI3MDl4dWd3eTR6RUt4WHd4L1ZNU1FTc2hCUVIza1EzQlk4?=
 =?utf-8?B?bm5jdGdCZ3VuS01jVHUyWGkwSGJwbW1Qa3VNMjFaUDB4ek0vS01uSUdCNTJK?=
 =?utf-8?B?ODB0ZDJEZlB4SjFuWEZaZ2hWTWhOMFowTXRvaU5maHl2cUFwVVF4clBVV2Zp?=
 =?utf-8?B?VnNGRmVGU05GcWJvNjRzYTJ4YUhoTFQvcklpRnY3bDFDMzNFbDNUeVFUTWtL?=
 =?utf-8?B?Z1RZMk5HZ0RQYTVWYkNCYTcrQjRlNWFFU29LLzFraEl3V3FiQkl3cFVoYTFI?=
 =?utf-8?B?ZU1Ed0pWZHQ1WFlRRUpBejJZK2JPbGh5cm9zSHNrTWhUd29iRDV0YVdGdmp0?=
 =?utf-8?B?ckNMaFM2SlpIbmVXdEI5UlB3aG9uaE9pcERtV3NSWVBvYkh6VEp3TDJrSHNB?=
 =?utf-8?B?U3FLdEp4L2h0ZnczZUpaK0p0a3htSEFPSU9JcEdUNnExUE14TWZOUGMxd2hp?=
 =?utf-8?B?czFLaTVuNzlET0kwVCtPQ0t6SkxJT1VXcFNxanFrSXhKRFNBMVhiN2paaloz?=
 =?utf-8?B?bGdRdlBoanhteDI5Zkp1MHlnZCtxQWNvVnZnV2N3OVFqSm5FZnI1MmNVWndl?=
 =?utf-8?B?eVVBYkVxOFlqOXpKNU9MUzdZN2psa3hZakhqR09UZFFUa01TVDJZZ3RzM1Nt?=
 =?utf-8?B?OHZxMG9HQktSOUVMenlWaTJDSUFuZURRU1pZdm55L2hwVUdWU0IwQXBRWmhT?=
 =?utf-8?B?b0RDL1JuQ1pVNnRsOHgvbVdnQXI3bldmdHQ0ZVVyNTNXcUF0eWovTEJQQkUz?=
 =?utf-8?B?OEl2QXkwZDlHeVF6UmY2clVjcVZQenV2bVpiTjdCNG41c082LzN1NE9wcUtF?=
 =?utf-8?B?MVU3b2lkYys3K1gvRGpObHc3SGEzR0JoUkc0MGd0ZXdJUjE0cDVETTVYR3Y2?=
 =?utf-8?B?cXY1RHk5QWtLcWMwMUM0V241clExQmo2RG9lRjI0UUgzYWZCS1ZWKzc1ckE2?=
 =?utf-8?Q?/t+1Joq3vJzBOThwZgViYFZjkOPydlFtR1TWN/+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb95fbd9-47ee-414c-36cd-08d8fe84b65d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:02:02.2690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fi8tEj8wb3b41sumVcZ8BAFMe6WNwVKOX8Coevm0IIMsbxWTspotNiCZP50Gh3DgEUFfLKdNd6qWJiuK7rHk0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6096
X-OriginatorOrg: citrix.com

Also change libxl__cpuid_legacy to propagate the error from
xc_cpuid_apply_policy into callers.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since 1:
 - Return ERROR_FAIL on error.
---
 tools/libs/light/libxl_cpuid.c    | 15 +++++++++++----
 tools/libs/light/libxl_create.c   |  5 +++--
 tools/libs/light/libxl_dom.c      |  2 +-
 tools/libs/light/libxl_internal.h |  4 ++--
 tools/libs/light/libxl_nocpuid.c  |  5 +++--
 5 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 289c59c7420..539fc4869e6 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -419,11 +419,13 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     return 0;
 }
 
-void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
-                         libxl_domain_build_info *info)
+int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
+                        libxl_domain_build_info *info)
 {
+    GC_INIT(ctx);
     bool pae = true;
     bool itsc;
+    int rc;
 
     /*
      * Gross hack.  Using libxl_defbool_val() here causes libvirt to crash in
@@ -462,8 +464,13 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
     itsc = (libxl_defbool_val(info->disable_migrate) ||
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
 
-    xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                          pae, itsc, nested_virt, info->cpuid);
+    rc = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
+                               pae, itsc, nested_virt, info->cpuid);
+    if (rc)
+        LOGE(ERROR, "Failed to apply CPUID policy");
+
+    GC_FREE;
+    return rc ? ERROR_FAIL : 0;
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 0c64268f66d..2faa96d9c68 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1443,6 +1443,7 @@ int libxl__srm_callout_callback_static_data_done(unsigned int missing,
 
     libxl_domain_config *d_config = dcs->guest_config;
     libxl_domain_build_info *info = &d_config->b_info;
+    int rc = 0;
 
     /*
      * CPUID/MSR information is not present in pre Xen-4.14 streams.
@@ -1452,9 +1453,9 @@ int libxl__srm_callout_callback_static_data_done(unsigned int missing,
      * stream doesn't contain any CPUID data.
      */
     if (missing & XGR_SDD_MISSING_CPUID)
-        libxl__cpuid_legacy(ctx, dcs->guest_domid, true, info);
+        rc = libxl__cpuid_legacy(ctx, dcs->guest_domid, true, info);
 
-    return 0;
+    return rc;
 }
 
 void libxl__srm_callout_callback_restore_results(xen_pfn_t store_mfn,
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 842a51c86cb..e9f58ee4b2b 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -384,7 +384,7 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
      * being migrated-in/restored have CPUID handled during the
      * static_data_done() callback. */
     if (!state->restore)
-        libxl__cpuid_legacy(ctx, domid, false, info);
+        rc = libxl__cpuid_legacy(ctx, domid, false, info);
 
     return rc;
 }
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index c6a4a187f5b..44a2f3c8fe3 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2052,8 +2052,8 @@ typedef yajl_gen_status (*libxl__gen_json_callback)(yajl_gen hand, void *);
 _hidden char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
                                     libxl__gen_json_callback gen, void *p);
 
-_hidden void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool retore,
-                                 libxl_domain_build_info *info);
+_hidden int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool retore,
+                                libxl_domain_build_info *info);
 
 /* Calls poll() again - useful to check whether a signaled condition
  * is still true.  Cannot fail.  Returns currently-true revents. */
diff --git a/tools/libs/light/libxl_nocpuid.c b/tools/libs/light/libxl_nocpuid.c
index f47336565b9..0630959e760 100644
--- a/tools/libs/light/libxl_nocpuid.c
+++ b/tools/libs/light/libxl_nocpuid.c
@@ -34,9 +34,10 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     return 0;
 }
 
-void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
-                         libxl_domain_build_info *info)
+int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
+                        libxl_domain_build_info *info)
 {
+    return 0;
 }
 
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
-- 
2.30.1


