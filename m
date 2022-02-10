Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57BE4B0F78
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 14:57:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269862.463997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI9wP-00068S-3s; Thu, 10 Feb 2022 13:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269862.463997; Thu, 10 Feb 2022 13:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI9wO-00065B-Vb; Thu, 10 Feb 2022 13:56:56 +0000
Received: by outflank-mailman (input) for mailman id 269862;
 Thu, 10 Feb 2022 13:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=06a2=SZ=epam.com=prvs=40400e4a88=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nI9wN-000655-Sr
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 13:56:56 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d24482e-8a79-11ec-8f75-fffcc8bd4f1a;
 Thu, 10 Feb 2022 14:56:54 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21ADsnnc005870;
 Thu, 10 Feb 2022 13:56:50 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e540pr0kp-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:56:50 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7316.eurprd03.prod.outlook.com (2603:10a6:20b:261::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Thu, 10 Feb
 2022 13:56:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.012; Thu, 10 Feb 2022
 13:56:46 +0000
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
X-Inumbo-ID: 4d24482e-8a79-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsRibKuBw4NG5htbv2bVsLhf/kuYGy+yeOqieJhqrmOCcWoaXZacsjl3bz6zJSF+2jd1p4vZCi1B3DuUvTjKb/QwIpOiK+XlmPgkqZaMACmZITun5OAsIOd2DLrqqkTeJ/fyRlKFh7vGsTn6lhneXSXIWEVetOb6SyIiYpt3aNwzXi1NuX4Jujq/hbGgpmw/dXI0SD/VWqA3IEs3pxMQLy2ulk0MDPMBHU0f552k2hCtrzVZ3rjM9ZWGrQiJj3mzbPC+XO3uekSnDMAy9P1ZLzJ8jIJgV/9V7XL+9NrT5mRfKRQpAc+POxvVzQMw10jKVhS4EJosrCuRnNJu86GZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoexHjlOaY9F7iVbP1Pg9SayF11zkzAFwoN8Gzo86KI=;
 b=hsLT7puvPs2ypzNko+fgJ46oIViPNYtQ993hlPigjpkO+uqG7n15XUYRAaLhmn3n2x/RYQlob1SMBRauCdYxNlOnS2iE2I9mNpgRWyYvYUngt8wOvVEIMpGVnp3fIAwFOiTJWTcgi3tNjdVYplTzPNefA/OLQKX3KTzST1VmPgZX8WX7GJ2cdj5O3EC8JVOmELCn6opYdwgmAfxDorGuzCm9xntA4BIEoOcKR7Os8/UnzmdLcTCpCHnEuJyyJ4IRanhLrJ5YtHwEXvi0TOIXyAfi0gTkKEKuk0fWqh3Fng+Dg4t02YbwzpWCtZ97AARfBDnjSVCgudKclVU3h0P2ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoexHjlOaY9F7iVbP1Pg9SayF11zkzAFwoN8Gzo86KI=;
 b=GBwi4G/++PPaHlUTnhxMgMXe57G0FLmf+5Wg7MxE9K/22qKw3eqT2NM0v0XVdvymNC4JMugmmi9nMKmRI9yvnJvMwgMtpgE17a8AZLXKxHi7kE/bctQcVvt3pPyKca87MlbbeAvlA5nlErXfWm5zuIWCHqWlUPczxV0gE6Nd6hSeIWEir5FCZXXpLrMqoXy3UTY5zf+GRXHxsPW7Tuzb2iRJoitzhmYfrxcKxo9Mo/XixAMdrMXN5VObOpK7HDSl4fBrS00bgu7MIBv84WFPQ8+WXeoOhUtOGakoDosIrSx7cz+/Rk3y9XfKWk4JCqLSu66VJTT6AflIfdL34slNMw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Topic: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Index: 
 AQHYGZFg3nazYSvfA0G+yHTbxcxX2ayDdFgAgAAB6wCABD+NgIAAQmgAgAAT4YCAAAOjAIAAAPCAgAAXGICAAAPHAIAEnAeAgAALrICAAAWzgA==
Date: Thu, 10 Feb 2022 13:56:46 +0000
Message-ID: <56623ff4-e7a2-abc3-f4ed-51ff0db4ebd7@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
 <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
 <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
 <6f0a015b-c48f-76ed-9a51-39c045ff5927@suse.com>
 <2ad372d4-a181-9307-ef50-a5adb61dae66@epam.com>
 <49380584-0577-96f2-ef1c-a96eabf0d227@suse.com>
 <fbd410d1-84ad-2309-ca05-b9ac7f95f1f9@epam.com>
 <dbef1c95-818c-427c-1963-75d584843cff@suse.com>
 <f34cc940-7f5f-aebd-60d9-d1a3d85d1283@epam.com>
 <8f35e7c5-3193-4b10-ae25-df838e2262c7@suse.com>
 <22084dc5-ba16-3e63-8be6-a8c5c79c9cb0@epam.com>
 <33d77918-aee6-77ac-6999-2277f5db8850@suse.com>
In-Reply-To: <33d77918-aee6-77ac-6999-2277f5db8850@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2222a1c3-fe09-4775-f41f-08d9ec9d2d86
x-ms-traffictypediagnostic: AM9PR03MB7316:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB731646AC355922505143F387E72F9@AM9PR03MB7316.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WU7iUmyhmzfc8OE7A5pia2QTZ2DCgO0t2KCb2RE5q/ktQO77jperbRFnIwtaLmMl7KxWBIrLXkI9BDDK8YncWLlc/XEqIXeQQ9kWxPXosIlhVCFp8xPVeTt1o3mQsWnvzFSeaq5utWOoe2Gbmht4Unx7M56dKB6qsnb1mjo3sTLx9wqhUUAJVOHaUt8qvKGFSWJ/FvGWZKF2W54G9FsbVb1H4R44p3Kgd18WtmCgHuOlcweTkLMtVLMxtmdnupE/9MNiX+sujRlfLvRin+NujJc+H7ClpXQ5ljtBOm41ktavm2wgS3/3cXAeijznFk9Vout8QTvp94hRhKNw77eXnE2+3czFCRP6VQ1gI4RKojSION2k6N0Yin5s4kukWo7jsQV6EuC+o3TCNqOh3K9CR/BtWvLxJN4NovTaWBYZMj01lQqhlbXnGgR0NmLMa4sjFYLzrH21iXrZyflUgX7PtwY6L6LPjQGPYbmrhWkRDChgoyh6L+4aOVPlvyGvEZo5lvoDR7M8pBvj9VTEL4g+cZwDroZxcZLf2YgumWAkJiQIxLFoP6N0bESjHGRwVNAIS4M53rOQMFGc9QcQa/D01GM5cvRlhwrXURI9wDOY7TfRv9H5jVKOH9jUMr8/i1LmNBFY96Y4bnzqRHWapk8xLYAiqK+TxxCvndLOR6AyvjlXOoYuzvD/4TVvRLJ5k7utWVGWlpOeX+PFG9wKj80cLO2JqxG7KiEVXLg4tJRTuvgoqcZHEQ0LOaeJijHUfF/O
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(2906002)(66946007)(76116006)(6916009)(86362001)(54906003)(31696002)(66556008)(6506007)(6512007)(6486002)(5660300002)(38070700005)(31686004)(91956017)(36756003)(38100700002)(508600001)(122000001)(2616005)(107886003)(53546011)(71200400001)(4326008)(66446008)(8936002)(8676002)(64756008)(26005)(316002)(186003)(7416002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bUZtSUU4WXlPYllSTkMrQ0FQK29tQ0RxWjNzZmVDUWlLbXZiZHA3VVBnQ01L?=
 =?utf-8?B?NDV2RzFjSzBUeGsvWGMvajJxY1hrNzgxOFI0V2FkV25ITWlVRlJZdGZTMktG?=
 =?utf-8?B?aGxGV0N3dytKa1F3ak9nM3h4Ny96MzhETW9RcXNmVFVsNzRzbWRtaEhLSHFX?=
 =?utf-8?B?SW4zTzA0R3cxYXRkNWtwaGtTSVJ0VmZrMDVvR0RRZlNJQkczbGhyK1Q1REdp?=
 =?utf-8?B?VGlxckYrc3daNlZaa2FOU1JmcEo3SE0zaGhMckZPM3BIc0psNWZjMGNZZExq?=
 =?utf-8?B?emJtUk1rZGdzUXJZOTRIVE1uNnJ5NHNxanQ3aVQ1a1BMNWxOTDlCM2NFZUlF?=
 =?utf-8?B?VlVjdHVLQTNyc1VEcm55MWswTXkvNkdTZVJZWFBNbm9NT09IaUQ3YjhhY21i?=
 =?utf-8?B?dzA0VzRtK2RSVGhLcWU0ZDJURGxYMU1pL2ZmMkc0aUJqNDE2UXl0UDhYWk1R?=
 =?utf-8?B?U0hLbm84Tkh0TTFnR0lFTVB1T05WTCtnQVcvbUpUQUhSNVRhWExDa0hLYWpW?=
 =?utf-8?B?L2cwTnBRMlVLdTVaY0RuV1hDWEswUUFWSHVZWjE0SENMaldtQllaM1hHR3pu?=
 =?utf-8?B?eXFxUlMxL2h6SnFSemo5VkdpQ1N5TmNTbDlpckVPVjVQaEF6amx4TG1JSFp2?=
 =?utf-8?B?OU1YZWZWTUVoN0JNRHphRlBKMWh4M3E5RzB6TzZCUGVpTkQ3MDdmTXNjWUIw?=
 =?utf-8?B?cXc4UlJDUEUvbno2SnpmakgweWgybXF1ZWVXU0kySS96OXQ5SDR0VzBBUXpW?=
 =?utf-8?B?bEp1dTFpdnh3M2hueTlFZnpyampHS3J2NE82dW4wSVloVTdVTmpzNjgycWNU?=
 =?utf-8?B?aTFmUi9QZzJoRGtiYXgyOFQ3eUhBejBIVmx6eTFmTWNoSzRZN09tTEc4L0Iv?=
 =?utf-8?B?cmNjb3EzVmFYMG9YOVRIMk5HU2RscWxjdHA1MjFoLzNuNWw1aHFBenZZcTR5?=
 =?utf-8?B?K0JYMnF0SHdrMi9VK3c4NGJySUpWb211TEFXWWpwM20yWEtycm5LVHNRSGpR?=
 =?utf-8?B?RWNySzc0dHh4QjlEN3EyT3hVZTZQcUtJUTlEYkRxaGNyYTVpZFlvRjJacGh5?=
 =?utf-8?B?Q0IvL3hvUmk2dzBiaU50WmppWmFyamdRUVl4YUFpcDRUb3BEVmV1S1ZBZHdF?=
 =?utf-8?B?Wlk3NzVmRFM0ZG5jWHFhZkZKUXczajNNZkh3b2tQclBpdmhuaUZWdGt3VnV5?=
 =?utf-8?B?VEtoT2puRXpPdmIxZHJVdVV5aUg2K25jSlYvUGMwZVM5SUxCZHpUZVorUVZs?=
 =?utf-8?B?Z2lnR3R0WUhta0d1SzQ2VDVIUXBwR0YvMGlGWFRQR0x4TWRBTEhCK2JGd2Ro?=
 =?utf-8?B?b2g5NkpoVng2MXhZREcrUmhEa3dmb0d3QjdFSGJwZ2UxTkx0QStEUnNwV1JN?=
 =?utf-8?B?dlpTdExjVE12WkVVT01XTEg5bzlLZUwzUnpGSVZISXlacEx3bkh1Y2l5VjBQ?=
 =?utf-8?B?M1orbTFtOVFMYWNTc2w0cmR3NS8ycXdFOXliRGFNZVBCa3ViOVB1SVhMNkJ0?=
 =?utf-8?B?K0tPeHh1WFZ3em9JN1pwazJKNnh6eXAvamRPcFVvQkRnUGpMVnNtNzl4ajA0?=
 =?utf-8?B?a0dHcVZ2MWJrZzhLUGtQdmVRNDl3K2dKZHA4eklxaDBQdkFkYVRpNENPQWhB?=
 =?utf-8?B?b1czKzNiaXN3VUFzbVlIU0pxcWpjNzh0Qm9ZZE5rY3lXeUNrRVl1Z0drNkdn?=
 =?utf-8?B?Nms3NGlYcms1cld2YVhrRFM0TTRwclFiZXhQSUJHTWRRWk9qRldMSkswd2ZP?=
 =?utf-8?B?SThTT0hCM3RMS2pJUDFtQmxiSTF5OXpzSW53dFdwRk9ONk1JbHhuV3J1aXVU?=
 =?utf-8?B?cEhWUDkraHVSV2FJQjBqVGpaOFk0cjJHcWY2MkNFMUhTdkJxczZ3SXZOK3hM?=
 =?utf-8?B?Qm5OQ2VLekN2eU1pdVZucTZFNVRTMzNUcTRDcUEwME5KVkZFM3BMRFpHZ1FD?=
 =?utf-8?B?aWRpaFFWb0xYdTVuOEYvbHJYQm5YWUdoNkhSOXY5aGd2Mk1qWnBSMGxyU3ZB?=
 =?utf-8?B?SG9PcU55V2lLRitRcHY0Y0FodHlxajA0TDRTMUl2dWFZZmhSS0FGbmFzZS9h?=
 =?utf-8?B?WlQ4RWRVUnpLSFFkbWlUMEJhTHloZU0vYnNQbTNpd3Vsck82RFBLSHcwb3Rp?=
 =?utf-8?B?bS9TVUp4eHRyTXA2bGRqeVZrdEpSQU55RUQ0R1lMY0pNT0R3b2dDL2NkSWhJ?=
 =?utf-8?B?RWFMK3BVaDdMVm5Fd2dEaW1IbzgwZy9KSzJ4WnQ4TTc5Zi9aZ3JseU5YSisv?=
 =?utf-8?B?SGRUZEp2S2pwM1dQdFY1Qkdvb05jU3JvUE40QmVXRXhSalJaRG9GcEZvczZt?=
 =?utf-8?B?SFNTVnZKY1hCaWFXZXJ3bStzaUVzZTdFWVNjSDhMOGlWRFBuTzB1Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74C9ABFD181D0D44874B12BB84DB7313@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2222a1c3-fe09-4775-f41f-08d9ec9d2d86
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 13:56:46.6850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zvbt7CPk+oSCi2Zk2idTSOCEDxHPX1HcxaQ/oAG/jYkcEDds9gboUZwA4tVfHZFqBqMV5JlR1N/7yXLp+Ae2ONAhnGXDfN81qsNXWzR+j/dQqcMzOwWgLH5gXTdOcEZT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7316
X-Proofpoint-ORIG-GUID: WbXlWepGic_-tzIi8XVStgpFoPQizZnp
X-Proofpoint-GUID: WbXlWepGic_-tzIi8XVStgpFoPQizZnp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_06,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=844 mlxscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202100076

DQoNCk9uIDEwLjAyLjIyIDE1OjM2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTAuMDIuMjAy
MiAxMzo1NCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAwNy4wMi4yMiAx
NjozMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDcuMDIuMjAyMiAxNToxNywgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4gQnV0OiBXaGF0J3Mgc3RpbGwgbWlzc2luZyBo
ZXJlIHRoZW4gaXMgdGhlIHNlcGFyYXRpb24gb2YgZ3Vlc3QgYW5kIGhvc3QNCj4+PiB2aWV3cy4g
V2hlbiB3ZSBzZXQgSU5UeCBiZWhpbmQgdGhlIGd1ZXN0J3MgYmFjaywgaXQgc2hvdWxkbid0IG9i
c2VydmUgdGhlDQo+Pj4gYml0IHNldC4gT3IgaXMgdGhpcyBtZWFudCB0byBiZSBhbm90aGVyIChi
aWcpIFRPRE8/DQo+PiBXaHkgbm90PyBUaGlzIHNlZW1zIHRvIGJlIHdoZW4gYSBndWVzdCB0cmll
cyB0byBib3RoIGVuYWJsZSBNU0kvTVNJLVgNCj4+IGFuZCBJTlR4IHdoaWNoIGlzIGEgd3Jvbmcg
Y29tYmluYXRpb24uIExldCdzIHByZXRlbmQgdG8gYmUgYSByZWFsbHkNCj4+IHNtYXJ0IFBDSSBk
ZXZpY2Ugd2hpY2ggcGFydGlhbGx5IHJlamVjdHMgc3VjaCBQQ0lfQ09NTUFORCB3cml0ZSwNCj4+
IHNvIGd1ZXN0IHN0aWxsIHNlZXMgdGhlIHJlZ2lzdGVyIGNvbnNpc3RlbnQgd3J0IElOVHggYml0
LiBOYW1lbHkgaXQgcmVtYWlucw0KPj4gc2V0Lg0KPiBJJ20gYWZyYWlkIHRoaXMgd291bGRuJ3Qg
YmUgInNtYXJ0IiwgYnV0ICJidWdneSIuIEknbSBub3QgYXdhcmUgb2YNCj4gdGhlIHNwZWMgbGVh
dmluZyByb29tIGZvciBzdWNoIGJlaGF2aW9yLiBBbmQgb3VyIGVtdWxhdGlvbiBzaG91bGQNCj4g
Z2l2ZSB0aGUgZ3Vlc3QgYSBzcGVjLWNvbXBsaWFudCB2aWV3IG9mIHRoZSBkZXZpY2UuDQpUaGlz
IG1lYW5zIHdlIG5lZWQgdG8gZW11bGF0ZSBQQ0lfQ09NTUFORCBmb3IgZ3Vlc3RzIGluIHRlcm1z
DQp3ZSBuZWVkIHRvIG1haW50YWluIHRoZWlyIHN0YXRlIGp1c3QgbGlrZSB3ZSBkbyBmb3IgQkFS
cyAoaGVhZGVyLT5ndWVzdF9yZWcpDQpTbywgd2Ugd2lsbCBuZWVkIGhlYWRlci0+Z3Vlc3RfY21k
IHRvIGhvbGQgdGhlIHN0YXRlDQo+DQo+IEphbg0KPg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

